require 'csv'

class JobImporter
  def initialize(file)
    @file = file
  end

  def import
    CSV.foreach(@file.path, headers: true) do |row|
      job = Job.new(job_attributes(row))
      job.save!
    end
  end

  private

  def job_attributes(row)
    {
      title: row['title'],
      company_id: row['company_id'],
      location: row['location'],
      job_type: map_job_type(row['job_type']),
      description: row['description']
    }
  end

  def map_job_type(job_type_string)
    case job_type_string.downcase
    when 'full_time'
      1
    when 'part_time'
      2
    when 'freelance'
      3
    else
      raise 'Invalid job type'
    end
  end
end
