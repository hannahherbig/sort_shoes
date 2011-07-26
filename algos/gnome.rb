# gnome sort is the same as insertion sort except instead of "inserting" the
# item where it belongs, it moves it through a series of swaps.
def gnomesort
  i = 0
  while i < array.length
    if i == 0
      i += 1
    else
      compare(i, i - 1)
      if array[i] > array[i - 1]
        i += 1
      else
        swap(i, i - 1)
        i -= 1
      end
    end
  end
end
