class CreatePhonenumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phonenumbers do |t|
      t.string :phoneno
      t.string :pin
      t.string :status

      t.timestamps
    end
  end
end
