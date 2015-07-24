module ChannelsHelper
  def channel_of_current_user?(channel)
    current_user and (current_user.channel == channel)
  end
end
