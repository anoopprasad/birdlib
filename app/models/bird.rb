class Bird < ActiveRecord::Base

  def added
    self.created_at
  end

end
