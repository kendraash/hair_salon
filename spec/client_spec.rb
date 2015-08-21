require('spec_helper')

describe(Client) do
    describe('#==') do
      it('is the same client if it has the same ID and name') do
        client1 = Client.new({:client_name => "Molly", :id => 1 ,:stylist_id => 1})
        client2 = Client.new({:client_name => "Molly",:id => 1 ,:stylist_id => 1})
        expect(client1).to(eq(client2))
      end
    end


    describe('.all') do
      it('is empty at first') do
        expect(Client.all()).to(eq([]))
      end
    end

    describe("#save") do
    it("adds a client to the array of saved clients") do
      client = Client.new({:client_name => "Molly", :stylist_id => 1})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe("#client_name") do
    it("returns the client_name ") do
      client = Client.new({:client_name => "Eric", :stylist_id => 1})
      expect(client.client_name()).to(eq("Eric"))
    end
  end

  describe(".order_by") do
    it("sorts clients alphabetically") do
      client1 = Client.new({:client_name => "Kendra", :stylist_id => 1})
      client1.save()
      client2 = Client.new({:client_name => "Allen", :stylist_id => 1})
      client2.save()
      client3 =Client.new({:client_name => "Scott", :stylist_id => 2})
      client3.save()
      expect(Client.order_by()).to(eq([client2, client1, client3]))
    end
  end
  describe('#delete') do
    it('deletes a client from the database') do
      test_client = Client.new({:client_name => 'Erica', :stylist_id => 2})
      test_client.save()
      id = test_client.id()
      test_client.delete()
      expect(Client.find(id)).to(eq(nil))
    end
  end
end
