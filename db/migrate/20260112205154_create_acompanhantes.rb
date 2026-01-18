# frozen_string_literal: true

class CreateAcompanhantes < ActiveRecord::Migration[7.1]
  def change
    create_table(:acompanhantes, id: :uuid) do |t|
      t.string(:nome)
      t.integer(:idade)
      t.decimal(:altura)
      t.decimal(:peso)
      t.integer(:manequin)
      t.integer(:pes)
      t.string(:cabelos)
      t.string(:olhos)
      t.string(:tipo)
      t.string(:biotipo)
      t.string(:cpf)
      t.string(:pais)
      t.string(:estado)
      t.string(:cidade)
      t.string(:bairro)
      t.string(:logradouro)

      t.timestamps
    end
  end
end
