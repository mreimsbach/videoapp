class StaticPagesController < ApplicationController
  def home
    @videos = Video.all.order_by(point: 'desc').limit(10)
  end
end
