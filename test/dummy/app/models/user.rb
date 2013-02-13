class User < ActiveRecord::Base
  attr_accessible :email
#  recommends :movies, :books
 recommends :movies => :determines_similarity, :books => :remmended
end
