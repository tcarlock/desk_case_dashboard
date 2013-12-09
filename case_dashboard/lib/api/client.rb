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

    def create_label(params)
      create_resource :labels, params
    end

    def add_label_to_case(id, label)
      update_resource :case, id, { labels: label }
    end

    protected

    def create_resource(resource, params)
      response = Client.connection.post "#{API::Client.api_url}/#{resource}", params

      case response.code.to_i
      when (400..599)
        []
      when 201
        response = JSON.parse(response.body)
        ::CollectionResponseParser.send "parse_#{resource}", [response]
      end
    end

    def update_resource(resource, id, params)
      response = Client.connection.request "PATCH", "#{API::Client.api_url}/#{resource}/#{id}", params

      case response.code.to_i
      when (400..599)
        false
      when 200
        true
      end
    end

    def get_list(resource)
      response = Client.connection.get "#{API::Client.api_url}/#{resource}"

      case response.code.to_i
      when 404
        return []
      when 200
        response = JSON.parse(response.body)
        ::CollectionResponseParser.send "parse_#{resource}", response["_embedded"]["entries"]
      end
    end
  end
end