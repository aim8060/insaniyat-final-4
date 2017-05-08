class CreateUnregisters < ActiveRecord::Migration[5.0]
  def change
    create_table :unregisters do |t|
      t.string :name
      t.string :phoneno

      t.timestamps
    end
  end
end
