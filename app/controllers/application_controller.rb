class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

  def after_sign_in_path_for(resource)
   if resource.instance_of?(Admin)
     admin_path
   elsif resource.instance_of?(Customer)
     root_path
   else
     root_path
   end
  end

  def after_sign_out_path_for(resource)
   if resource == :admin
     new_admin_session_path
   elsif resource == :customer
     root_path
   else
     root_path
   end
  end

end
