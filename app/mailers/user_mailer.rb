class UserMailer < ActionMailer::Base
  helper :application
  default :from => "Lythos <site@nesporte.com.br>"

  def proposal_send(proposal)
    @proposal = proposal
    mail(:to => @proposal.email, :cc => @proposal.cc, :bcc => "log@korewa.com.br", :subject => "Lythos - #{@proposal.user.username} te enviou um orçamento.")   
  end
  
  def proposal_status_changed(proposal)
    @proposal = proposal
    mail(:to => @proposal.email, :cc => @proposal.cc, :bcc => "log@korewa.com.br", :subject => "Lythos - Seu pedido de Nº #{@proposal.id} foi atualizado.")   
  end
  
  def bulletin_send(bulletin)
    @bulletin = bulletin
    mail(:to => "rmatuoka@korewa.com.br", :bcc => "log@korewa.com.br", :subject => "Lythos - Você recebeu um novo comunicado.")
  end
end
