class Order < ApplicationRecord
  belongs_to :user
  belongs_to :set_meal

  scope :by_begin_time_and_end_time, lambda {|begin_time, end_time|
    where("created_at >= :begin_time AND created_at <= :end_time", begin_time: begin_time, end_time: end_time)
  }
end
