class Note < ActiveRecord::Base
  belongs_to :board
  belongs_to :dynamic
end
