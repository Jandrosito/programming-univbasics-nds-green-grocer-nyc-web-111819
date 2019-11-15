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
  oupon_count = 0
  pre_coupon = ""
  coupons.each do |c|
    if pre_coupon == "" || c[:item] != pre_coupon
      coupon_count = 0
    end

    if cart.key?(c[:item])
      coupon_count += c[:num]
      if cart[c[:item]][:count] >= c[:num]
        hash = {}
        hash[:price] = c[:cost] / c[:num]
        hash[:clearance] = cart[c[:item]][:clearance]
        hash[:count] = coupon_count
        cart["#{c[:item]} W/COUPON"] = hash
        cart[c[:item]][:count] -= c[:num]
      else
        cart[c[:item]][:count] = cart[c[:item]][:count]
      end

    end
    pre_coupon = c[:item]
  end
  cart
end

def apply_clearance(cart)
  # REMEMBER: This method **should** update cart
  cart.each do |key, value|
    if cart[key][:clearance]
      cart[key][:price] = cart[key][:price] - ((cart[key][:price] * 20) / 100)
    end
  end
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
