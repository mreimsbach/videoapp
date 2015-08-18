class SubscriptionMailer < ApplicationMailer
  def new_video(user, channel, video)
    @user = user
    @channel = channel
    @video = video
    mail(to: @user.email, subject: 'One of your subscribed channels has been updated')
  end
  def new_course(user, channel, course)
    @user = user
    @channel = channel
    @course = course
    mail(to: @user.email, subject: 'One of your subscribed channels has been updated')
  end
end
