class UsersController < Devise::RegistrationsController

  def remove_content_group
    user = User.find(params[:user_id])
    content_group = ContentGroup.find(params[:id])
    user.content_groups.delete(content_group)
    redirect_to edit_registration_path(resource_name), notice: 'Content group association removed.'
  end
end
