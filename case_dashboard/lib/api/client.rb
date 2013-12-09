module API
  class Client
    extend Configuration
    extend Connection

    def cases(page = 1, embed = {}, fields = {})
      get 'cases'
    end

    def tag_case(id, tag)

    end

    protected

    def get(resource, params = {})
      response = Client.connection.get("#{API::Client.api_url}/#{resource}")

      case response.code.to_i
      when 404
        return nil
      when 200
        collection = []
        JSON.parse(response.body)["_embedded"]["entries"].each { |entry| collection << Hashie::Mash.new(entry) }
        collection
      end
    end
  end
end