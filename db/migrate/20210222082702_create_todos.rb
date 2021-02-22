class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string "title", null: false
      t.text "content", null: false

      t.timestamps
    end
  end
end
