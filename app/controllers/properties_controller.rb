class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
  end

  def edit
  end

  def create
    @property = Property.new(property_params)
    respond_to do |format|
      if @property.save
        format.html { redirect_to new_property_path, notice: '物件情報を登録されました' }
      else
        format.html { render :new }
      end
    end
  end

  def update
  end

  def destroyed
  end

  private
  def property_params
    params.require(:property).permit(:name, :price, :address, :old, :content)
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
