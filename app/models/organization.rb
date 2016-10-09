class Organization < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :case_files, through: :involvements
  has_many :involvements, as: :involvable, dependent: :destroy

  validates :name, presence: true

  INDUSTRY = ['Agency', 'Marine', 'Services', 'Manufacturing', 'Conservancy', 'Landscape Works', 'Government', 'Others']

end

Organization.import force: true
