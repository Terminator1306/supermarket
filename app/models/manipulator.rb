class Manipulator < ActiveRecord::Base
	  validates :m_name,presence:{message:'blank is not allowed'}
      validates :password,presence:{message:'blank is not allowed'}
      validates :m_type,presence:{message:'blank is not allowed'}
end
