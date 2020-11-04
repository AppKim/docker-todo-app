# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.boolean :is_done, default: false, null: false

      t.timestamps
    end
  end
end
