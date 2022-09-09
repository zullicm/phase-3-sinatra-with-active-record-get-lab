class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :DESC)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all.order(price: :DESC).first
    baked_goods.to_json(only: [:name, :price])
  end

end
