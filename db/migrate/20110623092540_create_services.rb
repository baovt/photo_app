class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :name
      t.string :description
      t.boolean :featured

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
