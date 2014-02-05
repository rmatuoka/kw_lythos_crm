class FinishesController < ApplicationController  
  access_control do
      allow :administrator, :all
      allow :supervisor, :all
      allow :seller, :all
  end
  
  def index
    @finishes = Finish.all
  end

  def show
    @finish = Finish.find(params[:id])
  end

  def new
    @finish = Finish.new
  end

  def create
    @finish = Finish.new(params[:finish])
    if @finish.save
      redirect_to finishes_path, :notice => "Acamento criado com sucesso."
    else
      render :action => 'new'
    end
  end

  def edit
    @finish = Finish.find(params[:id])
  end

  def update
    @finish = Finish.find(params[:id])
    if @finish.update_attributes(params[:finish])
      redirect_to finishes_path, :notice  => "Acamento atualizado com sucesso."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @finish = Finish.find(params[:id])
    @finish.destroy
    redirect_to finishes_url, :notice => "Acamento deletado com sucesso."
  end
end
