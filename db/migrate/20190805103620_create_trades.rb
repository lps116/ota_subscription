class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.string :direction
      t.string :instrument
      t.integer :exit
      t.integer :entry
      t.boolean :open, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
