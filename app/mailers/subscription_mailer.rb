class SubscriptionMailer < ApplicationMailer
  def new_video(user, channel, video)
    @user = user
    @channel = channel
    mail(to: @user.email, subject: 'One of your subscribed channels was updated')
  end
end
