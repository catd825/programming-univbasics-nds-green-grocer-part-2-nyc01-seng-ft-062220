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
index = 0
  while index < cart.length
    if cart[index][:clearance] #== true
      cart[index][:clearance] = (cart[index][:price] = (cart[index][:price] * 0.20)).round(2)
    end
    index += 1
  end
  cart
end

# Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart


def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
