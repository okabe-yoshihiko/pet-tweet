class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string    :image  
      t.integer   :user_id
      t.string    :name
      t.string    :text
      t.text      :charactarisitc
      t.text      :find
      t.text      :tell
      t.timestamps
    end
  end
end
