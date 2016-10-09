class Person < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :case_files, through: :involvements
  has_many :involvements, as: :involvable, dependent: :destroy

  validates :name, :gender, presence: true

end

Person.import force: true
