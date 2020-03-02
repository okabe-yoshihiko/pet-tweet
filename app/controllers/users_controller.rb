class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets
    @image = user.image
    @profile = user.profile
  end

  def edit
    
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
end

def followers
  @user  = User.find(params[:id])
  @users = @user.followers
  render 'show_follower'
end

  private

  def user_params
    params.require(:user).permit(:nickname, :email,:image)
  end

end