puts "Creating the perfils"
Perfil.create(id: 1, description: "Gestor")
Perfil.create(id: 2, description: "Operador")
Perfil.create(id: 3, description: "Administrador")

puts "Creating the root user"
User.create(name: "Gestor", cpf: "22222222222", password: "123456", perfil_id: 1)
User.create(name: "Operador", cpf: "11111111111", password: "123456", perfil_id: 2)
User.create(name: "Administrador", cpf: "33333333333", password: "123456", perfil_id: 3)

puts "Creating the Type Alarms"
AlarmType.create(description: "Temperatura")
AlarmType.create(description: "Oxigênio")
AlarmType.create(description: "Amonia")
AlarmType.create(description: "Acidez")
