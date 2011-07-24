# quicksort((0..100).to_a.shuffle).save("quicksort.png")
begin
  require 'cairo'
rescue LoadError
  warn "need cairo for Array#save"
end

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

  def changed?
    @logs.last != dup
  end
end
