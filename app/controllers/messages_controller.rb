class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
  end

  def create
    message_params[:upload_file] = upload_file.read
    upload_file = message_params[:upload_file]
    if upload_file.save
      message_params[:upload_file_name] = upload_file.original_filename
    end
    @message = Message.new(message_params)
    redirect_to root_path
  end

  private
  
  def message_params
    params.require(:message).permit(:title, :content, :importancy, :emergency, :upload_file_name, :upload_file).merge(user_id: current_user.id)
  end
end
