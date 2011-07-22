# cocktail sort is the same as bubblesort except it also runs backwards
# swapping elements after it goes forwards.
def cocktailsort(a)
  a.start_logging

  begin
    swapped = false
    # forwards - same as bubblesort
    0.upto(a.length - 2) do |i|
      # compare each two adjacent elements
      if a[i] > a[i + 1]
        # if the left one is greater, swap them
        a[i], a[i + 1] = a[i + 1], a[i]
        a.log
        swapped = true
      end
    end

    break unless swapped

    swapped = false
    # backwards - the reverse of bubblesort
    (a.length - 2).downto(0) do |i|
      if a[i] > a[i + 1]
        a[i], a[i + 1] = a[i + 1], a[i]
        a.log
        swapped = true
      end
    end
  end while swapped

  a
end
