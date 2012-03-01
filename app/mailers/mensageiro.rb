# -*- encoding : utf-8 -*-
class Mensageiro < ActionMailer::Base
  default :from => "from@example.com"

def contato(nome,email,assunto,origem,mensagem)
    @nome = nome
    @email = email
    @assunto=assunto
    @origem=origem
    @mensagem =mensagem
    mail(:to=>'eulerdesigner@gmail.com',:from=>nome, :subject=>assunto)
  end
end
