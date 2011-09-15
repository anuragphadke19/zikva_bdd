class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname
  # Validation for all the user attributes
  validates :email, :presence => true,
                    :uniqueness => {:on => :create},
                    :format => {:with => /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/i, 
                                :message=>" please enter a valid email address"}
  validates :firstname, :lastname, :presence => true
  validates :password, :length => {:minimum => 6, :maximum => 20}, 
                       :on => :create
                       
   def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
     #logger.debug (access_token)
     data = access_token['extra']['user_hash']
     if user = User.find_by_email(data["email"])
       user
     else # Create a user with a stub password. 
       User.create!(:email => data["email"], :password => Devise.friendly_token[0,20], :firstname => data["first_name"], :lastname => data["last_name"]) 
     end
   end
   
   def fullname
     "#{firstname} #{lastname}"
   end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  firstname              :string(255)
#  lastname               :string(255)
#

