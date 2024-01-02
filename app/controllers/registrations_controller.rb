class User::RegistrationsController < Devise::RegistrationsController
  def remove_content_group
    user = User.find(params[:user_id])
    content_group = ContentGroup.find(params[:id])
    user.content_groups.delete(content_group)
    redirect_to edit_registration_path(resource_name), notice: 'Content group association removed.'
  end


  protected

  def user_params
    params.require(:user).permit(:name, :email, content_group_ids: [])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :description, :email, :organization_id, :permission_group_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description, :email, :organization_id, :permission_group_id])
  end
end
