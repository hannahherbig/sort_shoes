def quicksort(left=0, right=nil)
  right = array.size - 1 unless right

  l, r = left, right

  if l <= r
    mid = array[(left+right)/2]
    @line = mid
    while l <= r
      compare(array.index(mid), l)
      while l <= right && array[l] < mid
        l += 1
        compare(array.index(mid), l)
      end

      compare(array.index(mid), r)
      while r > left and array[r] > mid
        r -= 1
        compare(array.index(mid), r)
      end

      if l <= r
        unless l == r
          swap(l, r)
          log
        end
        l += 1
        r -= 1
      end
    end

    if left < r
      quicksort(left, r)
    end

    if l < right
      quicksort(l, right)
    end
  end
end
