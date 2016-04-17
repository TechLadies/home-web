json.set! :results do
  json.array! @results do |result|
    json.id result.id
    json.text result.name
  end
end
