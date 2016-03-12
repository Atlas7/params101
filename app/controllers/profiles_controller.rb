class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_social_list, only: [:new, :edit]

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find(params[:id])
  end
 
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new}
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @profiles = Profile.all
    @profile = Profile.find(params[:id])
    @profile.update_attributes(profile_params)
  end

  def delete
    @product = Profile.find(params[:profile_id])
  end

  def destroy
    @profiles = Profiles.all
    @profile = Profile.find(params[:id])
    @profile.destroy
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