class Client

  attr_reader(:client_name, :id, :stylist_id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @id = attributes.fetch(:id, nil)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_method(:==) do |another_client|
    self.id() == another_client.id()
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      client_name = client.fetch("client_name")
      id = client.fetch("id").to_i()
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:client_name => client_name, :id => id, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (client_name, stylist_id) VALUES ('#{@client_name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:order_by) do
    returned_clients = DB.exec("SELECT * FROM clients ORDER BY client_name;")
    ordered_clients = []
    returned_clients.each() do |client|
      client_name = client.fetch("client_name")
      id = client.fetch("id").to_i()
      stylist_id = client.fetch("stylist_id")
      ordered_clients.push(Client.new({:client_name => client_name, :id => id, :stylist_id => stylist_id}))
    end
    ordered_clients
  end
end
