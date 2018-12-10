class TankSerializer < ActiveModel::Serializer
  attributes :id, :acidity, :temperature, :oxigen, :ammonia, :ph

  def diary_data
    tank = Tank.find(object[:id])
    tank.update(acidity: object[:acidity], temperature: object[:temperature], oxigen: object[:oxigen], ammonia: object[:ammonia], ph: object[:ph])
    tank
  end

end
