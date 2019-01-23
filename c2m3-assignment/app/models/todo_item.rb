class TodoItem < ActiveRecord::Base
  def self.get_completed
    TodoItem.where(completed: true).count
  end
end