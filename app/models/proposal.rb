class Proposal < ActiveRecord::Base
  attr_accessible :address, :cc, :city, :contact_id, :email, :number, :postal_code, :state, :status, :user_id
  
  has_many :proposal_items
  belongs_to :contact
  belongs_to :user

  def self.all_by_role_last_3(current_user, status)
    if current_user.has_role?(:administrator)
      self.all(:conditions => [status], :limit => 3, :order => "id DESC")
    
    elsif current_user.has_role?(:supervisor)
      self.find(:all, :include => :user, :conditions => ['users.id = ? OR users.id in (?)',current_user.id, current_user.collaborators], :limit => 3, :order => "proposals.id DESC")
    
    elsif current_user.has_role?(:seller)
      current_user.proposals.all(:conditions => [status], :limit => 3, :order => "id DESC")
    end
  end
  
  def self.all_by_role(current_user, status)
    if current_user.has_role?(:administrator)
      self.all(:conditions => [status], :order => "id DESC")
    
    elsif current_user.has_role?(:supervisor)
      self.find(:all, :include => :user, :conditions => ['users.id = ? OR users.id in (?)',current_user.id, current_user.collaborators], :order => "proposals.id DESC")
    
    elsif current_user.has_role?(:seller)
      current_user.proposals.all(:conditions => [status], :order => "id DESC")
    end
  end
end
