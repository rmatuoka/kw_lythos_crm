class OrdersController < ApplicationController
  access_control do
      allow :administrator, :all
      allow :supervisor, :all
      allow :seller, :all
  end
  
  def index
    if current_user.has_role?(:administrator)
      @proposals = Proposal.all(:conditions => ['status > 2'])
    else
      @proposals = current_user.proposals.all
    end
  end
  
  def show
    @proposal = Proposal.find(params[:id])
  end
  
  def production
    @proposal = Proposal.find(params[:id])
    @proposal.status = 4
    @proposal.save
    UserMailer.proposal_status_changed(@proposal).deliver
    
    redirect_to orders_path, :notice => "Status alterado com sucesso!"
  end
  
  def sent
    @proposal = Proposal.find(params[:id])
    @proposal.status = 5
    @proposal.save
    UserMailer.proposal_status_changed(@proposal).deliver
    
    redirect_to orders_path, :notice => "Status alterado com sucesso!"
  end
  
  def delivered
    @proposal = Proposal.find(params[:id])
    @proposal.status = 6
    @proposal.save
    UserMailer.proposal_status_changed(@proposal).deliver
    
    redirect_to orders_path, :notice => "Status alterado com sucesso!"
  end
end
