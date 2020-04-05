class MembershipsController < ApplicationController
  before_action :set_membership, only: %i[show edit update destroy]

  def index
    @memberships = Membership.all
  end

  def show
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.save

    redirect_to membership_path(@membership)
  end

  def edit
  end

  def update
    @membership.update(membership_params)

    redirect_to membership_path(@membership)
  end

  def destroy
    @membership.destroy

    redirect_to memberships_path
  end

  private

  def membership_params
    params.require(:membership).permit(:name, :description, :price)
  end

  def set_membership
    @membership = Membership.find(params[:id])
  end
end
