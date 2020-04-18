json.extract! chore, :user_id, :title, :description,
              :completeBy, :isFunded, :isAvailable, :isCheckedOut,
              :isCompleted, :isApproved, :isPaid
json.url chore_url(chore, format: :json)
