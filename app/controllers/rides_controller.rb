class RidesController < ApplicationController
 before_action :find_ride, only:[:show, :edit, :update, :destroy]
 before_action :authenticate_user!, only: [:new, :edit]

  def index
    if params[:category].blank?
    @rides = Ride.all.order("created_at DESC")
  else
    @category_id = Category.find_by(name: params[:category]).id
    @rides = Ride.where(:category_id => @category_id).order("created_at DESC")
  end
end

  def new
    @ride = current_user.rides.build
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def edit
      @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def update
      @ride.category_id = params[:category_id]
    if @ride.update(ride_params)
      redirect_to ride_path(@ride)
    else
      render 'edit'
    end
  end

  def destroy
    @ride.destroy
    redirect_to root_path
  end

  def show
@ride = Ride.find(params[:id])
  end

  def create
    @ride= current_user.rides.build(ride_params)
    @ride.category_id = params[:category_id]
     if @ride.save
       redirect_to root_path
     else
 @categories = Category.all.map{ |c| [c.name, c.id]}
   render 'new'
  end
end

  private

  def ride_params
  params.require(:ride).permit(:location ,:bike ,:description, :category_id, :ride_img)
  end

  def find_ride
@ride = Ride.find(params[:id])
  end
end
