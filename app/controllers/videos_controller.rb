class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :search]
  before_action :new_filter, only: [:new]



  # GET /videos/1
  # GET /videos/1.json
  def show
    @channel = @video.user.channel
    @course = @channel.courses.find(@video.course_id)
    @comment = @video.comments.build
    @comments = @video.comments.reverse.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /videos/new
  def new
    @video = @course.videos.build
    @category = Category.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @channel = Channel.find(params[:channel_id])
    @course = @channel.courses.find(params[:course_id])
    @video = @course.videos.build(video_params)
    @video.user = current_user
    respond_to do |format|
      if @video.save
        @channel.subscriber.each do |user|
            SubscriptionMailer.new_video(user, @channel, @video).deliver_now
        end
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to channel_url(@video.user.channel), notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @video = Video.find(params[:video_id])
    vote(:up)
    redirect_to @video
  end

  def downvote
    @video = Video.find(params[:video_id])
    vote(:down)
    redirect_to @video
  end

  def search
    @categories = Category.all
  #  @videos = Video.where(:categories.in => params[:category_ids])
    @videos = []
    if params[:category_ids]
      filter_categories
    else
      @videos += Video.where( :name => /#{params[:search]}/i ) unless params[:search].blank?
    end
    if @videos.empty?
      flash[:info] = "No Videos found!"
    end
  end

  private

    def filter_categories
      params[:category_ids].each do |category|
        @videos += (Category.find(category)).videos.all
      end
      @videos = @videos.uniq
      if params[:search]
        @videos.delete_if{ |v| !(v.name.include?(params[:search]))}
      end
    end

    def vote(value)
      if (current_user.vote_value(@video) == value)
        current_user.unvote(@video)
      else
        current_user.vote(@video, value)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_video
      begin
        @video = Video.find(params[:id])
      rescue Mongoid::Errors::DocumentNotFound
        redirect_to root_path
        flash[:error] = "No such video exists. Maybe it was deleted"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name, :description, :file, :course_id, :channel_id, :category_ids => [])
    end

    def new_filter
      if !(valid_new && correct_user)
        redirect_to root_path
        flash[:error] = "Access Denied!"
      end
    end

    def valid_new
      if (!params.has_key?(:course_id) && !params.has_key?(:channel_id))
        false
      end
      begin
      @channel = Channel.find(params[:channel_id])
      @course = @channel.courses.find(params[:course_id])
      true
      rescue Mongoid::Errors::InvalidFind
        false
      end
    end

    def correct_user
      current_user && current_user == @channel.user
    end
end
