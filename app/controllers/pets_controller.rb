class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end
  
    
 
  
  post '/pets' do 
  
    #if !params[:pet].keys.include?("owner_id")
     # params[:pet][:owner_id] =[]
    #end
    @pet = Pet.create(params[:pet])
    if !params[:owner][:name].empty?
      @pet.owner = Owner.create(name: params[:owner][:name])
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    #binding.pry
    erb :'/pets/show'
  end

  patch '/pets/:id' do 
   
    @pet = Pet.find(params[:id])
    @pet.update(params[:pet])
    if !params[:owner][:name].empty?
      @pet.owner = Owner.create(name: params[:owner][:name])
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end
  get '/pets/:id/edit' do
   #binding.pry
    @Owners = Owner.all
    @pet = Pet.find(params[:id])
    
    erb :'/pets/edit'
  end
end