require 'open-uri'
Dialect.create!(name: "Yoda", key_name: 'yoda', icon: URI.parse('https://d13yacurqjgara.cloudfront.net/users/901862/screenshots/2211754/yoda-01_1x.png'))
Dialect.create!(name: "Valley Girl", key_name: 'valley', icon: URI.parse('https://image.freepik.com/free-icon/running-girl_318-29572.jpg'))
Dialect.create!(name: "Binary (messy)", key_name: 'binary', icon: URI.parse('https://image.freepik.com/free-icon/binary-code_318-102382.jpg'))

User.create!(username: "alice", password: "wonderland", dialect_id: 1)
User.create!(username: "bob",   password: "asdfasdf", dialect_id: 2)
User.create!(username: "emba",   password: "asdfasdf", dialect_id: 3)
