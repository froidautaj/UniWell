# frozen_string_literal: true

class VotesController < AuthController # :nodoc:
  before_action :set_model

  def toggle_upvote
    respond_to do |format|
      if @model.toggle_upvote(current_user)
        @post = @model.is_a?(Post) ? @model : @model.post
        format.html { redirect_to post_path(@post) }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_downvote
    respond_to do |format|
      if @model.toggle_downvote(current_user)
        @post = @model.is_a?(Post) ? @model : @model.post
        format.html { redirect_to post_path(@post) }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render 'posts/show', status: :unprocessable_entity }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_model
    @model = if params[:post_id]
               Post.find(params[:post_id])
             else
               Comment.find(params[:comment_id])
             end
  end
end
