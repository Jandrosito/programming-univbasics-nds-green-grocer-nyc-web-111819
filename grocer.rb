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
  new_cart = cart.uniq
  result = {}
  new_cart.collect do |item_hash|
    item_quan = cart.count(item_hash)
    item_hash.collect do |item, details|
    result[item] = details
    result[item][:count] = item_quan
    # binding.pry
    end
  end
  result
end

def apply_coupons(cart, coupons)
  result = cart
  coupons.each do |coupon|
    item_name = coupon[:item]   # "AVOCADO"
    if cart.keys.include?(item_name) && cart[item_name][:count] >= coupon[:num]
      if result[item_name+" W/COUPON"].nil?
        result[item_name+" W/COUPON"] = {
          :price => (coupon[:cost] / coupon[:num]),
          :clearance => cart[item_name][:clearance],
          :count => coupon[:num]
        }
        result[item_name][:count] -= coupon[:num]
      else
        result[item_name+" W/COUPON"][:count] += coupon[:num]
        result[item_name][:count] -= coupon[:num]
      end 
    end 
  end 
  result
end

def apply_clearance(cart)
  result = cart 
  cart.each do |item, details|
    if details[:clearance] == true
      result[item][:price] = (0.8 * result[item][:price]).round(2)
    end 
  end 
  result
end

def checkout(cart, coupons)
  
end
