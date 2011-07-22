def combsort(a)
  a.start_logging

  gap = a.length
  swaps = false
  loop do
    gap = (gap / 1.25).to_i
    swaps = false
    0.upto(a.length - gap - 1) do |i|
      if a[i] > a[i + gap]
        a[i], a[i + gap] = a[i + gap], a[i]
        a.log
        swaps = true
      end
    end
    break if not swaps and gap < 1
  end

  a
end
