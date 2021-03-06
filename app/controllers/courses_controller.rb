class CoursesController < ApplicationController
  before_action :load_channel, except: [:index_all]
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = @channel.courses.paginate(:page => params[:page], :per_page => 10)
  end

  def index_all
    @channels = Channel.all
    @courses = []
    @channels.each do |channel|
      channel.courses.each do |course|
        @courses << course
      end
    end
    @courses = @courses.paginate(:page => params[:page], :per_page => 10)
    render :index
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @videos = @course.videos
  end

  # GET /courses/new
  def new
    @course = @channel.courses.build
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = @channel.courses.build(course_params)

    respond_to do |format|
      if @course.save
        @channel.subscriber.each do |user|
            SubscriptionMailer.new_course(user, @channel, @course).deliver_now
        end
        format.html { redirect_to [@channel, @course], notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to [@channel, @course], notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to channel_courses_url(@channel), notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = @channel.courses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description)
    end
    def load_channel
      @channel = Channel.find(params[:channel_id])
    end
end
