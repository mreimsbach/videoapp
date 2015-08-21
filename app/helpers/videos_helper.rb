module VideosHelper
  def button_color(value)
    return "btn-default" unless @video.vote_value(current_user) == value
    return "btn-success" if value == :up
    return "btn-danger" if value == :down
  end
end
