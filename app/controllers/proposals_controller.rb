class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end
  
  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(params[:proposal])
    if @proposal.save
      
      #SALVA ITENS DA PROPOSTA
      params[:proposals][:items].each do |key,value|

        @proposal_item = @proposal.proposal_items.build 
        @proposal_item.quantity = value[:quantity]
        @proposal_item.product = value[:product]
        @proposal_item.value = value[:value]
        
        @proposal_item.save
      end
      
      redirect_to proposal_path(@proposal), :notice => "Successfully created user."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @edit = true
    @proposal = Proposal.find(params[:id])
  end
  
  def show
    @proposal = Proposal.find(params[:id])
  end
  
  def update
    @proposal = Proposal.find(params[:id])
    if @proposal.update_attributes(params[:proposal])
      redirect_to proposal_path(@proposal), :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy
    redirect_to proposals_path, :notice => "Usuário Deletado com sucesso!"
  end
  
  def approve
    @proposal = Proposal.find(params[:id])
    @proposal.status = 3
    @proposal.save
    redirect_to orders_path, :notice => "Status alterado com sucesso!"
  end
  
  def denial
    @proposal = Proposal.find(params[:id])
    @proposal.status = 2
    @proposal.save
    redirect_to proposals_path, :notice => "Status alterado com sucesso!"
  end
end
