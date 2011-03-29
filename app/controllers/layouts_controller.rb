class LayoutsController < ApplicationController
  def index
    @layouts = Layout.all
  end

  def show
    @layout = Layout.find(params[:id])
  end

  def new
    @layout = Layout.new
  end

  def create
    @layout = Layout.new(params[:layout])
    if @layout.save
      redirect_to @layout, :notice => "Successfully created layout."
    else
      render :action => 'new'
    end
  end

  def edit
    @layout = Layout.find(params[:id])
  end

  def update
    @layout = Layout.find(params[:id])
    if @layout.update_attributes(params[:layout])
      redirect_to @layout, :notice  => "Successfully updated layout."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @layout = Layout.find(params[:id])
    @layout.destroy
    redirect_to layouts_url, :notice => "Successfully destroyed layout."
  end
end
