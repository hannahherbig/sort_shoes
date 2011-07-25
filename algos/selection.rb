def selectionsort
  (0...array.length).each do |j|
    m = j
    (j...array.length).each do |i|
      compare(i, m)
      m = i if array[i] < array[m]
    end

    unless m == j
      array[m], array[j] = array[j], array[m]
      log
    end
  end
end
