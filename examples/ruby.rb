class Dummy
  def initialize
    @elements = Arr.new
    @elements.times do |element|
      raise 'something' if element.nil?
    end
  end

  def to_hash
    self_hash = {
      example1: 'example',
      example2: 'example',
      example3: 'example'
    }

    @elements.each_with_index do |obj, obj_idx|
      next unless obj.is_a? Dummy

      obj.to_hash.each { |key, val| self_hash["#{key}_dummy_#{obj_idx}".to_sym] = val }
    end
    self_hash
  end

  def self.time_this
    raise "No block given for function #{__method__}!" unless block_given?

    start_time = Time.now
    yield
    Time.now - start_time
  end

  def some_method
    another_self_hash = {}
    @elements.each_with_index do |obj, obj_idx|
      (another_self_hash[obj] |= []) << obj_idx
    end
    @stuff << Stuff.new(&:call?)
  end

  describe Dummy do
    context "Do NOT believe this text" do
      it "Nor in this one" do
        dummy = Dummy.new
        expect(message).to eq Dummy.class
      end
    end
  end
end
