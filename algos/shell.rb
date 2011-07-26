def shellsort
  t = [5, 3, 1]
  t.each do |h|
    h.upto(array.length - 1) do |j|
      i = j - h
      r = array[j]
      flag = 0
      while i >= 0
        compare(j, i)
        if r < array[i]
          swap(i + h, i)
          i -= h
        else
          break
        end
      end
      array[i + h] = r
      log
    end
  end
end
