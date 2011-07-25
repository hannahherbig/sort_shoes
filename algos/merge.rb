def mergesort(left=0, right=nil)
  right = array.length - 1 if right == nil
  return if left >= right
  middle = (left + right) / 2
  mergesort(left, middle)
  mergesort(middle + 1, right)
  i, end_i, j = left, middle, middle + 1
  while i <= end_i and j <= right
    compare(i, j)
    if array[i] <= array[j]
      i += 1
      next
    end
    array[i], array[(i+1)...(j+1)] = array[j], array[i...j]
    log
    i, end_i, j = i + 1, end_i + 1, j + 1
  end
end
