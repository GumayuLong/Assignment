namespace :import do
  desc 'Import jobs from CSV'
  task jobs: :environment do
    require 'csv'

    # Đường dẫn đến file CSV cần import
    file_path = Rails.root.join('db', 'jobs.csv')

    # Kiểm tra nếu file CSV tồn tại
    if File.exist?(file_path)
      CSV.foreach(file_path, headers: true) do |row|
        # Dữ liệu từ CSV
        job_data = {
          title: row['title'],
          company_id: row['company_id'],
          location: row['location'],
          job_type: row['job_type'].to_i,
          description: row['description']
        }
        # Tạo hoặc cập nhật job từ dữ liệu trong CSV
        Job.create!(job_data)
      end

      puts 'Jobs imported successfully!'
    else
      puts 'CSV file not found!'
    end
  end
end
