# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { username: 'arte', email: 'arte@arte.com', password: 'asdf', password_confirmation: 'asdf' },
  { username: 'james_brown', email: 'james@brown.com', password: 'asdf', password_confirmation: 'asdf' }
])

challenges = Challenge.create([
  {
    title: 'Add 2 Numbers',
    function_name: 'add2Numbers',
    description: 'When given 2 numbers, return their sum',
    parameters: "[\"x:integer\", \"y:integer\"]",
    user: users[0]
  },
  {
    title: 'Add 3 Numbers',
    function_name: 'add3Numbers',
    description: 'When given 3 numbers, return their sum',
    parameters: "[\"x:integer\", \"y:integer\", \"z:integer\"]",
    user: users[0]
  },
  {
    title: 'Add 4 Numbers',
    function_name: 'add4Numbers',
    description: 'When given 4 numbers, return their sum',
    parameters: "[\"a:integer\", \"b:integer\", \"c:integer\", \"d:integer\"]",
    user: users[1]
  }
])

challenge_tests = ChallengeTest.create([
  {
    inputs: "{\n\"x\": 7,\n\"y\": 8}",
    return_value: 15,
    challenge: challenges[0]
  },
  {
    inputs: "{\n\"x\": 2,\n\"y\": 4}",
    return_value: "6",
    challenge: challenges[0]
  },
  {
    inputs: "{\n\"x\": 7,\n\"y\": 8,\n\"z\": 9}",
    return_value: 24,
    challenge: challenges[1]
  },
  {
    inputs: "{\n\"x\": 1,\n\"y\": 1,\n\"z\": 4}",
    return_value: 6,
    challenge: challenges[1]
  }
])

# "{\n\"x\": \"7\",\n\"y\": \"8\"}"
