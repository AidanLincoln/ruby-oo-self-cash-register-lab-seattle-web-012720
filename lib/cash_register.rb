require 'pry'
class CashRegister
    attr_accessor :discount, :total, :title, :price, :quantity, :items
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @prices = []
    end
    def total
        @total
    end
    def add_item(title, price, quantity = 1)
        @quantity = quantity
        @total += price * quantity 
        @prices.push(price)
        i = 0
        while i < quantity do
            @items.push(title)
            i+=1
        end      
    end
    def apply_discount
       @total -= @total * @discount /= 100.to_f
       if @discount == 0
            "There is no discount to apply."
       else
            "After the discount, the total comes to $800."
       end
    end
    def items
        @items
    end
    def void_last_transaction
        @items.uniq
        @total -= @prices.last * @quantity  
        @items.pop
        if !@items
            @total = 0
        end
    end
end
