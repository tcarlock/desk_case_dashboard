module API
  class Client
    extend Configuration
    extend Connection

    def cases
      get_list :cases
    end

    def labels
      get_list :labels
    end

    # def case(id)
    #   get_item :case, id
    # end

    def tag_case(id, tag)

    end

    protected

    def get_list(resource, params = {})
      response = Client.connection.get("#{API::Client.api_url}/#{resource}")

      case response.code.to_i
      when 404
        return nil
      when 200
        response = JSON.parse(response.body)
        ::CollectionResponseParser.parse response["_embedded"]["entries"]
      end
    end

    # def get_item(resource, params = {})
    #   response = Client.connection.get("#{API::Client.api_url}/#{resource}")

    #   case response.code.to_i
    #   when 404
    #     return nil
    #   when 200
    #     results = []
    #     response = JSON.parse(response.body)
    #     response["_embedded"]["entries"].each do |entry|
    #       entry_obj = Hashie::Mash.new(entry)
    #       entry_obj.id = URI(entry_obj._links.self.href).path.split('/').last.to_i

    #       results << entry_obj
    #     end

    #     {
    #       total: response["total_entries"],
    #       results: results
    #     }
    #   end
    # end
  end
end