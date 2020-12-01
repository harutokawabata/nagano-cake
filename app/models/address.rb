class Address < ApplicationRecord
  belongs_to :customer
    def personal_info
     self.postal_code + self.name + self.address
    # selfはここでいうとaddressになる（addressesのテーブルからもってくるから）
     #selfは簡単にいうとpersonal_infoの前についてくる物
    end
end
