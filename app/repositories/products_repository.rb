module ProductsRepository
  extend self
  def all(params = {})
    Rails.cache.fetch(products_all_cache_key(params), expires_in: 10.minutes) do
      products = Product.all
      products = products.limit(params[:limit]) if params[:limit].present?
      products = products.search(params[:filter]) if params[:filter].present?
      products.to_a
    end
  end

  def find(id)
    Rails.cache.fetch(product_cache_key(id), expires_in: 1.day) do
      Product.find(id)
    end
  end

  def clear_cache(id = nil)
    Rails.cache.clear(product_cache_key(id)) if id.present?
    products_cache_keys.each do |key|
      Rails.cache.clear(key)
    end
    Rails.cache.clear("products_cache_keys")
  end

  private

  def products_all_cache_key(params = {})
    limit = params[:limit]
    filter = params[:filter]
    key = "products_all_limit_#{limit}_filter_#{filter}"
    keys = products_cache_keys
    keys.push(key)
    Rails.cache.write("products_cache_keys", keys.uniq, expires_in: 10.minutes)
    return key
  end

  def products_cache_keys
    Rails.cache.fetch("products_cache_keys", expires_in: 10.minutes) do
      []
    end
  end

  def product_cache_key(id)
    "product_#{id}"
  end
end
