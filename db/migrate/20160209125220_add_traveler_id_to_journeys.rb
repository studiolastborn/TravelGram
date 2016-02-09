class AddTravelerIdToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :traveler_id, :integer
  end
end
