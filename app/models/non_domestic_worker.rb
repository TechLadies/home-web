class NonDomesticWorker < Worker

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

end

NonDomesticWorker.import force: true
