class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
  end

  def create
    # message = {}
    if message_params[:upload_file].present?
      message_params[:upload_file].read
      message_params[:upload_file_name] = message_params[:upload_file].original_filename
      # message[:upload_file_name] = "#{message_params[:upload_file_name]}.#{message_params[:upload_file].original_filename.split('.')[1]}"
    end
    @message = Message.new(message_params)
    @message.save!
    redirect_to root_path
  end

  private
  
  def message_params
    params.require(:message).permit(:title, :content, :importancy, :emergency, :upload_file_name, :upload_file).merge(user_id: current_user.id)
  end
end
