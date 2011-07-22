# bubbles ort works by going through two adjacent elements in an array and
# swapping them if the left one is greater, until the whole array is sorted.
def bubblesort(a)
  a.start_logging

  begin
    swapped = false
    (0..(a.size - 2)).each do |i|
      # compare each two adjacent elements
      if a[i] > a[i + 1]
        # swap them if the one on the left is greater
        a[i], a[i + 1] = a[i + 1], a[i]
        swapped = true
        a.log
      end
    end
  end while swapped

  a
end
