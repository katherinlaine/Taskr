class Task < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true

  def complete!
    self.completed = true
    save
  end

  def rewind!
    self.update(completed: false)
  end
end
