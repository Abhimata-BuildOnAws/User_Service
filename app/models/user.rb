class User < ApplicationRecord
  geocoded_by :address

  # Validations
  validates :email, uniqueness: true

  after_validation :geocode
  after_create :assign_default_pollution_and_tree_point
  after_create :add_to_order_service

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

  private

  def add_to_order_service
    order_service_ip = ServiceDiscovery.order_service_ip
    # Public IP
    # order_service_ip = "18.141.209.125"
    url = "http://" + order_service_ip + ":3000/user/create"

    headers = { "Content-Type": "application/json; charset=utf-8" }

    conn = Faraday.new(
      url: url,
      headers: headers
    )

    values = {
      "user_id": id
    }
    
    response = conn.post do |req|
      req.body = values.to_json
    end
  end

  def assign_default_pollution_and_tree_point
    update(tree_points: 0, pollution: 0)
    save
  end
end
