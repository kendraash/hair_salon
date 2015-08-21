class Stylist
  attr_reader(:stylist_name, :id)

  define_method(:initialize) do |attributes|
    @stylist_name = attributes.fetch(:stylist_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = list.fetch("stylist_name")
      id = list.fetch("id").to_i()
      stylists.push(List.new({:stylist_name => stylist_name, :id => id}))
    end
    stylists
  end
end
