class CreateActors < ActiveRecord::Migration[7.1]
  def change
    create_table :actors do |t|
      t.integer "movie_id"
      t.string "actor_name"
      t.string "character_name"
      t.timestamps
    end
  end
end
