class ProfilesController < ApplicationController
  def update
    puts YAML::dump(@profile)
    @profile.save!
  end

  def edit
    @profile = current_user.profile
  end
end
