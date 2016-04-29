class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.text :warm_up
      t.text :intro
      t.text :drill
      t.text :practice
      t.text :gamesandactivities
      t.text :review

      t.timestamps null: false
    end
  end
end
