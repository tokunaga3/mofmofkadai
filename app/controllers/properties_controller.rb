class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def show
    @moyoriekis = @property.moyoriekis
  end

  def new
    @property = Property.new
    2.times { @property.moyoriekis.build }
  end

  def edit
    @property.moyoriekis.build
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
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to properties_url, notice: '物件情報を編集しました' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: '物件情報を削除しました' }
    end
  end

  private
  def property_params
    params.require(:property).permit(:name, :price, :address, :old, :content,
      moyoriekis_attributes: [:property_id,:id, :rosen, :station, :foot])
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
