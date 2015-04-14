class Dynamic < ActiveRecord::Base
  belongs_to :user
  has_many :boards
  accepts_nested_attributes_for :boards
end