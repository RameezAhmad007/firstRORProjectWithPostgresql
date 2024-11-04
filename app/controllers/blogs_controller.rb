class BlogsController < ApplicationController
  before_action :set_blog, only: [ :show, :edit, :update, :destroy ]

  def index
    @blogs = Blog.all
  end
  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      set_flash("Blog was created successfully.")
      redirect_to blog_path(@blog)
    else
      render "new"
    end
  end

  def update
    if @blog.update(blog_params)
      set_flash("Blog was updated successfully.")
      redirect_to blog_path(@blog)
    else
      render "edit"
    end
  end

  def destroy
    @blog.destroy
    set_flash("Blog was deleted successfully.")
    redirect_to blogs_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end


  def blog_params
    params.require(:blog).permit(:title, :description)
  end

  def set_flash(msg)
    flash[:notice] = msg
  end
end
