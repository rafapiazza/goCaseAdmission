class CreateSurvivors < ActiveRecord::Migration[5.2]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.float :latitude
      t.float :longitude
      t.integer :flag1
      t.integer :flag2
      t.integer :flag3

      t.timestamps
    end
  end
end
