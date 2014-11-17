module DropDownHelper
  # Create an array of user emails from devise, to be used for making drop-down selectors. (Emails appear as [First Last].)
  def email_select
    User.pluck(:email).map { |value| [ (value.rpartition('_').first + " " + value.rpartition('_').last.rpartition('@').first).titleize, value ] }
  end
  
  # Create an array of Areas from the planned_tasks model, to be used for making drop-down selectors.
  def area_select
    Area.uniq.pluck(:name).map { |value| [ value, value ] }
  end
  
  # Create an array of Equipment, to be used for making drop-down selectors.
  def equipment_select
    Equipment.uniq.pluck(:equipment, :number).map { |equipment, number| [ equipment + '     | No. #' + number.to_s, equipment ] }
  end
  
  # Create an array of Parts from the planned_tasks model, to be used for making drop-down selectors.
  def part_select
    Part.uniq.pluck(:part).map { |value| [ value, value ] }
  end
  
  def method_select
    TaskMethod.uniq.pluck(:method).map { |value| [ value, value ] }
  end
end 