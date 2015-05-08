class CreateJellyfishAuditEvents < ActiveRecord::Migration
  def change
    create_table :jellyfish_audit_events do |t|
      t.text :controller
      t.text :method
      t.text :action
      t.text :format
      t.text :path
      t.text :params
      t.timestamps null: false
    end
  end
end
