class TfriendsController < ApplicationController
  before_filter :signed_in_user

  def create
    @user = User.find(params[:tfriend][:friends_id])
    current_user.addfriend!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.json
    end
  end

  def destroy
    @user = Friend.find(params[:id]).friends
    current_user.unfriend!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
  end
  end
end