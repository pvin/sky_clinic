class Event < ActiveRecord::Base

  scope :order_by_latest_scope, -> { order('created_at DESC')}

end
