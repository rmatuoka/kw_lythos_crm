class OrdersController < ApplicationController
  access_control do
      allow :administrator, :all
      allow :supervisor, :all
      allow :seller, :all
  end
  
  def index
    @proposals = Proposal.all_by_role(current_user, 'status > 2')
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
