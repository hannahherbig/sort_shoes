#
# This code is really ugly.  It should really be as simple as:
#
#    require 'sortvis'
#    require 'sortvis/algos/bubble'
#
#    bubblesort(256.times.to_a.shuffle).save("bubblesort.png")
#

require "./sortvis"
require 'fileutils'

FileUtils.mkdir_p("out/png")

algos = %w(bubble cocktail comb heap insertion quick selection shell gnome oddeven stooge radix merge)
algos.sort! # yes, even the algos are being sorted!

algos.each { |algo| require "./algos/#{algo}" }

open("out/index.html", "w") do |f|
  f.puts %(<html><head><link rel="stylesheet" href="style.css" type="text/css" charset="utf-8"></head><body>)
  f.puts %(<table border="1" cellpadding="3" cellspacing="0">)
  f.puts %(<tr>)
  algos.each do |algo|
    f.puts %(<th>#{algo}sort</th>)
  end
  f.puts %(</tr>)
  f.puts %(<tr>)
  algos.each do |algo|
    f.puts %(<td><a href="png/#{algo}sort2.png"><img src="png/#{algo}sort.png" align="top" /></a></td>)
  end
  f.puts %(</tr>)
  f.puts %(</table>)
  f.puts %(</body></html>)
end

arrays = {}
[512, 256, 128].each do |n|
  arrays[n] = n.times.to_a.shuffle
end

algos.each do |algo|
  send("#{algo}sort", arrays[128].dup).save("out/png/#{algo}sort.png")
end

algos.each do |algo|
  [512, 256].each do |n|
    begin
      send("#{algo}sort", arrays[n].dup).save("out/png/#{algo}sort2.png")
      break
    rescue Cairo::InvalidSize
      next
    end
  end
end
