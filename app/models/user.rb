class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :generate_coach_player_parent

  private

  def generate_coach_player_parent
    if parent
      Parent.create(f_name: self.f_name, l_name: self.l_name, email: self.email, phone: self.phone)
    end
    if player
      menage = Menage.create()
      Player.create(menage: menage)
    end
    if coach
      Coach.create()
    end
  end

end
