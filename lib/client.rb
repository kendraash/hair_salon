class Client

  attr_reader(:client_name, :id, :stylist_id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @id = attributes.fetch(:id, nil)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_method(:==) do |another_client|
    self.client_name().==(another_client.client_name()).&(self.id().==(another_client.id()))
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      client_name = client.fetch("client_name")
      id = client.fetch("id").to_i()
      stylist_id = client.fetch("stylist_id")
      clients.push(Client.new({:client_name => client_name, :id => id, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
  DB.exec("INSERT INTO clients (client_name, id, stylist_id) VALUES ('#{@client_name}', #{@id}, #{stylist_id});")
end
end
