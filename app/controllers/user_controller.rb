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

  def update_environmental_contribution
    user = User.find(params[:user_id])
    user.update_pollution!(params[:pollution].to_f)
    user.update_tree_points!(params[:tree_points].to_i)
    user.update_carbon_saved!(params[:carbon_saved].to_i)
    render json: user
  end
end