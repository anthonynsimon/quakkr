class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true, foreign_key: true
      t.references :notified_by, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.integer :identifier
      t.string :event_type
      t.boolean :read

      t.timestamps null: false
    end
  end
end
