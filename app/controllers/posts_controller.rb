class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def create
    # create! exceptions will be handled by the rescue_from ActiveRecord::RecordInvalid code
    post = Post.create!(post_params)
    render json: post, status: :created
  end
  
  def update
    post = find_post
    # update! exceptions will be handled by the rescue_from ActiveRecord::RecordInvalid code
    Post.update!(post_params)
    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
