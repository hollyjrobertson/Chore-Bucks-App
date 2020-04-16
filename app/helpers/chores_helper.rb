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
end
