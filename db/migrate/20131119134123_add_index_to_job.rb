class AddIndexToJob < ActiveRecord::Migration
  def change
    add_index :jobs, :titolo, name: 'titolo_index'
    add_index :jobs, :nome_azienda, name: 'nome_azienda_index'
    add_index :jobs, :created_at, name: 'created_at_index'
  end
end
