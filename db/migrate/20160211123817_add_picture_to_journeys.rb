class AddPictureToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :picture, :string
  end
end
