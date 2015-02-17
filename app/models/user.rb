class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relationships
  has_many :favorites, dependent: :destroy  #deletes all favorites if user is destroyed
  
  has_many :comments, dependent: :destroy #...#deletes all comments if user is destroyed

end
