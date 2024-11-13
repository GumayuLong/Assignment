puts 'In processing ...'
10.times do
  company = Company.create!(
    name: Faker::Name.name,
    created_at: Faker::Date.backward(days: 30)
    )

  rand(3..10).times do
    company.jobs.create!(
      title: Faker::Job.title,
      location: Faker::Address.city,
      job_type: ['Full-time', 'Part-time', 'Freelance'].sample,
      description: Faker::Lorem.paragraph(sentence_count: 50),
      created_at: Faker::Date.backward(days: 30)
    )
  end
end
print '... done!'
