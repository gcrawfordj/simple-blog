class CommentsController < ApplicationController
    before_action :set_post
    before_action :set_comment, only: [:reply]

    def create
        @comment = @post.comments.create!(comment_params)
        redirect_to @post
    end

    def reply
        @reply = @post.comments.create!(
            content: comment_params[:content],
            parent: @comment
        )
        redirect_to @post
    end

    private
        def set_post
            @post = Post.find(params[:post_id])
        end

        def set_comment
            @comment = @post.comments.find(params[:id])
        end

        def comment_params
            params.require(:comment).permit(:content)
        end
end
