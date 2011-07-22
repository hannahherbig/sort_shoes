# None of these are in place, you see.  Note the duping.
class Array
  def quicksort
    return dup if length <= 1
    pivot = delete_at(length / 2)
    less, more = partition { |x| x <= pivot }

    less.quicksort + [pivot] + more.quicksort
  end

  def bubblesort
    a = dup
    begin
      swapped = false
      (0..(a.size - 2)).each do |i|
        if a[i] > a[i + 1]
          a[i], a[i + 1] = a[i + 1], a[i]
          swapped = true
        end
      end
    end while swapped

    a
  end

  def cocktailsort
    a = dup

    begin
      swapped = false
      0.upto(a.length - 2) do |i|
        if a[i] > a[i + 1]
          a[i], a[i + 1] = a[i + 1], a[i]
          swapped = true
        end
      end
      break unless swapped
      swapped = false
      (a.length - 2).downto(0) do |i|
        if a[i] > a[i + 1]
          a[i], a[i + 1] = a[i + 1], a[i]
          swapped = true
        end
      end
    end while swapped

    a
  end

  def insertionsort
    a = dup
    (1...a.length).each do |i|
      (0...i).each do |j|
        if a[i] < a[j]
          x = a.delete_at(i)
          a.insert(j, x)
        end
      end
    end
    a
  end

  def selectionsort
    a = dup

    (0...a.length).each do |j|
      m = a.index(a[(j)..-1].min)
      a[m], a[j] = a[j], a[m]
    end

    a
  end
end

if $0 == __FILE__
  require 'test/unit'
  class TestSortAlgorithms < Test::Unit::TestCase
    def initialize(*args)
      super
      @realz = (0..1_000).to_a
      @array = @realz.shuffle
    end

    def test_quicksort
      assert_equal @realz, @array.quicksort
    end

    def test_bubblesort
      assert_equal @realz, @array.bubblesort
    end

    def test_cocktailsort
      assert_equal @realz, @array.cocktailsort
    end

    def test_insertionsort
      assert_equal @realz, @array.insertionsort
    end

    def test_selectionsort
      assert_equal @realz, @array.selectionsort
    end
  end
end