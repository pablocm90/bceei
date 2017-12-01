class CreateCoachingStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :coaching_staffs do |t|

      t.timestamps
    end
  end
end
