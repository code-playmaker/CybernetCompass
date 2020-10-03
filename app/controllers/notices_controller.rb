class NoticesController < ApplicationController
  def index
  end

  def new
    @notice = Notice.new
  end

  def create
    # notice = {}
    if notice_params[:ntc_upload_file].present?
      notice_params[:ntc_upload_file].read
      notice_params[:ntc_upload_file_name] = notice_params[:ntc_upload_file].original_filename
      # notice[:ntc_upload_file_name] = "#{notice_params[:ntc_upload_file_name]}.#{notice_params[:ntc_upload_file].original_filename.split('.')[1]}"
    end
    @notice = notice.new(notice_params)
    @notice.save!
    redirect_to root_path
  end

  private
  
  def notice_params
    params.require(:notice).permit(:ntc_title, :ntc_content, :ntc_importancy, :ntc_emergency, :ntc_upload_file_name, :ntc_upload_file).merge(user_id: current_user.id)
  end
end
