class CreateJobsLocations < ActiveRecord::Migration[7.2]
  def change
    create_table :jobs_locations do |t|
      t.references :job, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
