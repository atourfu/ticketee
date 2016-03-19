class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :state
  
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  
  has_many :assets
  has_and_belongs_to_many :tags
  
  accepts_nested_attributes_for :assets
  
  has_many :comments
  
  attr_accessor :tag_names
  
  before_create :associate_tags

  private

  def associate_tags
    if tag_names
      tag_names.split(" ").each do |name|
        self.tags << Tag.find_or_create_by(name: name)
      end 
    end
  end
end
