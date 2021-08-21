json.extract! payment, :id, :student_plan_id, :paid, :payment_fee, :due_date, :payment_link, :created_at, :updated_at
json.url payment_url(payment, format: :json)
