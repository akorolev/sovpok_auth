class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      false
    else
      "application"
    end
  end

  # GET /resource/sign_up
  def new
    build_resource({})
    respond_to do |format|
      format.html
      format.json {render json: self.resource}
      format.js
    end
  end

  # POST /resource
  def create
    build_resource(sign_up_params)
    status = :created;
    location = "";

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
    else
      clean_up_passwords resource
      status = :unprocessable_entity
    end
    respond_to do |format|
      format.html {render action: "new"}
      format.json {render json: resource.errors , :status => status, :location => location}
      format.js
    end

  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password)}
  end

end
