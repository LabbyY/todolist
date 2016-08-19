class TodosController < ApplicationRecord
  scope :ordered, ->{order("is_finished,created_at desc")}
end
