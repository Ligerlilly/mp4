class VideosController < ApplicationController
  before_action :find_video, except: [:index, :new, :create]

  def index
    @videos = Video.all.order('created_at DESC')
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:notice] = "Success!"
      redirect_to videos_path
    else
      flash[:alert] = "Error!"
      redirect_to new_video_path
    end
  end

  def destroy
    @video.destroy
    flash[:notice] = "Video Deleted!"
    redirect_to videos_path
  end

  private

  def find_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:file, :title)
  end
end
