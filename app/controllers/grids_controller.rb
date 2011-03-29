class GridsController < ApplicationController
  def index
    @grids = Grid.all
  end

  def show
    @grid = Grid.find(params[:id])
  end

  def new
    @grid = Grid.new
  end

  def create
    @grid = Grid.new(params[:grid])
    if @grid.save
      redirect_to @grid, :notice => "Successfully created grid."
    else
      render :action => 'new'
    end
  end

  def edit
    @grid = Grid.find(params[:id])
  end

  def update
    @grid = Grid.find(params[:id])
    if @grid.update_attributes(params[:grid])
      redirect_to @grid, :notice  => "Successfully updated grid."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @grid = Grid.find(params[:id])
    @grid.destroy
    redirect_to grids_url, :notice => "Successfully destroyed grid."
  end
end
