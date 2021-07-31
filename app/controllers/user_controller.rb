class UserController < ApplicationController
  def create_user
    user = User.create(id: params[:user_id], name: params[:name], email: params[:email],
                       street: params[:street], state: params[:state], country: params[:country])
    raise StandardError, user.errors.full_messages unless user.errors.empty?
    render json: user
  end

  def get_user
    user = User.find(params[:user_id])
    render json: user
  end

  def leaderboard
    users = User.order(tree_points: :desc).page(params[:page]).per(10)
    render json: users
  end

  def update_tree_points
    user = User.find(params[:user_id])
    raise UserNotFoundError if user.nil?
    user.update_tree_points!(params[:tree_points].to_i)
    render json: { message: 'User tree points updated!'}, status: 200
  end

  def update_pollution
    user = User.find(params[:user_id])
    raise UserNotFoundError if user.nil?
    user.update_pollution!(params[:pollution].to_f)
    render json: { message: 'User carbon footprint updated!'}, status: 200
  end 
end