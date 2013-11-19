class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :role 
  
  attr_accessor :role
  
  acts_as_authentic do |c|
    c.login_field = "email"
  end
  
  acts_as_authorization_subject :association_name => :roles, :join_table_name => :roles_users
  after_save :define_role
  
  #has_many :users
  
  def role
    @role
    if self.has_role? :administrator
      @role = :administrator
    elsif self.has_role? :supervisor
      @role = :supervisor
    else self.has_role? :seller
      @role = :seller
    end
  end

  def define_role
    if @role
      self.has_no_roles!
      self.has_role! @role
    end
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
  end
  
end
