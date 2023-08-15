namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando os tipos de contatos"
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind_description|
      Kind.create!(
        description: kind_description
      )
    end
    puts "Tipos Contato cadastrados com Sucesso!"

    ##################################################

    puts "Cadastrando os contatos"
    15.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrados com Sucesso!"

    ##################################################

    puts "Cadastrando telefones"
    Contact.all.each do |contact|
      Random.rand(5).times do |_|
        contact.phones.create!(
          number: Faker::PhoneNumber.cell_phone
        )
        contact.save!
      end
    end
    puts "Telefones cadastrados com Sucesso!"
  end
end

#phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
#         contact.phones << phone