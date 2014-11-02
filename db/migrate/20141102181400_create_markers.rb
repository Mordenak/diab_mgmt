class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|

      t.column :blood_sugar, :integer
      t.column :units, :float
      t.column :carbs, :integer

      t.column :notes, :string

      t.timestamps
    end
  end
end
