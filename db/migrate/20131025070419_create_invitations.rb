class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :trip_id
      t.integer :invited_id
      t.string :accepted

      t.timestamps
    end
  end
end
