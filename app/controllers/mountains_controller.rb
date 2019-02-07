class MountainsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  before_action :authorize_admin, only: [:edit]

  def index
    @mountains = Mountain.all
  end

  def new
    @mountain = Mountain.new
    @state_collection = Mountain::NORTHEAST

  end

  def create
    @mountain = Mountain.new(mountain_params)
    if @mountain.save
      flash[:notice] = "Mountain has been created!"
      redirect_to @mountain
    else
      flash[:alert] = "Mountain not created"
      @state_collection = Mountain::NORTHEAST
      render :new
    end
  end

  def edit
    @mountain = Mountain.find(params[:id])
    @state_collection = Mountain::NORTHEAST
  end

  def update
    @mountain = Mountain.find(params[:id])

    if @mountain.update_attributes(mountain_params)
      flash[:notice] = "Mountain updated!"
      redirect_to mountains_path
    else
      flash[:alert] = "Mountain updated"
      @state_collection = Mountain::NORTHEAST
      render :edit
    end
  end

  def destroy
    @mountain = Mountain.find(params[:id])
    @mountain.destroy

    redirect_to mountains_path
  end

  def show
    @mountain = Mountain.find(params[:id])
  end

  private

  def mountain_params
    params.require(:mountain).permit(
      :name,
      :city_or_town,
      :state,
      :zip,
      :description
    )
  end

    def authorize_user
      if current_user == nil
        flash[:notice] = "Please sign up or sign in."
        redirect_to root_path
      end
    end

    def authorize_admin
      if !current_user.admin?
        flash[:notice] = "You do not have access to this page."
        redirect_to root_path
      end
    end
  end
