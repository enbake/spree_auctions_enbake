class Spree::FollowsController < ApplicationController
  
  def follow_product
    @product = Spree::Product.find(params[:id])
    @follower = @product.followers.where(:user_id => spree_current_user.id)
    if @follower.present?
      @product.followers.where(:user_id => spree_current_user.id).first.delete
      flash[:notice] = "Unfollowed successfully"
    else
      @product.followers.create(:user_id => spree_current_user.id)
      flash[:notice] = "Followed successfully"
    end
    redirect_to :back
  end
end
