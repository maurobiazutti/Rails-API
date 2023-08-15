class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  def hello
    I18n.t('hello')
  end
end
