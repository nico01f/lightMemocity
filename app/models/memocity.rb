class Memocity < ActiveRecord::Base
  before_save :capitalize_content
  VALID_PHONE_NUMBER_REGEX = /\A(?:\+?|\b)[0-9]{11}\b/i

  validates :phoneNumberMemo, presence: true, length: { maximum: 11}, format: { with: VALID_PHONE_NUMBER_REGEX }
  #validates :contentMemo, presence: true, length: { maximum: 120 }
  validates :activationDateMemo, presence: true
  validate :activation_date_greater_than_now
  validate :contentMemo_is_valid
  private

  def capitalize_content
    self.contentMemo = contentMemo.capitalize
  end

  def activation_date_greater_than_now
    if self.activationDateMemo <= DateTime.now
      errors.add(:base, "Fecha/Hora debe ser mayor a la actual")
    end
  end

  def contentMemo_is_valid
    if self.contentMemo.empty?
      errors.add(:base, "Contenido no puede quedar en blanco")
    elsif self.contentMemo.length > 140
      errors.add(:base, "El recodatorio no puede ser mayor a 140 caracteres")
    end
  end


end
