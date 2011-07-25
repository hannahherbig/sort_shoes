Shoes.app :width => 500, :height => 700, :resizable => false do
  @width       = 500
  @point_width = 5
  @line        = 0

  def array
    @array
  end

  # call this with the two indices of the values you're about to compare
  def compare(*indices)
    @slot.clear do
      background darkgray
      @array.each_index do |i|
        if indices.include? i
          fill red
          stroke red
        else
          fill black
          stroke black
        end

        rect(i * @point_width, array[i] * @point_width, @point_width,
        @width - array[i] * @point_width)
      end

      stroke gray
      line(0, @line * @point_width, @width, @line * @point_width)
    end

    wait
  end

  # call this after you change the array
  def log
    @slot.clear do
      background darkgray
      fill black
      stroke black

      @array.each_index do |i|
        rect(i * @point_width, array[i] * @point_width, @point_width,
        @width - array[i] * @point_width)
      end

      stroke gray
      line(0, @line * @point_width, @width, @line * @point_width)
    end

    wait
  end

  def wait
    sleep 1.0/30.0
  end

  def quicksort(left=0, right=nil)
    right = array.size - 1 unless right

    l, r = left, right

    if l <= r
      mid = array[(left+right)/2]
      @line = mid
      while l <= r
        compare(array.index(mid), l)
        while l <= right && array[l] < mid
          l += 1
          compare(array.index(mid), l)
        end

        compare(array.index(mid), r)
        while r > left and array[r] > mid
          r -= 1
          compare(array.index(mid), r)
        end

        if l <= r
          unless l == r
            array[l], array[r] = array[r], array[l]
            log
          end
          l += 1
          r -= 1
        end
      end

      if left < r
        quicksort(left, r)
      end

      if l < right
        quicksort(l, right)
      end
    end
  end

  @algos = %w(bubble cocktail comb gnome heap insertion merge oddeven quick
  radix selection shell stooge).sort

  def start(algo)
    if @thread.respond_to? :alive?
      @thread.kill if @thread.alive?
    end
    @title.text = algo + 'sort'

    @line  = 0
    @array = 100.times.to_a.shuffle

    @thread = Thread.new do
      send(algo + 'sort')

      log

      @title.text "pick an algo."
    end
  end

  @algos.each do |algo|
    require "./algos/#{algo}"
  end

  stack do
    flow :width => "100%" do
      background black
      @title = title "pick an algo.", :align => "center", :stroke => white
    end

    @slot = stack :height => 500, :width => 500 do
      background darkgray
    end

    # links at the bottom
    flow do
      @algos.each do |algo|
        para link(algo) { start(algo) }
      end
    end
  end
end
