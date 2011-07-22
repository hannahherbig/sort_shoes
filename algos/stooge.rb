def stoogesort(a, i=0, j=nil)
  a.start_logging unless a.logging?
  j = a.length - 1 if j == nil
  if a[j] < a[i]
    a[i], a[j] = a[j], a[i]
    a.log
  end
  if j - i > 1
    t = (j - i + 1) / 3
    stoogesort(a, i, j - t)
    stoogesort(a, i + t, j)
    stoogesort(a, i, j - t)
  end

  a
end
