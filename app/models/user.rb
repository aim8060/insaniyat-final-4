class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	validates_uniqueness_of :phoneno
	validates_presence_of :phoneno
end
