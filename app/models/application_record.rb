class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_associations(auth_object = nil)
    super # unauthorized_ransackable_associations
  end
end
