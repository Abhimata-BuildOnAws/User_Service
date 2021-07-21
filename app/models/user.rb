class User < ApplicationRecord
  geocoded_by :address

  # Validations
  validates :email, uniqueness: true

  after_validation :geocode

  def address
    if state == country
      [street, country].compact.join(', ')
    else
      [street, state, country].compact.join(', ')
    end
  end

  def update_tree_points!(tree_points)
    self.increment(:tree_points, by = tree_points)
    save!
  end

  def update_pollution!(pollution)
    self.increment(:pollution, by = pollution)
    save!
  end
end
