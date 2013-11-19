class InvitationsController < ApplicationController
  
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy
  

  def new
    @invitation = Invitation.new
     @users = User.paginate(page: params[:page])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
  def show
   
   @users = User.paginate(page: params[:page])
  respond_to do |format|
      format.html # show.html.erb
     
    end
    end

    def index
   @users = User.paginate(page: params[:page])
  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user}
    end
  end

def create
  @invitation = Invitation.new(params[:invitation])
  @invitation.user_id = current_user
  if @invitation.save
    if logged_in?
      Trip.deliver_invitation(@user)
      flash[:notice] = " invitation sent."
      redirect_to projects_url
    else
    
      redirect_to root_url
    end
  else
    render :action => 'new'
  end
end
end