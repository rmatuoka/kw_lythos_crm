class ProductsController < ApplicationController 
  before_filter :load_dropdowns, :only => [:new, :edit]
  def index
    @products = Product.all
    
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to products_path(), :notice => "Produto criado com sucesso."
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to products_path(), :notice  => "Produto atualizado com sucesso."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, :notice => "Produto excluido com sucesso."
  end
  
  def load_dropdowns
    @colors = Color.all(:order => :name).collect {|c| [c.name, c.id]}
    @finishes =  Finish.all(:order => :name).collect {|f| [f.name, f.id]} 
  end 
  
  def selected 
    @product = Product.find(params[:id])   
  end
end
