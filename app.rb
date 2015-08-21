require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")
require('pry')

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/clients') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:clients)
end

post('/stylists/new') do
  stylist_name = params.fetch('stylist_name')
  @stylist = Stylist.new({:stylist_name => stylist_name})
  @stylist.save()
  redirect('/stylists')
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  erb(:stylist)
end

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist_edit)
end

patch('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.update({:stylist_name => params.fetch('stylist_name')})
  redirect('/stylists/' + @stylist.id().to_s())
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()
  redirect('/stylists')
end

post('/clients/new') do
  client_name = params.fetch('client_name')
  stylist_id = params.fetch('stylist_id')
  @client = Client.new({:client_name => client_name, :stylist_id => stylist_id})
  @client.save()
  redirect('/clients')
end

get('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  erb(:client)
end

patch('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @client.update({:client_name => params.fetch('client_name')})
  redirect('/clients/' + @client.id().to_s())
end

delete('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @client.delete()
  redirect('/clients')
end
