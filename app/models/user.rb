# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  role       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  group_name :string(255)
#

class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  validates :group_name, presence: true


  def read_csv(file_location)

    @content_array = CSV.read(file_location)
    @content_array

  end

# Need to refactor this method to clean it up and make it single purpose.
  def database_insert

    @content_array.each do |element|
      new_user = User.new
      new_group = Group.new
      new_user.first_name = element[0]
      new_user.last_name = element[1]
      new_user.group_name = element[2]
      new_user.role = element[3]

      new_group.name = element[2]

      new_user.save
      new_group.save
      new_group.users << new_user
    end
  end




end
