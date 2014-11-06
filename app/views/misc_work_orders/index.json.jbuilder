json.array!(@misc_work_orders) do |misc_work_order|
  json.extract! misc_work_order, :id, :account_number, :cost_unit, :cost_center, :cost_description, :start_date, :due_date, :description, :urgency, :completion_switch
  json.url misc_work_order_url(misc_work_order, format: :json)
end
