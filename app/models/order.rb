class Order < ApplicationRecord
  monetize :amount_pennies
end
