json.extract! student_plan, :id, :people_id, :tuition_fee_id, :discount_id, :rent_inclusion, :due_day, :created_at, :updated_at
json.url student_plan_url(student_plan, format: :json)
