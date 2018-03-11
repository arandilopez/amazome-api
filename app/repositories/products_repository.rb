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

  private

  def products_all_cache_key(params = {})
    limit = params[:limit]
    filter = params[:filter]
    "products_all_limit_#{limit}_filter_#{filter}"
  end

  def product_cache_key(id)
    "product_#{id}"
  end
end
