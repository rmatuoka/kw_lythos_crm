class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :role, :collaborator_ids, :avatar, :company_logo
  
  attr_accessor :role  
  #has_many :teams
  #has_many :collaborators, :through => :teams, :source => :collaborator  
  has_and_belongs_to_many :collaborators, :class_name => "User", :join_table => "collaborators_users", :foreign_key => "user_id", :association_foreign_key => "collaborator_id"
  
  has_many :proposals
  has_many :contacts
  has_many :goals_sellers
  
  acts_as_authentic do |c|
    c.login_field = "email"
  end
  
  acts_as_authorization_subject :association_name => :roles, :join_table_name => :roles_users
  after_save :define_role
  
  has_attached_file :avatar, 
                    :styles  => { 
                      :big => "130x130#", 
                      :medium => "68x68#", 
                      :small => "30x30#"},
                    :convert_options => {
                      :big => "-quality 75 -strip", 
                      :medium => "-quality 75 -strip", 
                      :small => "-quality 75 -strip" },
                    :default_url => "/assets/users/:style/missing.png"
  
  has_attached_file :company_logo, 
                    :styles  => { 
                      :big => "200x200>", 
                      :medium => "100x100#", 
                      :small => "50x50>"},
                    :convert_options => {
                      :big => "-quality 75 -strip", 
                      :medium => "-quality 75 -strip", 
                      :small => "-quality 75 -strip" }
  
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
