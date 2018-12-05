class AutocompleteInputs
  require "hg/weather"

  def initialize
    @weather = HG::Weather.get(city: "porto velho")
  end

  def temperature
    @weather.condition.temperature.celsius
  end

  def sunset
    @weather.condition.sunset
  end
end