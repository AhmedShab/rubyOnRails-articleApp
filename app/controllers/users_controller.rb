class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(:page => params[:page], per_page: 5)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to your new blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'

    end
  end

    def edit
    end

    def update
      if @user.update(user_params)
        flash[:success] = "Your details has been Successfully updated"
        redirect_to articles_path
      else
        render 'edit'
      end
    end

    def show
      @user_article = @user.articles.paginate(:page => params[:page], per_page: 5)
    end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
    #code
  end
  def set_user
     if !User.all.present?
       flash[:danger] = "You are not allowed to access to this page"
       redirect_to root_path
     else
       @user = User.find(params[:id])
     end
  end
  def require_same_user
    if current_user != @user
      flash[:danger] = "You are trying to delete someone else's article"
      redirect_to root_path
    end
  end
end
