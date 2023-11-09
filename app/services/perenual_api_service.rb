require 'httparty'

class PerenualApiService
  include HTTParty
  base_uri 'https://perenual.com/api'

  def initialize
    @options = { query: { key: 'sk-s0Xm64ff46adb034b2130' } }
  end

  def species_list(params={})
    @options[:query].merge!(params)
    self.class.get("/species-list", @options)
  end
end