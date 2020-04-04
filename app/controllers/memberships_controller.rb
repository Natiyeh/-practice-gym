class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.save

    # no need for app/views/memberships/create.html.erb
    redirect_to memberships_path(@membership)
  end

  private

  def membership_params
    params.require(:membership).permit(:name, :description, :price)
  end
end
