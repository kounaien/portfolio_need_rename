class PostsController < ApplicationController
    before_action :autenticate_user!, except: :top

    def top
    end

    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:succes] = "投稿完了"
            redirect_to @post
        else
            flash[:danger] = "投稿できませんでした"
            render 'new'
        end
    end
    
    def index
       @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
    end
    
    def edit
     
    end
    
    def update
        
    end
    
    def destroy
       
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :caption, :fee)
    end

end
