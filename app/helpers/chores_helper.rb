module ChoresHelper
  #Formats Due Date
  def due_date(chore)
    Date.parse(chore.completeBy.to_s).strftime("%B %e, %Y")
  end

  #Sets Border Color based on Availability
  def border_class(chore)
    if chore.isCheckedOut == true
      "orange"
    elsif chore.isCheckedOut == false
      "green"
    else
      "red"
    end
  end

  #Adds a list of Chores to a new user
  def add_default_chores(user_id)
    current_date = Time.now
    two_weeks = (2*7*24*60*60)
    @chores = [
        {
            user_id: user_id,
            title: "Clean Bathroom",
            description: "Clean the bathroom. Example: Clean toilet, sink(s), bathtub, shower, mirror(s), counter(s), sweep and mop floors, and stock inventory. ",
            price: 10,
            difficultyLvl: 5,
            completeBy: current_date + two_weeks,
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: user_id,
            title: "Sweep Kitchen",
            description: "Sweep the kitchen floors",
            price: 2,
            difficultyLvl: 2,
            completeBy: current_date + two_weeks,
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: user_id,
            title: "Mop Kitchen",
            description: "Mop the kitchen floors",
            price: 3,
            difficultyLvl: 3,
            completeBy: current_date + two_weeks,
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: user_id,
            title: "Vacuum House",
            description: "Vacuum all the carpet in the house",
            price: 10,
            difficultyLvl: 3,
            completeBy: current_date + two_weeks,
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: user_id,
            title: "Vacuum Living Room",
            description: "Vacuum the floors in the living room",
            price: 2,
            difficultyLvl: 3,
            completeBy: current_date + two_weeks,
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: user_id,
            title: "Clean Room",
            description: "Clean your own room. Example: Make your bed, vacuum your room, pickup and put all out-of-place items in their proper place, clean and organize tables and/or desks. ",
            price: 5,
            difficultyLvl: 4,
            completeBy: current_date + two_weeks,
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: user_id,
            title: "Dust House",
            description: "Dust all shelves and tables in the house",
            price: 9,
            difficultyLvl: 1,
            completeBy: current_date + two_weeks,
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: user_id,
            title: "Clean Kitchen",
            description: "Clean the dishes, tables, appliances, and counters",
            price: 15,
            difficultyLvl: 4,
            completeBy: current_date + two_weeks,
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: user_id,
            title: "Laundry",
            description: "Wash, Dry and put-up all the laundry",
            price: 20,
            difficultyLvl: 5,
            completeBy: current_date + two_weeks,
            isFunded: true,
            isAvailable: true,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
        {
            user_id: user_id,
            title: "Clean Living Room",
            description: "Pickup the Living Room. Example: Fold all blankets, pickup and put all out-of-place items in their proper place, and put the remote control in a central place.",
            price: 5,
            difficultyLvl: 1,
            completeBy: current_date + two_weeks,
            isFunded: false,
            isAvailable: false,
            isCheckedOut: false,
            isCompleted: false,
            isApproved: false,
            isPaid: false,
        },
    ]

  end
end
