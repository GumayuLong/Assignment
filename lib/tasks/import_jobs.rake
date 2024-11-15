namespace :import do
  desc 'Import jobs from CSV'
  task jobs: :environment do
    require 'csv'

    # Đường dẫn đến file CSV cần import
    file_path = Rails.root.join('db', 'jobs.csv')

    # Kiểm tra nếu file CSV tồn tại
    if File.exist?(file_path)
      CSV.foreach(file_path, headers: true) do |row|
        job_type_symbol = row['job_type'].strip.downcase.to_sym
        job_type_value = Job.job_types[job_type_symbol]

        if job_type_value.nil?
          puts "Invalid job_type: #{row['job_type']}, skipping..."
          next
        end

        # Dữ liệu từ CSV
        if job_type_value
          job_data = {
            title: row['title'],
            company_id: row['company_id'],
            location: row['location'],
            job_type: job_type_value,
            description: row['description']
          }

          Job.create!(job_data)
        else
          puts "Skipping job with invalid job_type: #{row['job_type']}"
        end
      end

      puts 'Jobs imported successfully!'
    else
      puts 'CSV file not found!'
    end
  end
end
