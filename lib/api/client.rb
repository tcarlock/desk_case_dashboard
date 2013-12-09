module API
  class Client
    extend Configuration
    extend Connection

    def cases
      #TODO: This will limit the results to 50 which is ok with current test data; implement paging
      get_list :cases
    end

    def labels
      #TODO: This will limit the results to 50 which is ok with current test data; implement paging
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
      response = Client.connection.post "#{API::Client.api_url}/#{resource}", params.to_json

      case response.code.to_i
      when (400..599)
        []
      when 201
        response = JSON.parse(response.body)
        ::CollectionResponseParser.parse [response]
      end
    end

    def update_resource(resource, id, params)
      # TODO: PATCH is not supported in this version of oauth; look into monkeypatching the gem or using another gem
      response = Client.connection.request :patch, "#{API::Client.api_url}/#{resource}/#{id}", params

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
        ::CollectionResponseParser.parse response["_embedded"]["entries"]
      end
    end
  end
end