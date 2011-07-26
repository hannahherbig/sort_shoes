def oddevensort(nloops=2)
  begin
    finished = true
    nloops.times do |n|
      (n...(array.length - 1)).step(nloops) do |i|
        compare(i, i + 1)
        if array[i] > array[i + 1]
          swap(i, i + 1)
          finished = false
        end
      end
    end
  end until finished
end
