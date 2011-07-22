def shellsort(a)
  a.start_logging

  t = [5, 3, 1]
  t.each do |h|
    h.upto(a.length - 1) do |j|
      i = j - h
      r = a[j]
      flag = 0
      while i >= 0
        if r < a[i]
          a[i + h], a[i] = a[i], a[i + h]
          i -= h
          a.log
        else
          break
        end
      end
      a[i + h] = r
      a.log
    end
  end

  a
end
