class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_social_list, only: [:new, :edit]
 
  def new
    @profile=Profile.new
  end
 
  def edit
  end
 
  private
  def set_profile
    @profile = Profile.find( params[:id] )
  end
 
  def set_social_list
    @social_list = [
      [ "LinkedIn ID",      :linked_in    ],
      [ "Facebook ID",      :facebook     ],
      [ "Twitter ID",       :twitter      ],
      [ "Google Plus ID",   :google_plus  ]
    ]
   end
 
  def profile_params
    params.require(:profile).permit(socials_attributes: [:id, :kind, :username, :_destroy])
  end
end