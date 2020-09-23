class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    unless @user.valid?
      flash.now[alert] = @user.errors.full_messages
      render :new and return
    end
    # session["devise.regist_data"] = {user: @user.attributes}
    # session["devise.regist_data"][:user]["password"] = params[:user][:password]
    session["devise.regist_data"] = user_params
    @assignment = @user.build_assignment
    render :new_assignment and return
  end

  def create_assignment
    @user = User.new(session["devise.regist_data"])
    @assignment = Assignment.new(assignment_params)
    unless @assignment.valid?
      flash.now[alert] = @assignment.errors.full_messages
      render :new and return
    end
    @user.assignment.build(@assignment.attributes)
    @user.save!
    sign_in(:user, @user)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :number, :password, :password_confirmation)
  end

  def assignment_params
    params.require(:assignment).permit(:department, :division, :charge)
  end

end
