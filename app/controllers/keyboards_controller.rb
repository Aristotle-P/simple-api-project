class KeyboardsController < ApplicationController

  def show
    @keyboard = Keyboard.find(params[:id])

    respond_to do |format|
      format.html
      format.json {render :json => @keyboard}
    end
  end

  def index
    @keyboards = Keyboard.all

    respond_to do |format|
      format.html
      format.json {render :json => @keyboards}
    end
  end

  def new
    @keyboard = Keyboard.new
  end

  def create
    @keyboard = Keyboard.new(keyboard_params)
    if @keyboard.save
      flash[:success] = "Succesfully created keyboard entry"
      redirect_to @keyboard
    else
      render 'new'
    end
  end

  def edit
    @keyboard = Keyboard.find(params[:id])
  end

  def update
    @keyboard = Keyboard.find(params[:id])
    if @keyboard.update_attributes(keyboard_params)
      flash[:success] = "Succesfully updated keyboard entry"
      redirect_to @keyboard
    else
      render 'edit'
    end
  end

  def destroy
    Keyboard.find(params[:id]).destroy
    flash[:success] = "Successfully deleted keyboard entry"
    redirect_to root_url
  end

  private
    def keyboard_params
      params.require(:keyboard).permit(:name, :layout, :switch)
    end
end
