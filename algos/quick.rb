def quicksort(a, left=0, right=nil)
  a.start_logging unless a.logging?

  right = a.size - 1 unless right

  l, r = left, right

  if l <= r
    mid = a[(left+right)/2]
    while l <= r
      while l <= right && a[l] < mid
        l += 1
      end
      while r > left and a[r] > mid
        r -= 1
      end

      if l <= r
        unless l == r
          a[l], a[r] = a[r], a[l]
          a.log
        end
        l += 1
        r -= 1
      end
    end

    if left < r
      quicksort(a, left, r)
    end
    if l < right
      quicksort(a, l, right)
    end
  end

  a
end