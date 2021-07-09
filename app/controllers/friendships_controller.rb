class FriendshipsController < ApplicationController
    def create 
        @friendship = current_user.friendship.build(friend_id: params[:user_id])
        @friendship.confirmed = false
        if @friendship.save
            flash[:notice] = 'Friend request was successfully sent.'
            redirect_to request.referrer
        else
            redirect_to request.referrer, alert: @Friendship.errors.full_messages.join('. ').to_s
    end
end