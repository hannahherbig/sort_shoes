$algos = %w(bubble cocktail comb heap insertion quick selection shell gnome oddeven stooge radix merge).sort

$points = 50
$pwidth = 10

class Array
  attr_reader :logs
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
end

$algos.each do |algo|
  require "./algos/#{algo}.rb"
end

$width = $points * $pwidth

Shoes.app :width => $width, :height => $width + 150, :resizable => false do
  def start(algo)
    @timer.stop if @timer
    logsindex = 0
    logs = send("#{algo}sort", $points.times.to_a.shuffle).logs
    @timer = every(0.1) do
      unless logsindex == logs.size
        @drawbox.clear do
          @status.text = "#{logsindex + 1} / #{logs.size}"
          @progress.fraction = (logsindex + 1).to_f / logs.size.to_f

          fill black
          stroke black

          logs[logsindex].each_index do |i|
            rect(i * $pwidth, $width - logs[logsindex][i] * $pwidth,
                 $pwidth, $pwidth)
          end

          logsindex += 1
        end
      end
    end
  end

  stack do
    @drawbox = stack :height => $points * $pwidth

    flow do
      @status   = para "status"
      @progress = progress :width => "100%"

      $algos.each do |algo|
        para link(algo) { start algo }
      end
    end
  end
end
