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

  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
  def update
    set_chore
    respond_to do |format|
      if @chore.update(update_chore_params)
        format.html { redirect_to @chore, notice: @chore.title + ' was successfully updated.' }
        format.json { render :show, status: :ok, location: @chore }
      else
        format.html { render :edit }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    set_chore
    @destroyedchore = @chore.title
    @chore.destroy
    respond_to do |format|
      format.html { redirect_to chores_url, notice: @destroyedchore + ' was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

# Only allow a list of trusted parameters through.
  def chore_params
    params.require(:chore).permit(:user_id, :title, :description, :price, :difficultyLvl,
                                 :completeBy, :isFunded, :isAvailable)
  end

  # Only allow a list of trusted parameters through.
  def update_chore_params
    params.require(:chore).permit(:user_id, :title, :description, :price, :difficultyLvl,
                                  :completeBy, :isFunded, :isAvailable, :isCheckedOut, :isCompleted,
                                  :isApproved, :isPaid)
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
