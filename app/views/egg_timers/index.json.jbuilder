json.array!(@egg_timers) do |egg_timer|
  json.extract! egg_timer, :id, :type, :assign_time, :overdue_time
  json.url egg_timer_url(egg_timer, format: :json)
end
