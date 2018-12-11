puts "Creating the root user"
User.create(name: "André Oliveira", cpf: "03064486292", password: "123456")

puts "Creating the Type Alarms"
AlarmType.create(description: "Temperatura")
AlarmType.create(description: "Oxigênio")
AlarmType.create(description: "Amonia")
AlarmType.create(description: "Acidez")
