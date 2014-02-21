5.times {
  Question.create(title: Faker::Lorem.word, content: Faker::Lorem.sentence)
}
