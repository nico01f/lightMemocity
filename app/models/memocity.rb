class Memocity < ActiveRecord::Base
  before_save :capitalize_content
  VALID_PHONE_NUMBER_REGEX = /\A(?:\+?|\b)[0-9]{11}\b/i

  validates :phoneNumberMemo, presence: true, length: { maximum: 11}, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :contentMemo, presence: true, length: { maximum: 120 }
  validates :activationDateMemo, presence: true

  private

  def capitalize_content
    self.contentMemo = contentMemo.capitalize
  end



end
