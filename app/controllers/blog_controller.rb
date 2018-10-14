class BlogController < ApplicationController

  before_action -> {has_permission(:admin)}, except: [:index, :show]

  def new
    @blogpost = current_user.blog_posts.build if current_user.can_do(:admin)
  end

  def create
    @blogpost = current_user.blog_posts.build(blogpost_params)
    if (@blogpost.save) 
      flash[:success] = "Blog post created!"
      redirect_to blog_index_url 
    else
      render 'new'
    end
  end

  def index
    @blogposts = BlogPost.all
  end

  def edit
    @blogpost = BlogPost.find_by_hash_id(params[:id])
  end

  def update
    @blogpost = BlogPost.friendly.find(params[:id])
    if (@blogpost.update_attributes(blogpost_params))
      flash[:success] = "Blogpost updated"
      redirect_to blog_index_url + '#' + @blogpost.hash_id
    else
      render 'edit'
    end
  end

  def destroy
    BlogPost.find_by_hash_id(params[:id]).delete
    flash[:success] = "Blog post deleted!"
    redirect_to blog_index_url
  end


  private
    def blogpost_params
      params.require(:blog_post).permit(:content, :title)
    end

end
