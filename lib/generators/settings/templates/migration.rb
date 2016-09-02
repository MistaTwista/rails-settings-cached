class Create<%= class_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= file_name %> do |t|
      t.string  :var,        null: false
      t.text    :value,      null: true
      t.integer :thing_id,   null: true
      t.string  :thing_type, null: true, limit: 30
      t.timestamps
    end

    add_index :<%= file_name %>, %i(thing_type thing_id var), unique: true
  end

  def self.down
    drop_table :<%= file_name %>
  end
end
