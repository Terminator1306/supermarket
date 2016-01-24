class Shoppinglist < ActiveRecord::Base
	has_many:items
	def new
		Shoppinglist.new
	end
	def create
		
	end
end
