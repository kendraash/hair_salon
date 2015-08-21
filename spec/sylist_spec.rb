require('spec_helper')

describe(Stylist) do
    describe('.all') do
      it('starts off with no stylists') do
        expect(Stylist.all()).to(eq([]))
      end
    end

  describe("#stylist_name") do
    it("tells you the stylist_name") do
      stylist = Stylist.new({:stylist_name => "Monica"})
      expect(stylist.stylist_name()).to(eq("Monica"))
    end
  end

  describe("#id") do
    it("sets the stylist ID when you save it") do
      stylist = Stylist.new({:stylist_name => "Kendra"})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end

  end

  describe("#save") do
    it("lets you save stylist to the database hair_salon") do
      stylist = Stylist.new({:stylist_name => "Kendra"})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe(".find") do
    it("lets you search all the stylist to find one by ID") do
      stylist1 = Stylist.new({:stylist_name => "Kendra"})
      stylist1.save()
      expect(Stylist.find((stylist1.id()))).to(eq(stylist1))

    end
  end
  describe('#delete') do
    it('deletes a stylist from the database') do
      test_stylist = Stylist.new({:stylist_name => 'Kendra'})
      test_stylist.save()
      id = test_stylist.id()
      test_stylist.delete()
      expect(Stylist.find(id)).to(eq(nil))
    end
  end
end
