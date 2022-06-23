class StoresController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
  end

  def create
  end

  private

  def store_params
    params.require(:store).permit(:store_name, :category_id, :store_environment, :recommendation, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
