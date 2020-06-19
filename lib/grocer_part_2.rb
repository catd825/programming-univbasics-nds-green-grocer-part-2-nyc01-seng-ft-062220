require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  coupons.each_with_index do |hash, index| #iterate over coupon hash and identify its index in array of hashes
  
  cart_item = find_item_by_name_in_collection(coupons[index][:item],cart)
  #create variable that passes through the item and the cart to return the hash of the item passed through
  
  couponed_item_by_name = "#{coupons[index][:item]} W/COUPON" #create variable to interpolate current item in interation and 'w/coupon'
  
  cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_by_name,cart) #create variable that takes in the couponed item 'w/coupon' (and returns the hash it exists within )
  
    if cart_item && cart_item[:count] >= coupons[index][:num] #if the returned cart_item hash's count is greater than the number required to qualify for coupon
    
      if cart_item_with_coupon #if the couponed item exists/qualifies for coupon 
        cart_item_with_coupon[:count] += coupons[index][:num] #return the count of the item that qualifies for coupon and 
        cart_item[:count] -= coupons[index][:num]
      else
        cart_item_with_coupon ={
          :item =>couponed_item_by_name,
          :price => coupons[index][:cost]/coupons[index][:num],
          :clearance => cart_item[:clearance],
          :count => coupons[index][:num]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[index][:num]
      end
    end
   index += 1
  end
   cart 
  end
  


  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart



def apply_clearance(cart)
  cart.each_with_index do |item, index|
    if cart[index][:clearance] #if clearance at the current iteration exists
      cart[index][:price] = (cart[index][:price] - (cart[index][:price] * 0.20)).round(2) #modify the price key to be discounted at a rounded value
    end
    index += 1
  end
  cart
end

# Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart


def checkout(cart, coupons)

consolidated_cart = consolidate_cart(cart)
couponed_cart = apply_coupons(consolidated_cart,coupons)
final_cart = apply_clearance(couponed_cart)
total = 0

  if each_with_index do |item, index|
    
  end

end
