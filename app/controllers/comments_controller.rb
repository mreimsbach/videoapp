class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:show]

  # GET /comments
  # GET /comments.json


  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build(comment_params)
    @comment.user_id = current_user._id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @video, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { redirect_to @video, alert: "Comment can't be empty or longer than 1000 characters" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @video.comments.find(@comment).destroy
    respond_to do |format|
      format.html { redirect_to @video, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @video = Video.find(params[:video_id])
      @comment = @video.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text, :video_id)
    end
end
