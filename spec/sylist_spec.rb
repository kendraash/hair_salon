require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all()).to(eq([]))
    end
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
