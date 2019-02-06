class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @destinations = Destination.all
        @bloggers = Blogger.all
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            @post.save
            redirect_to @post
        else
            render :new
        end
    end

    def edit
        @post = Post.new(post_params)
        @destinations = Destination.all
        @bloggers = Blogger.all
    end

    def update
        @post = Post.update(post_params)
        if @post.valid?
            @post.update
            redirect_to @post
        else
            render :edit
        end
    end

private

    def post_params
     params.require(:post).permit(
         :title, 
         :content, 
         :destination_id, 
         :blogger_id, 
         :likes
         )
    end


end 