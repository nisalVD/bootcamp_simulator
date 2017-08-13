require 'yaml'
require 'date'

scores = [
  {
  name: 'Alan',
  date: Date.today,
  coding: 100,
  social: 100,
  job: 'Google',
  },
  {
  name: 'Ada',
  date: Date.today,
  coding: 100,
  social: 100,
  job: 'Google',
  }
]

puts scores.to_yaml