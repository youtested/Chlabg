package
{
   import com.distriqt.extension.inappbilling.*;
   import com.distriqt.extension.inappbilling.events.*;
   import flash.net.*;
   
   public class IAP
   {
      
      public static const TAG:String = "IABHelper";
      
      private var _isSetup:Boolean = false;
      
      private var _productIds:Array;
      
      private var _products:Array;
      
      private var _inventory:Array;
      
      private var _purchases:Array;
      
      private const GOOGLE_PLAY_INAPP_BILLING_KEY:String = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4Fq4tAQcCROBJs1vd+CZxDOvH1iu+i/+S98YI4qPUwuV8DNxbJIBK0+ul2T/uhtpkLircetxOktIDg9jELUZ1yyqlkoaBMGu/XBR8Xtc5TV64qDzht/79MFP81WFBa4Wo+C5v82osKcl0EyTyja8TjEyhxg18IMXSzKwVHz6J3O35rjuPnpZhwmtZUBgJlHVKzI05dKO/C5IzuAmYV/f+h3RAe/0kO+aS6IRf9Gwyo7N1SOKmzNsxMCiXStxZjhfOmJg+qnV+jJSvUyyhoUMZZhmGIrQgYLvT5iFOuBUuy4sD4HQZg7V6Ipclgq88z5rz5sAw68LryIAsJqgYi6lSwIDAQAB";
      
      private const APP_KEY:String = "a06904e8b051c5fbd33af91ec14b279a8cc6acb4ED3N1FoDYrh8GYyYrh1v1IG0WWu8kT59aLEtIBC4vtEeYLqxzVADOJmMIlRfFiRydWUP7Qca8zinoZrzKWqciH3yS6he4iZ//W6o+FSPZpZm5hwdneoyALz1oBNXf2SEVI1rEChC6z/k9DDWs5lTSYaWz9hxx4hjtxnmsgGGmKgSo762xBtHLfwM1gYYTOWID4ap3AONTIF7BoIICoH+l0X6swS65ofMN3JEg5ZEY9URaCfRosnvebIMyytGI2ew5flBy+lp1Aa7uANq31Q9HROv4q5Gx+HyG7ry74SHEox2LXrx7vWwD8U7hqHKe4yLhMOQ2aVpUHjqe75M/8aN2w==";
      
      public function IAP()
      {
         super();
         this._productIds = ["chemist.chemicals.organic"];
         this._products = [];
         this._inventory = [];
         this._purchases = [];
         this.loadInventory();
         this.setup();
      }
      
      public function get isSetup() : Boolean
      {
         return this._isSetup;
      }
      
      public function set isSetup(value:Boolean) : void
      {
         this._isSetup = value;
      }
      
      public function get productIds() : Array
      {
         return this._productIds;
      }
      
      public function set productIds(value:Array) : void
      {
         this._productIds = value;
      }
      
      public function get prodcucts() : Array
      {
         return this._products;
      }
      
      public function get inventory() : Array
      {
         return this._inventory;
      }
      
      public function set inventory(value:Array) : void
      {
         this._inventory = value;
      }
      
      public function get purchases() : Array
      {
         return this._purchases;
      }
      
      public function set purchases(value:Array) : void
      {
         this._purchases = value;
      }
      
      public function setup() : void
      {
         if(!this.isSetup)
         {
            try
            {
               InAppBilling.init(this.APP_KEY);
               if(InAppBilling.isSupported)
               {
                  InAppBilling.service.addEventListener(InAppBillingEvent.SETUP_SUCCESS,this.setup_successHandler);
                  InAppBilling.service.addEventListener(InAppBillingEvent.SETUP_FAILURE,this.setup_failureHandler);
                  InAppBilling.service.addEventListener(InAppBillingEvent.PRODUCTS_LOADED,this.products_loadedHandler);
                  InAppBilling.service.addEventListener(InAppBillingEvent.PRODUCTS_FAILED,this.products_failedHandler);
                  InAppBilling.service.addEventListener(InAppBillingEvent.INVALID_PRODUCT,this.product_invalidHandler);
                  InAppBilling.service.addEventListener(PurchaseEvent.PURCHASE_SUCCESS,this.purchase_successHandler);
                  InAppBilling.service.addEventListener(PurchaseEvent.PURCHASE_PURCHASING,this.purchase_purchasingHandler);
                  InAppBilling.service.addEventListener(PurchaseEvent.PURCHASE_RESTORED,this.purchase_restoredHandler);
                  InAppBilling.service.addEventListener(PurchaseEvent.PURCHASE_REFUNDED,this.purchase_refundedHandler);
                  InAppBilling.service.addEventListener(PurchaseEvent.PURCHASE_CANCELLED,this.purchase_cancelledHandler);
                  InAppBilling.service.addEventListener(PurchaseEvent.PURCHASE_FAILED,this.purchase_failedHandler);
                  InAppBilling.service.addEventListener(InAppBillingEvent.RESTORE_PURCHASES_SUCCESS,this.restorePurchases_successHandler);
                  InAppBilling.service.addEventListener(InAppBillingEvent.RESTORE_PURCHASES_FAILED,this.restorePurchases_failedHandler);
                  InAppBilling.service.applicationReceipt.addEventListener(ApplicationReceiptEvent.REFRESH_FAILED,this.applicationReceipt_refreshFailedHandler);
                  InAppBilling.service.applicationReceipt.addEventListener(ApplicationReceiptEvent.REFRESH_SUCCESS,this.applicationReceipt_refreshSuccessHandler);
                  InAppBilling.service.setServiceType(InAppBillingServiceTypes.GOOGLE_PLAY_INAPP_BILLING);
                  InAppBilling.service.setup(this.GOOGLE_PLAY_INAPP_BILLING_KEY);
               }
            }
            catch(e:Error)
            {
            }
         }
      }
      
      public function restorePurchses() : void
      {
         if(this.isSetup)
         {
            trace(TAG,"restorePurchases");
            InAppBilling.service.restorePurchases();
         }
      }
      
      public function getProductPrice(_id:String = "") : String
      {
         var product:Product = null;
         var _state:String = null;
         if(this.isSetup)
         {
            trace(this._products);
            for each(product in this._products)
            {
               trace(product.toString());
               if(product.id == _id)
               {
                  _state = this.getPurchase(_id);
                  if(_state == "")
                  {
                     return product.priceString;
                  }
                  return _state;
               }
            }
         }
         return "";
      }
      
      public function getPurchase(_id:String = "") : String
      {
         var purchase:Purchase = null;
         if(this.isSetup)
         {
            for each(purchase in this._purchases)
            {
               if(purchase.productId == _id)
               {
                  return purchase;
               }
            }
         }
         return "";
      }
      
      public function getProducts(id:String = "") : void
      {
         if(this.isSetup)
         {
            if(id != "")
            {
               InAppBilling.service.getProducts([id]);
            }
            else
            {
               InAppBilling.service.getProducts(this._productIds);
            }
         }
      }
      
      public function makePurchase(productId:String) : void
      {
         var request:PurchaseRequest = null;
         var success:Boolean = false;
         if(this.isSetup)
         {
            request = new PurchaseRequest();
            request.productId = productId;
            request.quantity = 1;
            success = Boolean(InAppBilling.service.makePurchase(request));
            trace(TAG,"makePurchase( " + productId + " ) = " + success);
         }
      }
      
      public function deliverPurchase() : void
      {
         if(this._purchases.length > 0)
         {
            this.addPurchaseToInventory(this._purchases[0]);
         }
      }
      
      public function finishPurchase() : void
      {
         var purchase:Purchase = null;
         var success:Boolean = false;
         if(this.isSetup && this._purchases.length > 0)
         {
            purchase = this._purchases.shift();
            success = Boolean(InAppBilling.service.finishPurchase(purchase));
            trace(TAG,"finishPurchase() = " + success);
         }
      }
      
      public function getAppReceipt() : void
      {
         if(this.isSetup)
         {
            InAppBilling.service.applicationReceipt.refresh();
         }
      }
      
      private function addPurchaseToInventory(purchase:Purchase) : void
      {
         var item:Object = null;
         trace(TAG,"addPurchaseToInventory(" + purchase.productId + ")");
         var saveDataObject:SharedObject = SharedObject.getLocal("iab_inventory3");
         if(!saveDataObject.data.hasOwnProperty("inventory"))
         {
            saveDataObject.data.inventory = [];
         }
         var alreadyAdded:Boolean = false;
         for each(item in saveDataObject.data.inventory)
         {
            if(item.productId == purchase.productId && item.transactionId == purchase.transactionId)
            {
               alreadyAdded = true;
            }
         }
         if(!alreadyAdded)
         {
            saveDataObject.data.inventory.push({
               "productId":purchase.productId,
               "transactionId":purchase.transactionId
            });
         }
         saveDataObject.flush();
         this.loadInventory();
      }
      
      private function loadInventory() : void
      {
         var obj:Object = null;
         var saveDataObject:SharedObject = SharedObject.getLocal("iab_inventory3");
         if(!saveDataObject.data.hasOwnProperty("inventory"))
         {
            saveDataObject.data.inventory = [];
         }
         for each(obj in saveDataObject.data.inventory)
         {
            this._inventory.push(obj);
         }
      }
      
      private function setup_successHandler(event:InAppBillingEvent) : void
      {
         trace(TAG,"setup success");
         this.isSetup = true;
         this.getProducts("");
      }
      
      private function setup_failureHandler(event:InAppBillingEvent) : void
      {
         trace(TAG,"setup FAILURE!");
      }
      
      private function products_loadedHandler(event:InAppBillingEvent) : void
      {
         var product:Product = null;
         trace(TAG,"products loaded");
         for each(product in event.data)
         {
            trace(TAG,product.toString());
         }
         this._products = event.data;
      }
      
      private function products_failedHandler(event:InAppBillingEvent) : void
      {
         trace(TAG,"products FAILED:: " + event.data);
      }
      
      private function product_invalidHandler(event:InAppBillingEvent) : void
      {
         trace(TAG,"invalid product:" + event.errorCode + ":" + event.message);
      }
      
      private function restorePurchases_successHandler(event:InAppBillingEvent) : void
      {
         trace(TAG,"restore success");
      }
      
      private function restorePurchases_failedHandler(event:InAppBillingEvent) : void
      {
         trace(TAG,"restore failed");
      }
      
      private function purchase_cancelledHandler(event:PurchaseEvent) : void
      {
         trace(TAG,"purchase cancelled" + event.errorCode);
         if(Boolean(event.data) && event.data.length > 0)
         {
            InAppBilling.service.finishPurchase(event.data[0]);
         }
      }
      
      private function purchase_failedHandler(event:PurchaseEvent) : void
      {
         trace(TAG,"purchase failed [" + event.errorCode + "] :: " + event.message);
         if(Boolean(event.data) && event.data.length > 0)
         {
            InAppBilling.service.finishPurchase(event.data[0]);
         }
      }
      
      private function purchase_successHandler(event:PurchaseEvent) : void
      {
         var purchase:Purchase = Purchase(event.data[0]);
         trace(TAG,"purchase success");
         trace(TAG,purchase.productId);
         trace(TAG,purchase.originalMessage);
         Credit.addChem(purchase.productId);
         this.addPurchaseToInventory(purchase);
         InAppBilling.service.finishPurchase(purchase);
         this._purchases.push(purchase);
      }
      
      private function purchase_purchasingHandler(event:PurchaseEvent) : void
      {
      }
      
      private function purchase_restoredHandler(event:PurchaseEvent) : void
      {
         var purchase:Purchase = Purchase(event.data[0]);
         trace(TAG,"purchase restored");
         trace(TAG,purchase.toString());
         this._purchases.push(event.data[0]);
         Credit.addChem(purchase.productId);
         this.addPurchaseToInventory(purchase);
      }
      
      private function purchase_refundedHandler(event:PurchaseEvent) : void
      {
      }
      
      private function applicationReceipt_refreshSuccessHandler(event:ApplicationReceiptEvent) : void
      {
         var appReceipt:String = InAppBilling.service.applicationReceipt.getAppReceipt();
      }
      
      private function applicationReceipt_refreshFailedHandler(event:ApplicationReceiptEvent) : void
      {
      }
   }
}

