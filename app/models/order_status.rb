class OrderStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '出品中' },
    { id: 2, name: '交渉中' },
    { id: 3, name: '出品停止中' },
    { id: 4, name: '購入済み' },
    { id: 5, name: '売却済み' }
]
end
