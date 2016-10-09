class QueriesController < ApplicationController

  def show
    @results = Elasticsearch::Model.search(params[:query][:query], [Organization, Person, CaseFile, DomesticWorker, NonDomesticWorker]).records.to_a
  end

end
