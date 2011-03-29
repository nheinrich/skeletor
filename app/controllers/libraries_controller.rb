class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:id])
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(params[:library])
    if @library.save
      redirect_to @library, :notice => "Successfully created library."
    else
      render :action => 'new'
    end
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    @library = Library.find(params[:id])
    if @library.update_attributes(params[:library])
      redirect_to @library, :notice  => "Successfully updated library."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @library = Library.find(params[:id])
    @library.destroy
    redirect_to libraries_url, :notice => "Successfully destroyed library."
  end
end
