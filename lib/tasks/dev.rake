# frozen_string_literal: true

namespace :dev do
  desc "Add articles"
  task reset: :environment do
    system("rails db:drop")
    system("rails db:create")
    system("rails db:migrate")
    system("rails db:seed")
    system("rails dev:add_articles")
    system("rails dev:add_acompanhantes")
  end

    task add_articles: :environment do
    show_spinner("Adding Articles...") { add_articles }
  end

  task add_acompanhantes: :environment do
    show_spinner("Adding acompanhantes...") { add_acompanhantes }
  end

  def add_articles
    50.times do
      title = Faker::Lorem.sentence.delete(".")
      body = Faker::Lorem.paragraph(sentence_count: rand(100..200))
      article = Article.create!(title: title, body: body)

      image_id = rand(1..7)
      article.cover_image.attach(
        io: File.open("#{Rails.root}/lib/tasks/images/article_#{image_id}.jpg"), filename: "article_#{image_id}.jpg"
      )
    end
  end

  def add_acompanhantes
    50.times do
      nome = Faker::Name.female_first_name
      idade = rand(19..25)
      altura = rand(1.55..1.80).round(2)        # decimal
      peso = rand(50.0..75.0).round(1)          # decimal
      manequin = rand(36..42)                   # integer
      pes = rand(35..40)                        # integer
      cabelos = Faker::Color.color_name
      olhos = ["castanhos", "verdes", "azuis", "pretos"].sample
      tipo = ["atlética", "curvilínea", "magra"].sample
      biotipo = ["ectomorfo", "mesomorfo", "endomorfo"].sample
      cpf = "000.000.000-00" # string
      pais = "Brasil"
      estado = Faker::Address.state
      cidade = Faker::Address.city
      bairro = Faker::Address.community
      logradouro = Faker::Address.street_name

      acompanhante = Acompanhante.create!(
        nome: nome,
        idade: idade,
        altura: altura,
        peso: peso,
        manequin: manequin,
        pes: pes,
        cabelos: cabelos,
        olhos: olhos,
        tipo: tipo,
        biotipo: biotipo,
        cpf: cpf,
        pais: pais,
        estado: estado,
        cidade: cidade,
        bairro: bairro,
        logradouro: logradouro,
      )

      image_id = rand(1..8)
      acompanhante.img_destaque_1.attach(
        io: File.open("#{Rails.root}/lib/tasks/images/acompanhante_#{image_id}.jpg"), filename: "acompanhante_#{image_id}.jpg"
      )
    end
  end



  def show_spinner(msg_start, msg_end = "Done!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
