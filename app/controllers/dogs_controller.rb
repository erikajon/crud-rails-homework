class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
    @dog_name = @dog.breed
  end

  def update
    dog = Dog.find(params[:id])
    dog.update(dog_params)
    redirect_to(dogs_path)
  end

  def new
    @dog = Dog.new
  end

  def create
    Dog.create(dog_params)
    redirect_to(dogs_path)
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
    redirect_to(dogs_path)
  end

  private

  def dog_params
    params.require(:dog).permit(:breed, :color, :country_of_origin, :friendly, :history, :image)
  end

end
