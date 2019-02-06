class BloggersController < ApplicationController
    
    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def new
        @blogger = Blogger.new
        byebug
    end

    def create
        @blogger = Blogger.create(blogger_params)
        @blogger = Post.create(post_params)
        if @blogger.valid?
            @blogger.save
            redirect_to @post
        else
            render :new
        end
    end

private

    def blogger_params   
     params.require(:blogger).permit(:name, :bio, :age)
    end 


end 