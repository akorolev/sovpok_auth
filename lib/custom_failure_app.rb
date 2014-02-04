class CustomFailureApp < Devise::FailureApp
  def redirect_url
#    debugger
#    if request.xhr?
#      send(:"new_#{scope}_session_path", :format => :js)
#      debugger

#    else
      super
#    end
  end
end
