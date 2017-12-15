class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :generate_coach_player_parent
  belongs_to :player, optional: true
  belongs_to :coach, optional: true
  belongs_to :parent, optional: true

  private

  def update_parent
    if is_parent
      parent = current_user.parent.update(f_name: self.f_name, l_name: self.l_name, email: self.email, phone: self.phone)
      parent.save
    end
  end

  def generate_coach_player_parent
    if is_parent
      parent = Parent.create(f_name: self.f_name, l_name: self.l_name, email: self.email, phone: self.phone)
      self.parent = parent
      self.save
    end
    if is_player
      player = Player.new()
      self.player = player
      self.save
    end
    if is_coach
      coach = Coach.new()
      self.coach = coach
      self.save
    end
  end

end
