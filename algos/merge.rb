def mergesort(a, left=0, right=nil)
  a.start_logging unless a.logging?

  right = a.length - 1 if right == nil
  return if left >= right
  middle = (left + right) / 2
  mergesort(a, left, middle)
  mergesort(a, middle + 1, right)
  i, end_i, j = left, middle, middle + 1
  while i <= end_i and j <= right
    if a[i] <= a[j]
      i += 1
      next
    end
    a[i], a[(i+1)...(j+1)] = a[j], a[i...j]
    a.log
    i, end_i, j = i + 1, end_i + 1, j + 1
  end

  a
end
