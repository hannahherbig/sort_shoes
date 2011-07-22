# you're allowed to change these
$algos = %w(bubble cocktail comb heap insertion quick selection shell gnome
            oddeven stooge radix merge).sort

# these are just initial values, change them in the settings dialog.
$points = 100
$fps    = 10

# don't touch anything down here unless you know what you're doing.

require './sortvis'

$algos.each do |algo|
  require "./algos/#{algo}.rb"
end

$width = 500
$pwidth = $width / $points

Shoes.app :width => $width, :height => $width + 200, :resizable => false do
  def start(algo)
    @title.text = algo + "sort"
    @timer.stop if @timer
    logsindex = 0
    logs = send("#{algo}sort", $points.times.to_a.shuffle).logs

    @drawbox.clear do
      background darkgray
      fill black
      stroke black

      @rects = []
      logs.first.each_index do |i|
        @rects[logs.first[i]] = rect(i * $pwidth, logs.first[i] * $pwidth,
                                     $pwidth, $pwidth)
      end
    end
    @timer = animate($fps) do
      unless logsindex == logs.size
        @status.text = "#{logsindex + 1} / #{logs.size}"
        @progress.fraction = (logsindex + 1).to_f / logs.size.to_f

        logs[logsindex].each_index do |i|
          @rects[i].move(i * $pwidth, logs[logsindex][i] * $pwidth)
        end

        logsindex += 1
      else
        @title.text = "pick an algo."
        @timer.stop
      end
    end
  end

  stack do
    flow :width => "100%" do
      background black
      @title = title "pick an algo.", :align => "center", :stroke => white
    end

    @drawbox = stack :width => "100%", :height => $width do
      background darkgray
    end

    flow do
      @status   = para "status"
      button 'settings', :align => :right do
        dialog do
          stack do
            flow do
              para "points: "
              @points_el = edit_line $points
            end

            flow do
              para "fps: "
              @fps_el = edit_line $fps
            end

            button "save" do
              $points = @points_el.text.to_i
              $fps    = @fps_el.text.to_i
              $pwidth = 500 / $points

              close
            end
          end
        end
      end
      @progress = progress :width => "100%"

      $algos.each do |algo|
        para link(algo) { start algo }
      end
    end
  end
end
