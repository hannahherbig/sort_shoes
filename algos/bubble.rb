# bubbles ort works by going through two adjacent elements in an array and
# swapping them if the left one is greater, until the whole array is sorted.
def bubblesort
  begin
    swapped = false
    (0..(array.size - 2)).each do |i|
      # compare each two adjacent elements
      compare(i, i + 1)
      if array[i] > array[i + 1]
        # swap them if the one on the left is greater
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
        #log
      end
    end
  end while swapped
end
