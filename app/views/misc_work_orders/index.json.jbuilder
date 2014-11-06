json.array!(@incomplete_work_orders) do |work_order|
  json.extract! work_order, :id, :urgency, :description
  json.title work_order.id
  json.start work_order.start_date
  json.end work_order.due_date
  json.url misc_work_order_url(work_order, format: :html)
end