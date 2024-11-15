namespace :job_import do
  desc 'Import jobs from CSV'
  task import: :environment do
    # Đường dẫn đến file CSV cần import
    file_path = Rails.root.join('db', 'jobs.csv')

    # Kiểm tra nếu file CSV tồn tại
    if file_path.present? && File.exist?(file_path)
      job_importer = JobImporter.new(File.open(file_path))
      job_importer.import
      puts 'Jobs imported successfully.'
    else
      puts 'Invalid file path.'
    end
  end
end
