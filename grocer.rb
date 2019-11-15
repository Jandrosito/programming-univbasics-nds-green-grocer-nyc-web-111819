def find_item_by_name_in_collection(name, collection)
  i = 0
  while i < collection.length do
  if collection[i][:item] == name
    return collection[i]
  end
  i += 1
end
nil
end

def consolidate_cart(cart)
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  groceries = {}

  cart.each do |grocery|
    grocery.each do |item, item_hash|
      groceries[item] ||= item_hash

      if groceries[item].key?(:count)
        groceries[item][:count] += 1
      else
        groceries[item][:count] = 1
      end
    end
  end
  groceries
end

def apply_coupons(cart, coupons)
  # REMEMBER: This method **should** update cart
  
end

def apply_clearance(cart)
  # REMEMBER: This method **should** update cart
  
end

def checkout(cart, coupons)
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
end
