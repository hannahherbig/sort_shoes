def selectionsort
  (0...array.length).each do |j|
    m = 0
    (1...array.length).each do |i|
      compare(m, i)
      m = i if array[m] > array[i]
    end

    unless m == j
      array[m], array[j] = array[j], array[m]
      log
    end
  end
end
