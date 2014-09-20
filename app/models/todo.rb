class Todo < ActiveRecord::Base
	belongs_to :user

	def mark_complete!
		update_attribute(:done, true)
	end

	def undo_complete!
		update_attribute(:done, false)
	end
end
