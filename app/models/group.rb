class Group < ActiveRecord::Base
  has_many :group_memberships
  has_many :members, through: :group_memberships
 
 #NEW HAS MNAYk
  has_many :groupings
  has_many :images, through: :groupings

  validates :name, presence: true
  validates :description, presence: true
end
