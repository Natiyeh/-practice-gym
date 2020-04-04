class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all
  end

  def show
    @membership = Membership.find(params[:id])
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
    @membership = Membership.find(params[:id])
  end

  def update
    @membership = Membership.find(params[:id])
    @membership.update(membership_params)

    redirect_to membership_path(@membership)
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    redirect_to memberships_path
  end

  private

  def membership_params
    params.require(:membership).permit(:name, :description, :price)
  end
end
