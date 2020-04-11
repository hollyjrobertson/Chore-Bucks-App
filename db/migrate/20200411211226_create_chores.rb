class CreateChores < ActiveRecord::Migration[5.1]
  def change
    create_table :chores do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :difficultyLvl
      t.date :completeBy
      t.boolean :isFunded
      t.boolean :isAvailable
      t.boolean :isCheckedOut
      t.boolean :isCompleted
      t.boolean :isApproved
      t.boolean :isPaid
      t.timestamps null: false
      t.timestamps
    end
  end
end
