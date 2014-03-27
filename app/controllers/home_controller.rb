class HomeController < ApplicationController
  access_control do
      allow :administrator, :all
      allow :supervisor, :all
      allow :seller, :all
  end
  
  def index
    @proposals = Proposal.all_by_role_last_3(current_user, 'status < 4')
    @orders = Proposal.all_by_role_last_3(current_user, 'status > 2')
    @bulletins = Bulletin.all(:limit => 3)
  end
end
