# Модель события
class Event < ApplicationRecord
  # Событие принадлежит юзеру
  belongs_to :user

  # Юзера не может не быть. Обратите внимание, что в rails 5 связи валидируются
  # по умолчанию
  # У события много комментариев и подписок
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  # У события много подписчиков (объекты User), через таблицу subscriptions,
  # по ключу user_id
  has_many :subscribers, through: :subscriptions, source: :user

  # У события много фотографий
  has_many :photos, dependent: :destroy

  validates :user, presence: true

  # Заголовок должен быть, и не может быть длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}

  # Также у события должны быть заполнены место и время проведения
  validates :address, presence: true
  validates :datetime, presence: true

  def visitors
    (subscribers + [user]).uniq
  end
end
