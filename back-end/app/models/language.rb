class Language < ActiveRecord::Base
  validates :name, presence: true
  validates :extension, presence: true

  has_many :snippets
end
