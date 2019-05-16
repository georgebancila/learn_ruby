class Timer

  attr_writer :seconds

  def seconds
    @seconds || 0
  end

  def time_string
    hours = @seconds / 3600
    minutes = (@seconds - hours * 3600) / 60
    seconds = @seconds - hours * 3600 - minutes * 60
    "#{'%02d' % hours}:#{'%02d' % minutes}:#{'%02d' %seconds}"
  end
end