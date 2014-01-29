class SessionsController < Devise::SessionsController

  # GET /resource/sign_in
  def new(failed = false)
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    self.resource.errors.add(:password, "Invalid email or password") if failed
    respond_to do |format|
      format.js {render :action =>"new"}
    end
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failed")
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_to do |format|
      format.js
    end
  end

  def failed
    new(:failed => true)
  end

end
