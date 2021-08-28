# Jumia Ghana Api for flutter

## Description
This is a wrapper for [Jumia Ghana](https://www.jumia.com.gh)'s seller endpoints. Purely third party, it provides acces for flutter developers to leverage flutter and dart to build applications to support sellers on the Jumia platform.

## Getting Started
1. To use the endpoints, you will need a seller account with Jumia.
2. Navigate to integrations after logging in and copy your API key and ID (usually your email)
3. Add the package to your pubsec.yaml file in the project
4. Initialise an instance
```  Jumia api = Jumia(apikey, userId);```


## End Points  (15/57 implemented)
#### [x] -> implemented; 
#### [ ]-> Not yet implemented)

- [x] FeedList
- [x] GetBrands
- [x] GetCategoryTree
- [x] GetOrder
- [x] GetOrders
- [x] GetProducts
- [x] GetStatistics
- [x] GetShipmentProviders
- [x] GetMetrics
- [x] GetQcStatus
- [x] GetPayoutStatus
- [x] Image
- [x] ProductRemove
- [x] SellerUpdate
- [x] UserUpdate
- [x] UserCreate
- [ ] CreateForwardManifest
- [ ] CreatePickupRequest
- [ ] CreateWebhook
- [ ] DeleteWebhook
- [ ] FeedOffsetList
- [ ] FeedCancel
- [ ] FeedStatus
- [ ] GetCategoryAttributes
- [ ] GetCategoryByAttributeSet
- [ ] GetDocument
- [ ] GetFailureReasons
- [ ] GetFeedRawInput
- [ ] GetProductStocks
- [ ] GetManifestList
- [ ] GetMultipleOrderItems
- [ ] GetWebhooks
- [ ] GetWebhookEntries
- [ ] ProductCreate
- [ ] ProductStockUpdate
- [ ] ProductUpdate
- [ ] ProductWarehouseStockUpdate
- [ ] SetStatusToCancelled
- [ ] SetStatusToPackagedByMarketPlace
- [ ] SetStatusToReadyToShip
- [ ] SetStatusToShipped
- [ ] SetStatusToFailedDelivery
- [ ] SetStatusToDelivered
- [ ] SetInvoiceAccessKey
- [ ] SetInvoiceNumber
- [ ] SetStatusToReturn
- [ ] SetStatusToReturnReceived
- [ ] SetStatusToReturnApproved
- [ ] SetStatusToReturnRejected
- [ ] SetManifestStatusToShipped

