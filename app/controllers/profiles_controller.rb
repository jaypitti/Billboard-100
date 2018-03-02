class ProfilesController < ApplicationController
    before_action :set_profil, only: [:show, :edit, :update, :destroy]
  
    def new
      @profile = Profile.new
    end
  
    def show
    end
  
    def edit
    end
  
    def create
      @profile = Profile.new(profile_params)
      
        if @profile.save
          redirect_to artists_path
        else
          render :new
        end
  
    end
  
    def update
      if @profile.update(profile_params)
        redirect_to @profile
      else 
        render :edit
      end
    end
  
    def destroy
      @profile.destroy
      redirect_to profiles_path
    end
  
    private
  
    def profile_params
      params.require(:profile).permit(:name, :genre, :bio)
    end
  
    def set_profile
      @profile = Profile.find(params[:id])
    end
  
  end
  
