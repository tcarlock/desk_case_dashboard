class CollectionResponseParser
  def self.parse json
    results = []

    json.each do |entry|
      entry_obj = Hashie::Mash.new(entry)
      entry_obj.id = URI(entry_obj._links.self.href).path.split('/').last.to_i

      results << entry_obj
    end

    results
  end
end