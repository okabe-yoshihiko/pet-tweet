class PetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show,:search]
  def index
    @pets= Pet.includes(:user).order("created_at DESC")
  end

  def new
    @pet= Pet.new
  end

  def create
    pet = Pet.new(pet_params)
    if
      pet.save
    redirect_to "/pets", notice: 'メッセージが送信されました'
    end
  
  end

  def show
    @pet = Pet.find(params[:id]) 
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
  end

  private
  def pet_params
    params.require(:pet).permit(:image,:text,:name,:address, :latitude, :longitude,:charactarisitc,:find,:tell).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
