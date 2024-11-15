puts 'In processing ...'
locations = []
7.times do
  locations << Location.create(locate: Faker::Address.city)
end

companies = []
10.times do
  companies << Company.create(
    name: Faker::Company.name,
    created_at: Faker::Date.backward(days: 30)
  )
end

50.times do
  job_type = [:full_time, :part_time, :freelance].sample
  job = Job.create!(
    title: Faker::Job.title,
    company: companies.sample,
    location: Faker::Address.city,
    job_type: Job.job_types[job_type],
    description: Faker::Lorem.paragraph(sentence_count: 50),
  )
  job.locations << locations.sample(rand(1..3))
end
print '... done!'
