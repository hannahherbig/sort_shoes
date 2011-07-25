def combsort
  gap = array.length
  swaps = false
  loop do
    gap = (gap / 1.25).to_i

    break if gap < 1

    swaps = false
    0.upto(array.length - gap - 1) do |i|
      compare(i, i + gap)
      if array[i] > array[i + gap]
        array[i], array[i + gap] = array[i + gap], array[i]
        #log
        swaps = true
      end
    end

    break if not swaps
  end

  a
end
