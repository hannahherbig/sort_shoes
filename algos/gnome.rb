def gnomesort(a)
  a.start_logging

  i = 0
  while i < a.length
    if i == 0 || a[i] > a[i - 1]
      i += 1
    else
      a[i], a[i - 1] = a[i - 1], a[i]
      a.log
      i -= 1
    end
  end

  a
end