# frozen_string_literal: true

json.set! :task do
  json.extract! @task, :id, :name, :is_done, :created_at, :updated_at
end
