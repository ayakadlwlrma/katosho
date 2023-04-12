class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
    def index
        @posts = Post.all
        if params[:tag_ids]
          @posts = []
          params[:tag_ids].each do |key, value|      
            @posts += Tag.find_by(name: key).posts if value == "1"
          end
          @posts.uniq!
        end
    end
    def toyo
      @posts = Post.all
    end
  
    def nanyo
      @posts = Post.all
    end
  
    def midterm
      @posts = Post.all
    end
    

      def show
        @post = Post.find(params[:id])
      end
    
end
