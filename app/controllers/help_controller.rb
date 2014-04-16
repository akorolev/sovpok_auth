class HelpController < ApplicationController
  def show
    puts params.inspect
    @topic = params[:id]
  end
end
