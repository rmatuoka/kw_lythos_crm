class HomeController < ApplicationController
  access_control do
      allow :administrator, :all
      allow :supervisor, :all
      allow :seller, :all
  end
  
  def index
    @proposals = Proposal.all(:conditions => ['status > 2'], :limit => 3)
    @bulletins = Bulletin.all(:limit => 3)
  end
end
