class Contact < ApplicationRecord
  belongs_to :kind

  def hello
    I18n.t('hello')
  end
end
