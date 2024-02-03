class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string "title"
      t.string "studio"
      t.integar "year_released"
      t.string "ratings"
      t.timestamps
    end
  end
end
