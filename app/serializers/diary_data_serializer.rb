class DiaryDataSerializer < ActiveModel::Serializer
  attributes :id,  :acidity, :temperature, :oxigen, :ammonia, :ph

  def tank_update
    tank = Tank.find(:id)
    tank.update(acidity: :acidity, temperature: :temperature, oxigen: :oxigen, ammonia: :ammonia, ph: :ph)
    tank
  end

end
