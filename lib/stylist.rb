class Stylist
  attr_reader(:stylist_name, :id)

  define_method(:initialize) do |attributes|
    @stylist_name = attributes.fetch(:stylist_name)
    @id = attributes.fetch(:id, nil)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      stylist_name = stylist.fetch("stylist_name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:stylist_name => stylist_name, :id => id}))
    end
    stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (stylist_name) VALUES ('#{@stylist_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_stylist|
    self.stylist_name().==(another_stylist.stylist_name()).&(self.id().==(another_stylist.id()))
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:update) do |attributes|
    @stylist_name = attributes.fetch(:stylist_name, @stylist_name)
    @id = self.id()
    DB.exec("UPDATE stylists SET stylist_name = '#{@stylist_name}', WHERE id = #{@id};")
  end

  define_method(:delete) do
    @id = self.id()
    DB.exec("DELETE FROM stylists WHERE id = #{@id};")
  end

  define_method(:clients) do
      returned_clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
      clients = []
      returned_clients.each() do |client|
        client_name = client.fetch("client_name")
        id = client.fetch("id").to_i()
        stylist_id = client.fetch("stylist_id").to_i()
        clients.push(Client.new({:client_name => client_name, :id => id, :stylist_id => stylist_id}))
      end
    clients
  end
end
