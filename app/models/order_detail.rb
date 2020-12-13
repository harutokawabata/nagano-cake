class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

     enum making_status:{
    cannnot: 0, #制作不可
    waiting: 1, #制作待ち
    making: 2, #制作中
    finish: 3, #制作完了
   }

end
