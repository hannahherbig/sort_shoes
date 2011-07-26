def stoogesort(i=0, j=nil)
  j = array.length - 1 if j == nil
  compare(j, i)
  if array[j] < array[i]
    swap(i, j)
    log
  end

  if j - i > 1
    t = (j - i + 1) / 3
    stoogesort(i, j - t)
    stoogesort(i + t, j)
    stoogesort(i, j - t)
  end
end
