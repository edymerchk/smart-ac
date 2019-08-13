class GraphGenerator
  COLORS = [
    'rgba(255, 99, 132, 0.2)',
    'rgba(54, 162, 235, 0.2)',
    'rgba(255, 206, 86, 0.2)',
    'rgba(75, 192, 192, 0.2)',
  ]

  def initialize(reports)
    @reports = reports

    @all_data = {
      temperature: [],
      air_humidity: [],
      carbon_monoxide_level: []
    }

    compute_data
  end

  def graph(type)
    {
      labels: months_until_now,
      datasets: [{
        label: type.to_s.titleize,
        backgroundColor: "##{SecureRandom.hex(3)}",
        data: @all_data[type].drop(1)
      }]
    }
  end

  private

  def compute_data
    for month_idx in 1..months_array.size do
      @all_data[:temperature][month_idx] = avg(month_idx, :temperature)
      @all_data[:carbon_monoxide_level][month_idx] = avg(month_idx, :carbon_monoxide_level)
      @all_data[:air_humidity][month_idx] = avg(month_idx, :air_humidity)
    end
  end

  def avg(month_idx, column)
    @reports.where('extract(month from taken_at) = ?', month_idx).average(column).try(:round, 2) || 0
  end

  def months_until_now
     months_array.map { |e| I18n.t("date.month_names")[e]  }
  end

  def months_array
    [*1..Date.today.month]
  end
end
