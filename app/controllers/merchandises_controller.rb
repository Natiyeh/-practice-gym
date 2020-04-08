class MerchandisesController < ApplicationController
  before_action :set_merchandise, only: %i[show edit update destroy]
  before_action :admin?, only: %i[new create edit update destroy]

  def index
    @merchandises = Merchandise.all
  end

  def show
  end

  def new
    @merchandise = Merchandise.new
  end

  def create
    @merchandise = Merchandise.new(merchandise_params)
    @merchandise.save

    redirect_to merchandise_path(@merchandise)
  end

  def edit
  end

  def update
    @merchandise.update(merchandise_params)

    redirect_to merchandise_path(@merchandise)
  end

  def destroy
    @merchandise.destroy

    redirect_to merchandises_path
  end

  private

  def merchandise_params
    params.require(:merchandise).permit(:name, :description, :price)
  end

  def set_merchandise
    @merchandise = Merchandise.find(params[:id])
  end

  def admin?
    redirect_to root_path unless current_user.admin?
  end
end
