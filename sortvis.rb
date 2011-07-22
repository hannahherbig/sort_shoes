# quicksort((0..100).to_a.shuffle).save("quicksort.png")
begin
  require 'cairo'
rescue LoadError
  warn "need cairo for Array#save"
end

class Array
  def start_logging
    @logs = [dup]
    @logging = true
  end

  def logging?
    @logging
  end

  def log
    raise "not logging" unless @logging

    @logs << dup
  end

  def save(file)
    warn "\r#{file}: not sorted: #{inspect}" unless self == sort

    start = Time.now.to_f

    surface = Cairo::ImageSurface.new(@logs.last.length, @logs.length)
    context = Cairo::Context.new(surface)

    context.set_source_color(:white)
    context.paint

    max = @logs.last.max.to_f
    colors = {}
    @logs.last.each do |c|
      tmp = c.to_f / max
      colors[c] = Cairo::Color::RGB.new(tmp, tmp, tmp)
    end

    0.upto(@logs.length - 1) do |x|
      printf "\r#{file}: #{(((x + 1).to_f / @logs.length.to_f)*100).round(3)}%"
      0.upto(@logs.last.length - 1).each do |y|
        context.set_source_color(colors[@logs[x][y]])
        context.rectangle(y, x, 1, 1)
        context.fill
      end
    end

    puts "\r#{file}: took #{(Time.now.to_f - start).round(3)} seconds"

    surface.write_to_png(file)
  end
end
