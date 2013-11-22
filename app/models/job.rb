class Job < ActiveRecord::Base
  validates :titolo, :descrizione, :nome_azienda, :user_id, presence: true
  validates :email,  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :sito_web, format: { without: /http/, message: 'non necessita di http'}
  belongs_to :user

  def self.search(params)
    scope = scoped.order("created_at Desc").select('id, titolo, nome_azienda, created_at')
    scope = scope.where(["titolo LIKE ? OR descrizione LIKE ? OR nome_azienda LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%","%#{params[:q]}%" ]) if params[:q].present?
    scope
  end

  def to_param
    "#{self.id}-#{nome_azienda}-#{titolo}".parameterize
  end
end
