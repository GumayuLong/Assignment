class CreateApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :applications do |t|
      t.references :job, null: false, foreign_key: true
      t.string :application_name
      t.string :application_email
      t.datetime :application_birthday
      t.string :application_gender

      t.timestamps
    end
  end
end
