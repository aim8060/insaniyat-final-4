class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :status
      t.date :requestdate
      t.string :place
      t.string :city
      t.string :relation
      t.string :gender
      t.string :mentalstatus
      t.string :name
      t.string :fathername
      t.string :age
      t.string :clothes
      t.string :clothescolor
      t.string :description
      t.string :contact
      t.integer :user_id

      t.timestamps
    end
  end
end
