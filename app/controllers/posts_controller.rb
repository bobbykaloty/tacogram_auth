class PostsController < ApplicationController

    def index
      @posts = Post.all
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new
      @post["body"] = params["body"]
      @post["image"] = params["image"]
      @post["user_id"] = session["user_id"]
      @post.save
      redirect_to "/posts"
    end
  
  end