class ProposalsController < ApplicationController
  before_filter :load_contacts
  
  access_control do
      allow :administrator, :all
      allow :supervisor, :all
      allow :seller, :all
  end
  
  def index
    if current_user.has_role?(:administrator)
      @proposals = Proposal.all(:conditions => ['status < 4'])
    else
      @proposals = current_user.proposals.all
    end
  end
  
  def new
    @proposal = Proposal.new
    @products = Product.all(:order => :name, :conditions =>["active = true"], :include => [:color, :finish]).collect { |p| [p.name+" / "+p.color.name+" / "+p.finish.name, p.id]}
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
      
      #ENVIA EMAIL
      UserMailer.proposal_send(@proposal).deliver
      
      redirect_to proposals_path, :notice => "Successfully created user."
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
    @proposal_itens = @proposal.proposal_items

    @id_comercial = "Proposta número " + @proposal.id.to_s + " - " + @proposal.contact.name

    respond_to do |format|
      format.html
      format.pdf do          
        d = DateTime.now.strftime("%d-%m-%Y") 
        @Data = "Atibaia/SP, "+ I18n.l(DateTime.now, :format => :long_date)
        render  :pdf          => "Orcamento - Lythos - #{@id_comercial} - #{d}",
                :layout       => "/layouts/proposal.html.haml",
                :template     => "/proposals/generate_pdf.html.haml",
                :show_as_html => params[:debug].present?,
                :margin       => {:top                => 20,                     # default 10 (mm)
                                  :bottom             => 20,
                                  :left               => 15,
                                  :right              => 15},                  
                :page_size => 'A4',

                :header => {
                            :right => '[page] of [topage]',
                            :html => { 
                                      :template => '/proposals/_header_pdf.html.haml',  
                                      },
                            },

                :footer => {
                            :html => { 
                                      :template => '/proposals/_footer_pdf.html.haml',  
                                      },
                            }             

        end
    end   
    
    
    
    
  end
  
  def update
    @proposal = Proposal.find(params[:id])
    if @proposal.update_attributes(params[:proposal])
      redirect_to proposals_path, :notice  => "Successfully updated user."
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
    UserMailer.proposal_status_changed(@proposal).deliver
    
    redirect_to orders_path, :notice => "Status alterado com sucesso!"
  end
  
  def denial
    @proposal = Proposal.find(params[:id])
    @proposal.status = 2
    @proposal.save
    UserMailer.proposal_status_changed(@proposal).deliver
    
    redirect_to proposals_path, :notice => "Status alterado com sucesso!"
  end
  
  def load_contacts
    @contacts = Contact.all.collect { |c| [c.name, c.id] }
  end
end
