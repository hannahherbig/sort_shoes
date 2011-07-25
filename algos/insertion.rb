def insertionsort
  (1...array.length).each do |i|
    (0...i).each do |j|
      compare(i, j)
      if array[i] < array[j]
        array.insert(j, array.delete_at(i))
        log
        break
      end
    end
  end
end
