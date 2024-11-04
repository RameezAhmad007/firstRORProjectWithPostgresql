class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end
  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params.require(:blog).permit(:title, :description))
    if @blog.save
      flash[:notice] = "Blog is created successfully."
      redirect_to blog_path(@blog)
    else
      render "new"
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(params.require(:blog).permit(:title, :description))
      flash[:notice] = "Blog is updated successfully."
      redirect_to blog_path(@blog)
    else
      render "edit"
    end
  end
end
