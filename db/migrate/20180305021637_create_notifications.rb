class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.integer :actor_id
      t.string :action
      t.integer :notifiable_id
      t.string :notifiable_type
      t.string :string
      t.datetime :read_at

      t.timestamps null: false
    end
  end
end
