class Category < ApplicationRecord
  has_many :items
  validates_uniqueness_of :title

  def to_param
    title.downcase
  end

  def self.find_by_param(input)
    find_by_title(input.capitalize)
  end

  def self.find(input)
    input.to_i == 0 ? find_by_title(input) : super
  end
end
