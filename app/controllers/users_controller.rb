class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update, :show]
  before_action :is_admin, only: [:index, :delete]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    set_user
    @chores = @user.chores.paginate(page: params[:page], per_page: 5)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    set_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        add_default_chores
        if Chore.create(@chores)
          log_in @user
          format.html { redirect_to @user, notice: 'Sign-up was successful.' }
          format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: @user.name + ' was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    set_user
    @destroyeduser = @user.name
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: @destroyeduser + ' was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # Adds 10 Default Chores to a new user
  def add_default_chores()
    @chores = [
        {
         user_id: @user.id,
         title: "Clean Bathroom",
         description: "Clean the bathroom. Example: Clean toilet, sink(s), bathtub, shower, mirror(s), counter(s), sweep and mop floors, and stock inventory. ",
         price: 10,
         difficultyLvl: 5,
         completeBy: Time.new(2020, 5, 1),
         isFunded: false,
         isAvailable: false,
         isCheckedOut: false,
         isCompleted: false,
         isApproved: false,
         isPaid: false,
        },
        {
            user_id: @user.id,
            title: "Sweep Kitchen",
            description: "Sweep the kitchen floors",
            price: 2,
            difficultyLvl: 2,
            completeBy: Time.new(2020, 5, 1),
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: @user.id,
            title: "Mop Kitchen",
            description: "Mop the kitchen floors",
            price: 3,
            difficultyLvl: 3,
            completeBy: Time.new(2020, 5, 1),
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: @user.id,
            title: "Vacuum House",
            description: "Vacuum all the carpet in the house",
            price: 10,
            difficultyLvl: 3,
            completeBy: Time.new(2020, 5, 1),
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: @user.id,
            title: "Vacuum Living Room",
            description: "Vacuum the floors in the living room",
            price: 2,
            difficultyLvl: 3,
            completeBy: Time.new(2020, 5, 1),
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: @user.id,
            title: "Clean Room",
            description: "Clean your own room. Example: Make your bed, vacuum your room, pickup and put all out-of-place items in their proper place, clean and organize tables and/or desks. ",
            price: 5,
            difficultyLvl: 4,
            completeBy: Time.new(2020, 5, 1),
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: @user.id,
            title: "Dust House",
            description: "Dust all shelves and tables in the house",
            price: 9,
            difficultyLvl: 1,
            completeBy: Time.new(2020, 5, 1),
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: @user.id,
            title: "Clean Kitchen",
            description: "Clean the dishes, tables, appliances, and counters",
            price: 15,
            difficultyLvl: 4,
            completeBy: Time.new(2020, 5, 1),
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: @user.id,
            title: "Laundry",
            description: "Wash, Dry and put-up all the laundry",
            price: 20,
            difficultyLvl: 5,
            completeBy: Time.new(2020, 5, 1),
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: @user.id,
            title: "Clean Living Room",
            description: "Pickup the Living Room. Example: Fold all blankets, pickup and put all out-of-place items in their proper place, and put the remote control in a central place.",
            price: 5,
            difficultyLvl: 1,
            completeBy: Time.new(2020, 5, 1),
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
    ]

  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:notice] = 'Please Login First'
      redirect_to login_url
    end
  end

  # Confirms a logged-in user.
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user) || is_admin?
      flash[:notice] = 'Unauthorized Access'
      redirect_to(root_url)
    end
  end

  # Confirms if user is admin
  def is_admin
    unless is_admin?
      flash[:notice] = 'Unauthorized Access'
      redirect_to root_url
    end
  end


end
