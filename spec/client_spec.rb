require('spec_helper')

describe(Client) do
  describe('#==') do
    it('is the same client if it has the same ID and name') do
      client1 = Client.new({:client_name => "Molly", :id => 1, :stylist_id => 1})
      client2 = Client.new({:client_name => "Molly", :id => 1,:stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end
end

  describe('.all') do
    it('is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
  it("adds a client to the array of saved clients") do
    client = Client.new({:client_name => "Molly", :id => 1, :stylist_id => 1})
    client.save()
    expect(Client.all()).to(eq([client]))
  end
end
