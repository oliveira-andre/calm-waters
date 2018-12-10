class TankSerializer < ActiveModel::Serializer
  attributes :id, :acidity, :temperature, :oxigen, :ammonia, :ph, :depopulation_date, :final_quantity

  def diary_data
    tank = Tank.find(object[:id])
    tank.update(acidity: object[:acidity], temperature: object[:temperature], oxigen: object[:oxigen], ammonia: object[:ammonia], ph: object[:ph], depopulation_date: object[:depopulation_date], final_quantity: object[:final_quantity])
    tank
  end

end
