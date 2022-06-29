class StoresController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @store = Store.find(params[:id])
    @comment = Comment.new
    @comments = @store.comments.includes(:user)
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to store_path(@store.id)
    else
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to root_path
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
