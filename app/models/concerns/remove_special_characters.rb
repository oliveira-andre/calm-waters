module RemoveSpecialCharacters
  extend ActiveSupport::Concern

  def cpf=(value)
    super(value.gsub(/[^\w]/, '')) unless value.blank?
  end
end