class ColorsController < ApplicationController   
  access_control do
      allow :administrator, :all
      allow :supervisor, :all
      allow :seller, :all
  end
  
  def index
    @colors = Color.all
  end

  def show
    @color = Color.find(params[:id])
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(params[:color])
    if @color.save
      redirect_to colors_path, :notice => "Cor criada com sucesso."
    else
      render :action => 'new'
    end
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])
    if @color.update_attributes(params[:color])
      redirect_to colors_path, :notice  => "Cor atualizada com sucesso."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy
    redirect_to colors_url, :notice => "Cor deletada com sucesso."
  end
end
