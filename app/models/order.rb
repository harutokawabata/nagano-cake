class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  # enum payment_method: { card: 0, bank: 1}
  # enum payment_method: { 着手不可: 0, 入金待ち: 1, 入金確認:2, 発送準備中:3, 発送済み:4}
   enum status:{
    waiting:           0, #着手不可
    unstart:          1, #入金待ち
    confirm:   2, #入金確認
    perparation:     3, #発送準備中
    finish:     4, #発送済み
  }
   enum payment_method:{
    card: 0, #クレジットカード
    bank: 1, #銀行振り込み
   }

end
