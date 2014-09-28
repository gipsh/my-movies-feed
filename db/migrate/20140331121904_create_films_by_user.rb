class CreateFilmsByUser < ActiveRecord::Migration
  def up
  	 create_table :films_users, :id => false do |t|
  	  t.date :subscribed
      t.integer :film_id
      t.integer :user_id
    end
     add_index :films_users, [:film_id, :user_id]
  end

  def down
  	 drop_table :films_users
  end
end
