class PersonSearch
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attribute :age, String
  attribute :hair_color, String
  attribute :eye_color, String

  def persisted?
    false
  end

  def matched_ages
    if (age.present? and age == 'Over 30')
      @scope = @scope.over_age(30)
    elsif (age.present? and age == "Under 30")
      @scope = @scope.under_age(30)
    end
  end

  def matched_hair_color
    if (hair_color.present? and hair_color == 'red')
      @scope = @scope.with_red_hair
    elsif (hair_color.present? and hair_color == "brown")
      @scope = @scope.with_brown_hair
    elsif (hair_color.present? and hair_color == "blonde")
      @scope = @scope.with_blond_hair
    elsif (hair_color.present? and hair_color == "black")
      @scope = @scope.with_black_hair
    end
  end

  def matched_eye_color
    if (eye_color.present? and eye_color == 'blue')
      @scope = @scope.with_blue_eyes
    elsif (eye_color.present? and eye_color == "brown")
      @scope = @scope.with_brown_eyes
    elsif (eye_color.present? and eye_color == "green")
      @scope = @scope.with_green_eyes
    end
  end

  def matches

    @scope = Person.scoped

    matched_ages

    matched_hair_color

    matched_eye_color

    @scope

  end

end
