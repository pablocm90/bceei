class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :generate_coach_player_parent
  has_one :player
  has_one :coach
  has_one :parent

  private

  def generate_coach_player_parent
    if is_parent
      Parent.create(f_name: self.f_name, l_name: self.l_name, email: self.email, phone: self.phone, user: self)
    end
    if is_player
      player = Player.new(user: self)
      player.save
    end
    if is_coach
      Coach.create(user: self)
    end
  end

end
