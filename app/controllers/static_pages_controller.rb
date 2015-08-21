class StaticPagesController < ApplicationController
  def home
    @videos = Video.order_by([['votes.point', :desc]]).limit(10)
  end
end
