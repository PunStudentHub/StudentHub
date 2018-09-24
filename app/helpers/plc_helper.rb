module PlcHelper
  def human_time index
    "#{(index + 6) % 12 + 1}:30"
  end
end
