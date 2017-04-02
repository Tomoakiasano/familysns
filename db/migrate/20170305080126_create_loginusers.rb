class CreateLoginusers < ActiveRecord::Migration[5.0]
  def change
    create_table :loginusers do |t|
      t.string :name
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
