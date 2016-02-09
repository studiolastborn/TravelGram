class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.string :title
      t.text :location
      t.text :description
      t.timestamps
    end
  end
end
