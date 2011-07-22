class Array
  def sorted?
    0.upto(size - 2) do |i|
      return false unless at(i) < at(i + 1)
    end

    return true
  end
end

def radixsort(a)
  a.start_logging

  shift = 1
  zeroes = []
  ones = []
  until a.sorted?
    orig = a.dup
    until orig.empty?
      item = orig.shift
      if (item & shift) == 0
        zeroes.push item
      else
        ones.push item
      end

      a.replace(zeroes + orig + ones)

      a.log

      break if a.sorted?
    end

    a.log
    shift <<= 1
    zeroes = []
    ones = []
  end

  a
end
