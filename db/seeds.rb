# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
   Role.create([{:name => 'Administrador'}, {:name => 'Convidado'}])

#User
  User.create(:login => 'mgswolf',:nome=>"Marcelo Giovane Silva",:role_id=>1,:email=>'mgswolf@gmail.com', :password =>'123844', :password_confirmation => "123844")

    Sobre.create(:nome => "EulerDesign", :descricao=>"Ola Gostaria de me apresentar, sou Euler G. Rodrigues o 'EulerDesign', natural de Belo Horizonte - MG e criado em Caldas Novas - GO atualmente curso faculdade de 'Tecnologia em sistemas para internet' pelo iFgoiano/morrinhos . Na adolescência tomei interesse pelo software gráfico photoshop apenas por 'hobby' e hoje uso o mesmo para criação de layouts, baners, logotipos, manipulações fotograficas entre outros. Afim de agregar diferenciais em minhas produções também aprendi e trabalho com Html e css. Recentemente trabalhei em uma sociedade informal na ROR – Caldas hoje inexistente, onde conquistei experiências, amigos e conhecimento, mesmo com o término da ROR – Caldas onde eu era membro atuante, continuo no meio como freelancer atuando da mesma forma em parceria com amigos e antigos sócios. Abaixo segue alguns projetos que trabalho e participo, e se você tem algum projeto no qual deseja minha parceria é só entrar em contato que responderei o mais rápido possível.")

