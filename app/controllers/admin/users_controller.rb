class Admin::UsersController < Admin::AdminController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)

    if @user.save
      flash[:notice] = "Criado com sucesso"
      redirect_to admin_users_path
    else
      flash[:error] = @user.errors.full_messages
      render action: :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Excluído com sucesso"
    redirect_to admin_users_path
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params_user)
      flash[:notice] = "Atualizado com sucesso"
      redirect_to admin_users_path
    else
      flash[:error] = @user.errors.full_messages
      render action: :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  private

  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end