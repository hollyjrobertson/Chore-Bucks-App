class ChoresController < ApplicationController
  # GET /chores
  # GET /chores.json
  def index
    find_chores
  end

  # GET /users/1/edit
  def edit
    set_chore
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_chore
    @chore = Chore.find(params[:id])
  end

  def find_chores
    @user = User.find_by(id: session[:user_id])
    @chores = Chore.where(:user_id => "#{@user.id}" )
  end

end
