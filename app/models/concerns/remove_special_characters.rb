module RemoveSpecialCharacters
  extend ActiveSupport::Concern

  def cpf=(value)
    super(value.gsub(/[^\w]/, '')) unless value.blank?
  end

  def population_date=(value)
    super(value.gsub(/[^\w]/, '')) unless value.blank?
  end

  def depopulation_date=(value)
    super(value.gsub(/[^\w]/, '')) unless value.blank?
  end

  def price=(value)
    super(value.gsub(/[^\w]/, '')) unless value.blank?
  end
end