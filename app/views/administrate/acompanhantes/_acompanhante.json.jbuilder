# frozen_string_literal: true

json.extract!(acompanhante, :id, :nome, :idade, :altura, :peso, :manequin, :pes, :cabelos, :olhos, :tipo, :biotipo, :cpf, :pais, :estado, :cidade, :bairro, :logradouro, :created_at, :updated_at)
json.url(acompanhante_url(acompanhante, format: :json))
