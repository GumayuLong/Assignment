class ChangeJobTypeToIntegerInJobs < ActiveRecord::Migration[7.2]
  def change
    change_column :jobs, :job_type, :integer
  end
end