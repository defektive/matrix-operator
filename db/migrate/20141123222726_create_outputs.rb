class CreateOutputs < ActiveRecord::Migration
  def change
    create_table :outputs do |t|
      t.string :name
      t.string :output
      t.integer :input

      t.timestamps
    end
  end
end
