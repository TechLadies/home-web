class DomesticWorker < Worker

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  SLEEPING_AREAS = { 0 => 'Bed', 1 => 'Mattress', 2 => 'Pillow', 3 => 'Blanket', 4 => 'Fan', 5 => 'Window', 6 => 'Surveillance Camera' }

end

DomesticWorker.import force: true
