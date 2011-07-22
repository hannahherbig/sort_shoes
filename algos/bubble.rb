def bubblesort(a)
  a.start_logging

  begin
    swapped = false
    (0..(a.size - 2)).each do |i|
      if a[i] > a[i + 1]
        a[i], a[i + 1] = a[i + 1], a[i]
        swapped = true
        a.log
      end
    end
  end while swapped

  a
end