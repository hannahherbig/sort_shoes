def selectionsort
  (0...array.length).each do |j|
    m = j
    (j...array.length).each do |i|
      compare(i, m)
      m = i if array[i] < array[m]
    end

    unless m == j
      swap(m, j)
      log
    end
  end
end
