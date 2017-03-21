Dialect.create!(name: "Yoda", key_name: 'yoda')
Dialect.create!(name: "Valley Girl", key_name: 'valley')
Dialect.create!(name: "Binary (messy)", key_name: 'binary')

User.create!(username: "alice", password: "wonderland", dialect_id: 1)
User.create!(username: "bob",   password: "asdfasdf", dialect_id: 2)
User.create!(username: "emba",   password: "asdfasdf", dialect_id: 3)
