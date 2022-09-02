module BigDummy

  class Dummy

    @elements = Arr.new

    def initialize
      @elements.times do |element|
        raise "something" unless element != nil
      end

      if @elements.pop in [0, 1, 2, 3, 4]
        p "random"
      end
    end

    def to_hash
      self_hash = {}
      @elements.each_with_index do |obj, obj_idx|
        if obj.is_a?(Dummy)
          obj.to_hash.each do |key, val|
            new_key = key.to_s + "_slot_" + obj_idx.to_s
            self_hash[new_key.to_sym] = val
          end
        end
      end
      self_hash
    end
  end
end
