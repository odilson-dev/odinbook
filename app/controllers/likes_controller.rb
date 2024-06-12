class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]
    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else
            @post.likes.create(user_id: current_user.id)
            flash[:notice] = "Liked!"
            notify_recipient
        end
        
        redirect_back(fallback_location: root_path)
    end

    def destroy
        if !(already_liked?)
          flash[:notice] = "Cannot unlike"
        else
          @like.destroy
          flash[:notice] = "Unliked!"
        end
        
        redirect_back(fallback_location: root_path)
    end

    private
    def notify_recipient
    
        post_author = @post.user
      
        #CommentNotification is created.
        notification = CommentNotifier.with(author: current_user.username, type: "like")
    
        #CommentNotification is delivered to the recipient.
        notification.deliver(post_author)
        
      end
    def find_post
        @post = Post.find(params[:post_id])
    end

    def find_like
        @like = @post.likes.find(params[:id])
     end

    def already_liked?
        Like.where(user_id: current_user.id, post_id:
        params[:post_id]).exists?
    end
end
