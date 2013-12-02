class LibrariesController < ApplicationController
  before_filter :load_categories
  
  access_control do
      allow :administrator, :all
  end
  
  def index
    @library_categories = LibraryCategory.all
    #@libraries = @library_categories.libraries.all
  end
  
  def new
    @library = Library.new
  end

  def create
    @library = Library.new(params[:library])
    if @library.save
      redirect_to libraries_path, :notice => "Successfully created user."
    else
      render :action => 'new'
    end
  end

  def edit
    @library = Library.find(params[:id])
  end
  
  def show
    @library = Library.find(params[:id])
  end
  
  def update
    @library = Library.find(params[:id])
    if @library.update_attributes(params[:library])
      redirect_to libraries_path, :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @library = Library.find(params[:id])
    @library.destroy
    redirect_to libraries_path, :notice => "Arquivo Deletado com sucesso!"
  end
  
  def load_categories
    @categories = LibraryCategory.all.collect { |c| [c.name, c.id] }
  end
  
  def search
    if !params[:search].blank?
      @libraries = Library.all(:conditions => ['name LIKE ? ', "%#{params[:search]}%" ])
    else
      @libraries = Library.all
    end
  end
end
