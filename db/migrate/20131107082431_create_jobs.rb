class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :titolo
      t.text :descrizione
      t.string :nome_azienda
      t.string :sito_web
      t.string :email

      t.timestamps
    end
  end
end
