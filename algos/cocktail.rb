def cocktailsort(a)
  a.start_logging

  begin
    swapped = false
    0.upto(a.length - 2) do |i|
      if a[i] > a[i + 1]
        a[i], a[i + 1] = a[i + 1], a[i]
        a.log
        swapped = true
      end
    end

    break unless swapped

    swapped = false
    (a.length - 2).downto(0) do |i|
      if a[i] > a[i + 1]
        a[i], a[i + 1] = a[i + 1], a[i]
        a.log
        swapped = true
      end
    end
  end while swapped

  a
end