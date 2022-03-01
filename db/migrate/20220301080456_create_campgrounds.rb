class CreateCampgrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :campgrounds do |t|
      t.string :name
      t.float :max_price
      t.float :min_price

      t.timestamps
    end
  end
end
