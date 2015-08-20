class StaticPagesController < ApplicationController
  def home
    @videos = Video.all
  end
end
