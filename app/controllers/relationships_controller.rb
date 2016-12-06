class RelationshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		@user = User.find(params[:user_id])
		follow = current_user.relationships.build(following_id: @user.id)
		if follow.save
			redirect_to tweets_url, notice: "フォローしました"
		else
			redirect_to tweets_url, alert: "フォローできませんでした"
		end
	end

	def destroy
		@user = User.find(params[:user_id])
        follow = current_user.relationships.find_by!(following_id: @user.id)
        follow.destroy
        redirect_to tweets_url, notice: "フォロー解除しました"
	end

	def follows
		@user = User.find(params[:id])
	end

	def followers
		@user = User.find(params[:id])
	end

end
