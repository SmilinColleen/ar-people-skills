class User < ActiveRecord::Base

  has_many :proficiencies
  has_many :skills, through: :proficiencies


  def proficiency_for(skill)
    # Proficiency.where(skill_id: skill.id, user_id: self.id)
    #     .pluck(:proficiency).join('').to_i
    # the follow results in the same as the above 2 lines but easier to quickly understand
    Proficiency.find_by_user_id_and_skill_id(self.id, skill.id).proficiency
  end

  def set_proficiency_for(skill, number)
    # id = Proficiency.where(skill_id: skill.id, user_id: self.id)
    #     .pluck(:id).join('').to_i
    id = Proficiency.find_by_user_id_and_skill_id(self.id, skill.id)
    Proficiency.update(id, proficiency: number)

  end


end
