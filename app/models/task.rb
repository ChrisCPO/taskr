class Task < ActiveRecord::Base
  belongs_to :user

  def complete!
    update(completed: true)
  end
end
