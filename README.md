### Tophatter Merchant API
Full documentation is available [here](https://tophatter.readme.io/v1/docs).

#### Sample Usage - Authentication
```
TophatterMerchant.access_token = <YOUR ACCESS TOKEN>
```

#### Sample Usage - Metadata
```
TophatterMerchant::Metadata.conditions
TophatterMerchant::Metadata.categories
TophatterMerchant::Metadata.sizes
TophatterMerchant::Metadata.countries
```

#### Sample Usage - Products
```
TophatterMerchant::Product.schema
TophatterMerchant::Product.all(page: 1, per_page: 100)
TophatterMerchant::Product.retrieve(<PRODUCT ID>)
TophatterMerchant::Product.create(
  title: 'Apple iPhone 6S',
  description: 'This is the description.',
  sku: '6631A',
  quantity: 2,
  minimum_bid_amount: 50,
  buy_now_price: 150,
  cost_basis: 75,
  shipping_price: 5.0,
  product_condition: 'Refurbished - Manufacturer',
  product_category: 'Electronics|Hardware (Computers/Tablets/Phones)|Mobile',
  ships_from: 'United States',
  estimated_days_to_ship: 3,
  estimated_days_to_deliver: 5,
  weight: 6,
  primary_image: 'https://d38eepresuu519.cloudfront.net/b2aa7d2708324f756ffee551ba43a74f/original.jpg',
  extra_images: 'https://d38eepresuu519.cloudfront.net/7cd125f0fa42c965675eabaf3309aa6d/original.jpg'
)
TophatterMerchant::Product.update(<PRODUCT ID>, { buy_now_price: 100 })
```

#### Sample Usage - Orders (@TODO)
