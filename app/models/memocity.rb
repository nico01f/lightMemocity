class Memocity < ActiveRecord::Base
  before_save :capitalize_content
  VALID_PHONE_NUMBER_REGEX = /\A(?:\+?|\b)[0-9]{11}\b/i

  validates :phoneNumberMemo, presence: true, length: { maximum: 11}, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :contentMemo, presence: true, length: { maximum: 120 }
  validates :activationDateMemo, presence: true
  validate :activation_date_greater_than_now
  private

  def capitalize_content
    self.contentMemo = contentMemo.capitalize
  end

  def activation_date_greater_than_now
    if self.activationDateMemo <= Time.now
      errors.add(:base, "Fecha debe ser mayor a la actual")
    end
  end
end
