##################################################################################################
#######                                 File Description                                 #########
##################################################################################################
#
# filename:      ds_cmd_tests.rb
# created:       11/02/2021
# company:       Visiona Tecnologia Espacial S.A.
# developer:     Bruno Moura
# utility:       Used to provide support to COSMOS Test Runner over DS app.
#
# notes:
#     Since DS tables are constantly altered due to mission planning and functional tests
#     this set of tests was performed on commit (903eae3199ca2b62cef580e080b303ba8d3673ef) of
#     the cFS DS application, in which it is guaranteed to work.
#
# old notes:
#     Implement how to rite tables sc_atsx.tbl and sc_rtsx.tbl from COSMOS Command Sequence.
#
##################################################################################################
#######                               End File Description                               #########
##################################################################################################

require "fileutils"
require_relative "ds_tests"

class DsCmdTests < Cosmos::Test

  @@version = "1.1.0"

  def initialize

    super
    @UV = Utils_visiona
    @file_name_counter = 0
  end

  def get_file_name_counter

    curr_value = @file_name_counter
    @file_name_counter = @file_name_counter + 1
    curr_value.to_s
  end

  def setup

    @UV.establish_communication

    # Ensure Satellite is in ATB mode
    raise "Satellite not in ATB Mode" unless @UV.is_ATB_mode?(45)

    @UV.enable_tlm_group(:ATB)

    begin
      @UV.get_new_hk_tlm("DS")
    rescue
      @UV.start_app("DS")
    end

    begin
      @UV.get_new_hk_tlm("FM")
    rescue
      @UV.start_app("FM")
    end

    DSTest.set_app_state(:DISABLED)
    DSTest.reset_counters

    @UV.disable_all_fdir

    @downlinked_idx = 0
  end

  def setup_downlinked_name(file_name)

    new_name = file_name.sub(".", "_#{@downlinked_idx}.")
    @downlinked_idx = @downlinked_idx + 1
    return new_name
  end

  # Auxiliar cuntion
  def perform_filter_by_time(dest_path)

    dest_path = setup_downlinked_name(dest_path)

    @UV.send_validated_cmd("DS", "DS_SET_FILTER_TYPE with MESSAGEID #{DSTest::DS_FILE_INFO_MID}, FILTERPARAMSINDEX 1, FILTERTYPE BY_TIME")
    @UV.send_validated_cmd("DS", "DS_SET_FILTER_PARAMS with MESSAGEID #{DSTest::DS_FILE_INFO_MID}, FILTERPARAMSINDEX 0, ALG_N 1, ALG_X 1, ALG_O 0")

    DSTest.enable_filter(DSTest::DS_FILE_INFO_MID, DSTest::DS_FILE_INFO_FILE_TBL_IDX)

    cmd_raw_no_hazardous_check("TO TO_DISABLE_OUTPUT")

    # ensure_mcd_sent won't work since TO is disabled
    cmd("DS DS_GET_FILE_INFO")
    # After seding a single command, disable the current storage file
    # so that no more packets directed to this storage file are stored
    cmd("DS DS_SET_DEST_STATE with FILETABLEINDEX #{DSTest::DS_FILE_INFO_FILE_TBL_IDX}, ENABLESTATE 0")
    @UV.establish_communication

    # Wait for live telemetry
    wait(DSTest::DEFAULT_TIMEOUT * 2)

    # Check if the ".ds" file was created, representing a single DS FILE_INFO packet
    file_path = DSTest.find_file_with_termination(".ds")
    # Download the file
    @UV.downlinkTransfer(file_path, dest_path, custom_wait:60)

    validator = get_tlm_cnt("DS", "DS_FILEINFOPKT")
    # Read the downloaded file, which should make so that
    # the telemetry counter for DS_FILEINFOPKT is increased
    # by the packet generated while TO was disabled
    cmd("DSFILE DSFILE_PROCESS with FILE_PATHNAME '#{dest_path}'")

    wait(DSTest::DEFAULT_TIMEOUT * 2)

    check_expression("get_tlm_cnt(\"DS\", \"DS_FILEINFOPKT\") == #{validator + 1}")
  end

  def perform_filter_by_count(dest_path, change_filter_params:false)

    dest_path = setup_downlinked_name(dest_path)
    @UV.send_validated_cmd("DS",
    "DS_SET_FILTER_TYPE with MESSAGEID #{DSTest::DS_FILE_INFO_MID}, FILTERPARAMSINDEX 0, FILTERTYPE BY_COUNT")

    if change_filter_params
      # Used when testing filter params
      @UV.send_validated_cmd("DS",
        "DS_SET_FILTER_PARAMS with MESSAGEID #{DSTest::DS_FILE_INFO_MID}, FILTERPARAMSINDEX 0, ALG_N 1, ALG_X 3, ALG_O 0"
      )
    else
      # Used on default case
      @UV.send_validated_cmd("DS",
        "DS_SET_FILTER_PARAMS with MESSAGEID #{DSTest::DS_FILE_INFO_MID}, FILTERPARAMSINDEX 0, ALG_N 1, ALG_X 1, ALG_O 0"
      )
    end
    DSTest.enable_filter(DSTest::DS_FILE_INFO_MID, DSTest::DS_FILE_INFO_FILE_TBL_IDX)

    cmd_raw_no_hazardous_check("TO TO_DISABLE_OUTPUT")

    num_cmds = 5
    if change_filter_params
      # Used when testing filter params
      num_cmds = 9
    end

    num_cmds.times {
      # ensure_mcd_sent won't work since TO is disabled
      cmd("DS DS_GET_FILE_INFO")
    }

    wait(DSTest::DEFAULT_TIMEOUT * 2)

    # After seding (num_cmds) commands, disable the current storage file so that no more
    # packets directed to this storage file are stored; in this case the same as DSTest.disable_storage_file()
    # is performed, but without validation checks once the TO still disabled
    cmd("DS DS_SET_DEST_STATE with FILETABLEINDEX #{DSTest::DS_FILE_INFO_FILE_TBL_IDX}, ENABLESTATE 0")

    @UV.establish_communication

    # Wait for live telemetry
    wait(DSTest::DEFAULT_TIMEOUT)

    # Check if the ".ds" file was created, representing (num_cmds) DS FILE_INFO packet
    file_path = DSTest.find_file_with_termination(".ds")
    @UV.downlinkTransfer(file_path, dest_path, custom_wait:40)

    validator = get_tlm_cnt("DS", "DS_FILEINFOPKT")
    # Read the downloaded file, which should make so that the telemetry counter for
    # DS_FILEINFOPKT is increased by the packets generated while TO was disabled
    cmd("DSFILE DSFILE_PROCESS with FILE_PATHNAME '#{dest_path}'")
    if change_filter_params
      # Used when testing filter params, since 9 commands are sent
      # and the filter is set to capture one of each 3 packets
      num_cmds = num_cmds / 3
    end

    wait(DSTest::DEFAULT_TIMEOUT * 2)

    received_packets = get_tlm_cnt("DS", "DS_FILEINFOPKT")
    check_expression("#{received_packets } == #{validator + num_cmds}")
  end

  # Tests command DS_NOOP (FC = 0) - passing
  def test_ds_noop

    @UV.print_current_test_info(@@version)
    setup

    @UV.send_validated_cmd("DS", "DS_NOOP")
  end

  # Tests command DS_RESET_COUNTERS (FC = 1) - passing
  def test_ds_reset_counters


    @UV.print_current_test_info(@@version)
    setup

    5.times { @UV.send_validated_cmd("DS", "DS_NOOP") }
    DSTest.reset_counters
  end

  # Tests command DS_SET_APP_STATE (FC = 2) - passing
  def test_ds_set_app_state

    @UV.print_current_test_info(@@version)
    setup

    status = tlm("DS DS_HK_PACKET APPENABLESTATE")
    next_status = (status + 1 ) % 2
    cmd("DS DS_SET_APP_STATE with ENABLESTATE #{next_status}")
    wait_check("DS DS_HK_PACKET APPENABLESTATE == #{next_status}", @UV::DEFAULT_TIMEOUT)
  end

  # Tests command DS_SET_FILTER_FILE (FC = 3) - passing
  def test_ds_set_filter_file

    @UV.print_current_test_info(@@version)
    setup

    path = "/cf/ram/reserved/"
    to_be_deleted = "/cf/ram/reserved/ds_test/" # ensurance
    # Delete all files from directory and trigger the test filter
    DSTest.clear_dir(to_be_deleted)
    DSTest.delete_dir(to_be_deleted)
    DSTest.clear_dir(path)

    directory_test_name = "/cf/ram/reserved/ds_test/"
    @UV.send_validated_cmd(
      "DS",
      "DS_SET_DEST_PATH with FILETABLEINDEX #{DSTest::EPS_HK_FILE_TBL_IDX}, PATHNAME '#{path}'"
    )

    DSTest.enable_filter(DSTest::EPS_HK_MID, DSTest::EPS_HK_FILE_TBL_IDX)

    wait(DSTest::DEFAULT_TIMEOUT * 2)

    fm_counter = get_tlm_cnt("FM", "FM_DIRLISTPKT")
    # Access FM telemetry to check if files according to test filter are beeing created
    cmd("FM FM_GET_DIR_PKT with DIRECTORY #{path}, DIRLISTOFFSET 0, GET_SIZE_TIME_MODE 0")

    wait(@UV::DEFAULT_TIMEOUT)

    # Wait for the telemetry
    file_name_expr = "tlm(\"FM FM_DIRLISTPKT FILE1_NAME\") != ''"
    next_fm_counter = get_tlm_cnt("FM", "FM_DIRLISTPKT")

    fm_counter_expr = "#{next_fm_counter } == #{fm_counter + 1}"
    check_expression("#{file_name_expr} and #{fm_counter_expr}")

    created_file = tlm("FM FM_DIRLISTPKT FILE1_NAME")

    file_start_expr = "\"#{created_file}\".include? \"#{DSTest::DEFAULT_TEST_FILE_START}\""
    file_ext_expr = "\"#{created_file}\".include? \"#{DSTest::DEFAULT_TEST_FILE_EXT}\""
    check_expression("#{file_start_expr} or #{file_ext_expr}")

    # Cleanup: set the path as its first value to ensure that no other tests
    # will be affected by the sent commands
    initial_path = "/cf/ram/"
    @UV.send_validated_cmd(
      "DS",
      "DS_SET_DEST_PATH with FILETABLEINDEX #{DSTest::EPS_HK_FILE_TBL_IDX}, PATHNAME '#{initial_path}'"
    )
  end

  # Tests command DS_SET_FILTER_TYPE (FC = 4) - passing
  def test_ds_set_filter_type

    @UV.print_current_test_info(@@version)
    setup

    directory_path = "/cf/ram/reserved/"
    dest_path = DSTest::DOWNLINK_DIR + get_file_name_counter + DSTest::DEFAULT_FILENAME

    # Clear all files from /cf/ram directory and disable the used storage file
    DSTest.disable_storage_file(DSTest::DS_FILE_INFO_FILE_TBL_IDX)
    DSTest.clear_dir(directory_path)

    # Trigger example filtering by time
    perform_filter_by_time(dest_path)

    DSTest.disable_storage_file(DSTest::DS_FILE_INFO_FILE_TBL_IDX)
    DSTest.clear_dir(directory_path)

    # Trigger example filtering by count
    perform_filter_by_count(dest_path)
  end

  # Tests command DS_SET_FILTER_PARAMS (FC = 5) - passing
  def test_ds_set_filter_params

    @UV.print_current_test_info(@@version)
    setup

    directory_path = "/cf/ram/reserved/"
    dest_path = DSTest::DOWNLINK_DIR + get_file_name_counter + DSTest::DEFAULT_FILENAME

    # Clear all files from /cf/ram directory and disable the used storage file
    DSTest.disable_storage_file(DSTest::DS_FILE_INFO_FILE_TBL_IDX)
    DSTest.clear_dir(directory_path)

    # Trigger example filtering by count on it's default options
    perform_filter_by_count(dest_path)

    DSTest.disable_storage_file(DSTest::DS_FILE_INFO_FILE_TBL_IDX)
    DSTest.clear_dir(directory_path)

    # Trigger example filtering by count changing the filter parameters
    perform_filter_by_count(dest_path, change_filter_params:true)
  end

  # Tests command DS_SET_DEST_NAME_TYPE (FC = 6) - passing
  def test_ds_set_dest_name_type

    @UV.print_current_test_info(@@version)
    setup

    # Triggers the action on the defined test filter
    DSTest.enable_filter(DSTest::EPS_HK_MID, DSTest::EPS_HK_FILE_TBL_IDX)

    wait(8)
    # check current name for file table index 6 (test)
    file_name = DSTest.find_file_with_termination(".tst")
    file_name = file_name[/valid.*/]
    old_file = file_name[/[0-9]+/].to_i

    # now change file dest type
    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_NAME_TYPE with FILETABLEINDEX 0, FILENAMETYPE BY_TIME"
    )
    @UV.send_validated_cmd("DS", "DS_CLOSE_ALL")

    num_cmds = 5
    # Now populate something to generate new file
    num_cmds.times {
      @UV.send_validated_cmd("DS", "DS_NOOP")
    }

    wait(8)
    file_name = DSTest.find_file_with_termination(".tst")
    file_name = file_name[/valid.*/]
    file_name = file_name[/[0-9]+/].to_i

    # now change file dest type
    check_expression("#{old_file} < #{file_name + 1}")

    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_NAME_TYPE with FILETABLEINDEX 0, FILENAMETYPE BY_COUNT"
    )
    @UV.send_validated_cmd("DS", "DS_CLOSE_ALL")

    (num_cmds * 2).times {
      @UV.send_validated_cmd("DS", "DS_NOOP")
    }

    file_name = DSTest.find_file_with_termination(".tst")
    file_name = file_name[/valid.*/]
    file_name = file_name[/[0-9]+/].to_i

    check_expression("#{old_file} < #{file_name + 1}")
  end

  # Tests command DS_SET_DEST_STATE (FC = 7) - passing
  def test_ds_set_dest_state

    @UV.print_current_test_info(@@version)
    setup

    # Set state with 0 and check if it's changed.
    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_STATE with FILETABLEINDEX #{DSTest::EPS_HK_FILE_TBL_IDX}, ENABLESTATE 0"
    )

    DSTest.get_new_fileinfopkt
    wait_check_expression("tlm(\"DS DS_FILEINFOPKT ENABLESTATE_#{DSTest::EPS_HK_FILE_TBL_IDX}\") == 0", @UV::DEFAULT_TIMEOUT)

    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_STATE with FILETABLEINDEX #{DSTest::EPS_HK_FILE_TBL_IDX}, ENABLESTATE 1"
    )

    DSTest.get_new_fileinfopkt
    wait_check_expression("tlm(\"DS DS_FILEINFOPKT ENABLESTATE_#{DSTest::EPS_HK_FILE_TBL_IDX}\") == 1", @UV::DEFAULT_TIMEOUT)
  end

  # Tests command DS_SET_DEST_PATH (FC = 8) - passing
  def test_ds_set_dest_path

    @UV.print_current_test_info(@@version)
    setup

    directory_test_name = "/cf/ram/reserved/ds_test/"

    # Create a directory to test
    # Try to delete this first.
    cmd("FM FM_DELETE_DIR with DIRECTORY '#{directory_test_name}'")
    cmd("FM FM_CREATE_DIR with DIRECTORY '#{directory_test_name}'")

    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_PATH with FILETABLEINDEX 1, PATHNAME '#{directory_test_name}'"
    )
    @UV.send_validated_cmd("DS", "DS_CLOSE_ALL")

    # Trigger file storage
    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_STATE with FILETABLEINDEX 1, ENABLESTATE 1"
    )
    DSTest.set_app_state(:ENABLED)

    # Wait for file populate
    wait(DSTest::DEFAULT_TIMEOUT)

    # Check if it's succeeded
    DSTest.get_new_fileinfopkt
    wait_check_expression("tlm(\"DS DS_FILEINFOPKT FILENAME_1\").include?(\"#{directory_test_name}\")", @UV::DEFAULT_TIMEOUT)
  end

  # Tests command DS_SET_DEST_BASE (FC = 9) - passing
  def test_ds_set_dest_base

    @UV.print_current_test_info(@@version)
    setup

    test_base_name = "tbn"

    DSTest.set_app_state(:ENABLED)
    DSTest.get_new_fileinfopkt

    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_BASE with FILETABLEINDEX 1, BASENAME '#{test_base_name}'"
    )
    @UV.send_validated_cmd("DS", "DS_CLOSE_ALL")
    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_STATE with FILETABLEINDEX 1, ENABLESTATE 1"
    )

    # Wait for telemetry to create file.
    wait(DSTest::DEFAULT_TIMEOUT)

    DSTest.get_new_fileinfopkt

    # Check if command is ok
    wait_check_expression("tlm(\"DS DS_FILEINFOPKT FILENAME_1\").include?(\"#{test_base_name}\")", @UV::DEFAULT_TIMEOUT)
  end

  # Tests command DS_SET_DEST_EXT (FC = 10) - passing
  def test_ds_set_dest_ext

    @UV.print_current_test_info(@@version)
    setup

    test_extension = ".ext"

    DSTest.set_app_state(:ENABLED)
    DSTest.get_new_fileinfopkt

    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_STATE with FILETABLEINDEX 1, ENABLESTATE 1"
    )
    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_EXT with FILETABLEINDEX 1, EXTENSION '#{test_extension}'"
    )
    @UV.send_validated_cmd("DS", "DS_CLOSE_ALL")

    # Wait for telemetry to create file.
    wait(DSTest::DEFAULT_TIMEOUT)

    DSTest.get_new_fileinfopkt
    # Check if command is ok
    wait_check_expression("tlm(\"DS DS_FILEINFOPKT FILENAME_1\").include?(\"#{test_extension}\")", @UV::DEFAULT_TIMEOUT)
  end

  # Tests command DS_SET_DEST_SIZE (FC = 11) - passing, but can be enhanced
  def test_ds_set_dest_size

    @UV.print_current_test_info(@@version)
    setup

    # This is bits, file should be closed and new file generated within each set of telemetries
    test_size = 1560
    table_idx = 6

    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_SIZE with FILETABLEINDEX #{table_idx}, MAXFILESIZE #{test_size}"
    )
    DSTest.enable_filter(DSTest::EPS_HK_MID, DSTest::EPS_HK_FILE_TBL_IDX)

    # Wait for telemetry to create file index 1.
    wait(DSTest::DEFAULT_TIMEOUT)

    DSTest.get_new_fileinfopkt
    validator = tlm("DS DS_FILEINFOPKT FILENAME_#{table_idx}")

    # Wait for 2 sets of telemetry
    wait(DSTest::DEFAULT_TIMEOUT * 2)

    DSTest.get_new_fileinfopkt
    # Check if command is ok
    wait_check_expression("tlm(\"DS DS_FILEINFOPKT FILENAME_#{table_idx}\") != \"#{validator}\"", @UV::DEFAULT_TIMEOUT)
  end

  # Tests command DS_SET_DEST_AGE (FC = 12) - passing
  def test_ds_set_dest_age

    @UV.print_current_test_info(@@version)
    setup

    # This is seconds, file should be closed and new file generated within each set of telemetries
    age = 61
    table_idx = 6
    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_AGE with FILETABLEINDEX #{table_idx}, MAXFILEAGE #{age}"
    )
    DSTest.enable_filter(DSTest::EPS_HK_MID, DSTest::EPS_HK_FILE_TBL_IDX)

    # Wait for telemetry to create file index 1.
    wait(DSTest::DEFAULT_TIMEOUT)

    DSTest.get_new_fileinfopkt
    validator = tlm("DS DS_FILEINFOPKT FILENAME_#{table_idx}")

    # Wait for fileage
    wait(age + 5)
    DSTest.get_new_fileinfopkt

    # Check if command is ok
    wait_check_expression("tlm(\"DS DS_FILEINFOPKT FILENAME_#{table_idx}\") != \"#{validator}\"", @UV::DEFAULT_TIMEOUT)
  end

  # Tests command DS_SET_DEST_COUNT (FC = 13) - passing
  def test_ds_set_dest_count

    @UV.print_current_test_info(@@version)
    setup

    DSTest.get_new_fileinfopkt

    validator = tlm("DS DS_FILEINFOPKT SEQCOUNT_0")
    validator += rand(100)

    @UV.send_validated_cmd("DS",
      "DS_SET_DEST_COUNT with FILETABLEINDEX 0, SEQUENCECOUNT #{validator}"
    )

    DSTest.get_new_fileinfopkt

    # Check if command is ok
    wait_check_expression("tlm(\"DS DS_FILEINFOPKT SEQCOUNT_0\") == #{validator}", @UV::DEFAULT_TIMEOUT)
  end

  # Tests command DS_CLOSE_FILE (FC = 14) - passing
  def test_ds_close_file

    @UV.print_current_test_info(@@version)
    setup

    DSTest.enable_filter(DSTest::EPS_HK_MID, DSTest::EPS_HK_FILE_TBL_IDX)
    DSTest.find_file_with_termination(".tst")
  end

  # Tests command DS_GET_FILE_INFO (FC = 15) - passing
  def test_ds_get_file_info

    @UV.print_current_test_info(@@version)
    setup

    DSTest.enable_filter(DSTest::EPS_HK_MID, DSTest::EPS_HK_FILE_TBL_IDX)
    DSTest.get_new_fileinfopkt
  end

  # Tests command DS_ADD_MID (FC = 16)
  def test_ds_add_mid

    @UV.print_current_test_info(@@version)
    setup

    #@UV.skip_test("Must find another MID for this test, since FM is already used. Possible use ADS also to simulate the message.")

    directory_path = "/cf/ram/reserved/"
    # set file name accordingly to current test
    dest_path = DSTest::DOWNLINK_DIR + get_file_name_counter + DSTest::DEFAULT_FILENAME

    DSTest.set_app_state(:ENABLED)
    @UV.send_validated_cmd("DS", "DS_CLOSE_ALL")
    DSTest.clear_dir(directory_path)

    #DSTest.enable_filter(DSTest::HAL_CAM_ATM_BAFFLE_DPL_HK_TLM_MID, DSTest::EPS_HK_FILE_TBL_IDX)

    @UV.send_validated_cmd("DS", "DS_ADD_MID with MESSAGEID #{DSTest::HAL_CAM_INTERFACE_DATA_TLM_MID}")
    DSTest.enable_filter(DSTest::HAL_CAM_INTERFACE_DATA_TLM_MID, DSTest::EPS_HK_FILE_TBL_IDX)
    @UV.send_validated_cmd(
      "DS",
      "DS_SET_FILTER_PARAMS with MESSAGEID #{DSTest::HAL_CAM_INTERFACE_DATA_TLM_MID}, FILTERPARAMSINDEX 0, ALG_N 1, ALG_X 1, ALG_O 0"
    )

    # create a dummy packet to be used by a not necessairily running app
    hal_cam_packet = Cosmos::System.telemetry.packet("HAL_CAM", "HAL_CAM_INTERFACE_DATA_PACKET")
    hal_cam_packet.write("CCSDS_STREAMID", DSTest::HAL_CAM_INTERFACE_DATA_TLM_MID)
    hal_cam_packet.write("EQUIPMENT_NODE_ID", 1)

    @UV.start_app("ADS")

    num_cmds = 4
    num_cmds.times {
      @UV.simulate_packet(hal_cam_packet)
    }

    wait(@UV::DEFAULT_TIMEOUT)

    file_name = DSTest.find_file_with_termination(".tst")
    @UV.downlinkTransfer(file_name, dest_path, custom_wait:40)
    validator = get_tlm_cnt("HAL_CAM", "HAL_CAM_INTERFACE_DATA_PACKET")

    cmd("DSFILE DSFILE_PROCESS with FILE_PATHNAME '#{dest_path}'")
    wait(@UV::DEFAULT_TIMEOUT)

    after_validator = get_tlm_cnt("HAL_CAM", "HAL_CAM_INTERFACE_DATA_PACKET")

    check_expression("#{after_validator} == #{validator + num_cmds}")
  end

  # Tests command DS_CLOSE_ALL (FC = 17) - passing
  def test_ds_close_all

    @UV.print_current_test_info(@@version)
    setup

    DSTest.enable_filter(DSTest::EPS_HK_MID, DSTest::EPS_HK_FILE_TBL_IDX)
    DSTest.get_new_fileinfopkt

    validator = tlm("DS DS_FILEINFOPKT FILENAME_6")

    @UV.send_validated_cmd("DS", "DS_CLOSE_ALL")
    # Wait for telemetry to create file.
    wait(5)

    DSTest.get_new_fileinfopkt
    wait_check_expression("tlm(\"DS DS_FILEINFOPKT FILENAME_6\") != \"#{validator}\"", @UV::DEFAULT_TIMEOUT)
  end

  # Tests command DS_SEND_HK (FC = 18) - passing
  def test_ds_send_hk

    @UV.print_current_test_info(@@version)
    setup

    validator = get_tlm_cnt("DS", "DS_HK_PACKET")
    cmd("DS", "DS_SEND_HK")
    wait_check_expression("get_tlm_cnt(\"DS\", \"DS_HK_PACKET\") > #{validator}", @UV::DEFAULT_TIMEOUT)
  end
end
