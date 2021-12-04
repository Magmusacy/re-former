class User < ApplicationRecord
  validates :username, presence: true, length: { in: 4..12 }
  validates :password, presence: true, length: { in: 7..21 }
  validates :email, format: { with: /.@./ }
end
