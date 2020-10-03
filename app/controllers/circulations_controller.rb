class CirculationsController < ApplicationController
  def index
  end

  def new
    @circulation = Circulation.new
  end

  def create
    # circulation = {}
    if circulation_params[:cir_upload_file].present?
      circulation_params[:cir_upload_file].read
      circulation_params[:cir_upload_file_name] = circulation_params[:cir_upload_file].original_filename
      # circulation[:cir_upload_file_name] = "#{circulation_params[:cir_upload_file_name]}.#{circulation_params[:cir_upload_file].original_filename.split('.')[1]}"
    end
    @circulation = circulation.new(circulation_params)
    @circulation.save!
    redirect_to root_path
  end

  private
  
  def circulation_params
    params.require(:circulation).permit(:cir_title, :cir_content, :cir_importancy, :cir_emergency, :cir_upload_file_name, :cir_upload_file).merge(user_id: current_user.id)
  end
end
