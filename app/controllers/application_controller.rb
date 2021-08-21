class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'


  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods_by_price = BakedGood.all.order('price DESC')
    baked_goods_by_price.to_json
  end

  get '/baked_goods/most_expensive' do
    good = BakedGood.all.order('price DESC').limit(1)
    good.to_json(only: [:name, :price])
  end

end
