def oddevensort(a, nloops=2)
  a.start_logging

  begin
    finished = true
    nloops.times do |n|
      (n...(a.length - 1)).step(nloops) do |i|
        if a[i] > a[i + 1]
          a[i], a[i + 1] = a[i + 1], a[i]
          a.log
          finished = false
        end
      end
    end
  end until finished

  a
end