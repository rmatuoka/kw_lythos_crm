class BulletinsController < ApplicationController
  access_control do
      allow :administrator, :all
      allow :supervisor, :all
      allow :seller, :all
  end
  
  def index
    @bulletins = Bulletin.all
  end
  
  def new
    @bulletin = Bulletin.new
    @bulletins = Bulletin.all
  end

  def create
    @bulletin = Bulletin.new(params[:bulletin])
    if @bulletin.save
      redirect_to bulletin_path(@bulletin), :notice => "Successfully created user."
    else
      render :action => 'new'
    end
  end

  def edit
    @bulletin = Bulletin.find(params[:id])
  end
  
  def show
    @bulletin = Bulletin.find(params[:id])
  end
  
  def update
    @bulletin = Bulletin.find(params[:id])
    if @bulletin.update_attributes(params[:bulletin])
      redirect_to bulletin_path(@bulletin), :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @bulletins = Bulletin.find(params[:id])
    @bulletins.destroy
    redirect_to bulletins_path, :notice => "Usuário Deletado com sucesso!"
  end
  
  def load_groups
    
  end
end
