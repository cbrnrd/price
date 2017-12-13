require 'active_support'
require 'paint'
require 'http'
require 'json'
require 'terminal-table'

module Price

  def self.prices(limit=10)
    url = "https://api.coinmarketcap.com/v1/ticker/?limit=#{limit}"
    begin
      parsed = JSON.parse(HTTP.get(url))
    rescue StandardError => e
      puts Paint['Unable to get prices. Check your internet connection.',
        '#e74c3c']
      exit 1
    end
    t = Terminal::Table.new do |rows|

      rows << [Paint['Rank', '#3498db'], Paint['Coin', '#3498db'],
        Paint['Price', '#3498db'], Paint['Change (1h)', '#3498db'],
        Paint['Change (24h)', '#3498db'], Paint['Change (7d)', '#3498db'],
        Paint['Market Cap (USD)', '#3498db']]
      rows.add_separator

      parsed.each do |n|

        green = '#2ecc71'
        red   = '#e74c3c'

        one_h_change  = n['percent_change_1h'] + '%'
        day_change = n['percent_change_24h'] + '%'
        week_change  = n['percent_change_7d'] + '%'

        # Do some color stuff here
        if one_h_change.include?('-')
          one_h_change = Paint[one_h_change, red]
        else
          one_h_change = Paint[one_h_change, green]
        end

        if day_change.include?('-')
          day_change = Paint[day_change, red]
        else
          day_change = Paint[day_change, green]
        end

        if week_change.include?('-')
          week_change = Paint[week_change, red]
        else
          week_change = Paint[week_change, green]
        end


        rows << [n['rank'], n['name'], '$' + n['price_usd'], one_h_change,
          day_change, week_change,
          ActiveSupport::NumberHelper.number_to_human(n['market_cap_usd'].to_i)]
      end
    end
    return t
  end
  
end
