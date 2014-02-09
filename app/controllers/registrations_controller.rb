class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  # GET /resource/sign_up
  def new
    build_resource({})
    resource.build_profile
#    respond_to do |format|
#      format.js
#    end
  end

  # POST /resource
  def create
    debugger
    build_resource(sign_up_params)
    status = :created;
	location = "";

    if params["profile"]["name"].empty?
    end
    
    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        location = after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        location = after_inactive_sign_up_path_for(resource)
      end
	   puts YAML::dump(resource.profile.inspect)
#      Profile.create(:user_id => resource.id, :name => params["profile"]["name"])
    else
      clean_up_passwords resource
      status = :unprocessable_entity
    end
    respond_to do |format|
      format.js
    end

  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit( :email, :password, :password_confirmation, profile_attributes: [:id, :name, :user_id])}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit( :email, :password, :password_confirmation, :current_password)}
  end

  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, profile: [:id, :name, :user_id]]
    params.require(resource_name).permit(allow)
  end
end
