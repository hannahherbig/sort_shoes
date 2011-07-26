Shoes.app :width => 500, :height => 700, :resizable => false do
  @width        = 500
  @height       = 500
  @points       = 50

  @point_width  = @width / @points
  @point_height = @height / @points

  def array
    @array
  end

  # call this with the two indices of the values you're about to compare
  def compare(*indices)
    @compares.text = @compares.text.to_i + 1

    @array.each_with_index do |v, i|
      r = @rects[v]

      unless r.left == i * @point_width
        r.move(i * @point_width, @height - (v + 1) * @point_height)
      end

      if indices.include? i
        unless r.style[:stroke] == red && r.style[:fill] == red
          r.style :stroke => red, :fill => red
        end
      else
        unless r.style[:stroke] == black && r.style[:fill] == black
          r.style :stroke => black, :fill => black
        end
      end
    end

    # XXX
    #unless @real_line.top == @width - (@line + 1) * @point_width
    #  @real_line.move(0, @width - (@line + 1) * @point_width)
    #end

    wait
  end

  def swap(first, second)
    @swaps.text = @swaps.text.to_i + 1

    @array[first], @array[second] = @array[second], @array[first]
  end

  # call this after you change the array
  def log
    @array.each_with_index do |v, i|
      r = @rects[v]

      unless r.left == i * @point_width
        r.move(i * @point_width, @height - (v + 1) * @point_height)
      end

      unless r.style[:stroke] == black && r.style[:fill] == black
        r.style :stroke => black, :fill => black
      end
    end

    # XXX
    #unless @real_line.top == @width - (@line + 1) * @point_width
    #  @real_line.move(0, @width - (@line + 1) * @point_width)
    #end

    wait
  end

  def wait
    sleep 1.0 / 30.0
  end

  @algos = %w(bubble cocktail comb gnome heap insertion merge oddeven quick
  radix selection shell stooge).sort

  def start(algo)
    if @thread.respond_to? :alive?
      @thread.kill if @thread.alive?
    end

    @title.text    = algo + 'sort'
    @compares.text = "0"
    @swaps.text    = "0"

    @array = @points.times.to_a.shuffle
    @line  = @points - 1

    @thread = Thread.new do
      send(algo + 'sort')

      log

      @title.text "pick an algo."
    end

    @rects = []

    @slot.clear do
      background darkgray
      fill black
      stroke black

      @array.each_with_index do |v, i|
        @rects[v] = rect(i * @point_width, @height - (v + 1) * @point_height,
                         @point_width, (v + 1) * @point_height)
      end

      # XXX
      #stroke gray
      #@real_line = line(0, @width - (@line + 1) * @point_width, @width,
      #     @width - (@line + 1) * @point_width)
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

    @slot = stack :height => @height, :width => @width do
      background darkgray
    end

    flow do
      @compares = para "0"; para " compares, "
      @swaps    = para "0"; para " swaps"
    end

    # links at the bottom
    flow do
      @algos.each do |algo|
        para link(algo) { start(algo) }
      end
    end
  end
end
