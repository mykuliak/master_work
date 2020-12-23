class CreateBots < ActiveRecord::Migration[5.2]
  def change
    create_table :bots do |t|
      t.string :username
      t.string :description
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
