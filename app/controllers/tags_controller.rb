class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
    render :index
  end

  def new
    @tag = Tag.new
    render :new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag added!"
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    render :edit
  end

  def show
    @tag = Tag.find(params[:id])
    render :show
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "Tag updated!"
      redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "Tag deleted!"
    redirect_to tags_path
  end

  private
    def tag_params
      params.require(:tag).permit(:category)
    end
end