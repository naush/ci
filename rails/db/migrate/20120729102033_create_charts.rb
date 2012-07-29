class CreateCharts < ActiveRecord::Migration
  def up
    create_table :charts do |t|
      t.references :song
      t.string :url
      t.timestamps
    end
  end

  def down
    drop_table :charts
  end
end
