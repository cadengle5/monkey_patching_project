# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length > 0
            self.max - self.min
        end
    end

    def average
        if self.length > 0
            self.sum / (self.length * 1.00)
        end
    end

    def median 
        mid_idx = self.length / 2
        return nil if self.empty?

        if self.length.odd?
            self.sort[mid_idx]
        elsif self.length.even?
            (self.sort[mid_idx] + self.sort[mid_idx - 1]) / 2.0
        else
            return nil
        end
    end

    def counts 
        count = Hash.new {0}
        self.each { |ele| count[ele] += 1 }
        count
    end

    def my_count(num)
        count = 0
        self.each do |ele|
            if ele == num
                count += 1
            end
        end
        count
    end

    def my_index(arg)
        self.each_with_index do |ele, idx|
            if ele == arg
                return idx
            elsif !self.include?(arg)
                return nil
            end
        end
    end

    def my_uniq
        hash = {}
        self.each { |ele| hash[ele] = true }
        hash.keys
    end

    def my_transpose 
        new_arr = []
        (0...self.length).each do |row|
            new_row = []
            
            (0...self.length).each do |col|
                new_row << self[col][row]
            end
            new_arr << new_row
        end
        new_arr
    end
end
