class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_at
      t.boolean :is_done, default: false
      t.timestamps
    end
  end
end
