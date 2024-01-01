class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    current_user.reload # フォロー数を更新する
    Rails.logger.info("User #{current_user.id} followed user #{params[:user_id]}")
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    current_user.reload # フォロー数を更新する
    Rails.logger.info("User #{current_user.id} unfollowed user #{params[:user_id]}")
    redirect_to request.referer
  end
end
