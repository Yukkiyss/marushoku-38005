class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string  :store_name, null: false
      t.integer  :category_id, null: false
      t.text  :store_environment, null: false
      t.text  :recommendation, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
