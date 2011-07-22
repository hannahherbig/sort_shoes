def insertionsort(a)
  a.start_logging

  (1...a.length).each do |i|
    (0...i).each do |j|
      if a[i] < a[j]
        a.insert(j, a.delete_at(i))
        a.log
      end
    end
  end

  a
end