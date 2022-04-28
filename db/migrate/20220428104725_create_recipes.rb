class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }, index: true
      t.string 'name'
      t.string 'preparation_time'
      t.text 'cooking_time'
      t.text 'description'
      t.boolean 'bublic', default: false
      t.timestamps
    end
  end
end
