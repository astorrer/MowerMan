json.array!(@work_orders) do |work_order|
  json.extract! work_order, :plantask_id, :urgency, :description
  json.url work_order_url(work_order, format: :json)
end