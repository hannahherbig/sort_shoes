# cocktail sort is the same as bubblesort except it also runs backwards
# swapping elements after it goes forwards.
def cocktailsort
  begin
    swapped = false
    # forwards - same as bubblesort
    0.upto(array.length - 2) do |i|
      # compare each two adjacent elements
      compare(i, i + 1)
      if array[i] > array[i + 1]
        # if the left one is greater, swap them
        swap(i, i + 1)
        #log
        swapped = true
      end
    end

    break unless swapped

    swapped = false
    # backwards - the reverse of bubblesort
    (array.length - 2).downto(0) do |i|
      compare(i, i + 1)
      if array[i] > array[i + 1]
        swap(i, i + 1)
        #log
        swapped = true
      end
    end
  end while swapped
end
