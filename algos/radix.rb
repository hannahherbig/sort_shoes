class Array
  def sorted?
    0.upto(size - 2) do |i|
      return false unless at(i) < at(i + 1)
    end

    return true
  end
end

def radixsort
  shift = 1
  zeroes = []
  ones = []
  until array.sorted?
    orig = array.dup
    until orig.empty?
      item = orig.shift
      if (item & shift) == 0
        zeroes.push item
      else
        ones.push item
      end

      array.replace(zeroes + orig + ones)

      log
    end

    log
    shift <<= 1
    zeroes = []
    ones = []
  end
end
