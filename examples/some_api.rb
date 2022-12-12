module BigDummy

  class Dummy

    def initialize

      @elements = Arr.new
      @elements.times do |element|
        raise "something" unless element != nil
      end

      if @elements.pop in [0, 1, 2, 3, 4]
        p "random" + __method__
      end
    end

    def to_hash

      self_hash = {
        :example1 => "example",
        :example2 => "example",
        :example3 => "example",
      }
      @elements.each_with_index do |obj, obj_idx|
        if obj.is_a?(Dummy)
          obj.to_hash.each do |key, val|
            new_key = "#{key.to_s}_dummy_#{obj_idx.to_s}".to_sym
            self_hash[new_key] = val
          end
        end
      end
      self_hash
    end
  end
end
