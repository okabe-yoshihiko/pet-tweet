class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end


  private

  def user_params
    params.require(:user).permit(:nickname,:password,:email,:image)
  end

end
