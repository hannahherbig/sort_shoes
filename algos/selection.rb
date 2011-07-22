def selectionsort(a)
  a.start_logging
  (0...a.length).each do |j|
    m = a.index(a[(j)..-1].min)
    unless m == j
      a[m], a[j] = a[j], a[m]
      a.log
    end
  end

  a
end
