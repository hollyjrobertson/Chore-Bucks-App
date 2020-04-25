class ChoresController < ApplicationController
  # GET /chores
  # GET /chores.json
  def index
    find_chores
  end

  # GET /users/1
  # GET /users/1.json
  def show
    redirect_to action: "index"
  end

# GET /chores/new
  def new
    @user = User.find_by(id: session[:user_id])
    @chore = Chore.new(user_id: @user.id)
  end

  # GET /users/1/edit
  def edit
    set_chore
  end

# POST /users
# POST /users.json
  def create
    @chore = Chore.new(chore_params)
    respond_to do |format|
      if @chore.save
        format.html { redirect_to @chore, notice: 'Chore was created.' }
        format.json { render :index, status: :created, location: @chore }
      else
        format.html { render :new }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

# Only allow a list of trusted parameters through.
  def chore_params
    params.require(:chore).permit(:user_id, :title, :description, :price, :difficultyLvl,
                                 :completeBy, :isFunded, :isAvailable, false, false, false, false)
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
