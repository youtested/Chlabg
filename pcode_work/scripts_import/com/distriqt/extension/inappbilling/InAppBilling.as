package com.distriqt.extension.inappbilling
{
   import com.distriqt.extension.inappbilling.events.InAppBillingEvent;
   import com.distriqt.extension.inappbilling.events.ProductViewEvent;
   import com.distriqt.extension.inappbilling.events.PurchaseEvent;
   import com.distriqt.extension.inappbilling.purchases.Downloads;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.StatusEvent;
   import flash.external.ExtensionContext;
   
   [Event(name="setup:success",type="com.distriqt.extension.inappbilling.events.InAppBillingEvent")]
   [Event(name="setup:failure",type="com.distriqt.extension.inappbilling.events.InAppBillingEvent")]
   [Event(name="products:loaded",type="com.distriqt.extension.inappbilling.events.InAppBillingEvent")]
   [Event(name="products:failed",type="com.distriqt.extension.inappbilling.events.InAppBillingEvent")]
   [Event(name="product:invalid",type="com.distriqt.extension.inappbilling.events.InAppBillingEvent")]
   [Event(name="restore:purchases:success",type="com.distriqt.extension.inappbilling.events.InAppBillingEvent")]
   [Event(name="restore:purchases:failed",type="com.distriqt.extension.inappbilling.events.InAppBillingEvent")]
   [Event(name="consume:success",type="com.distriqt.extension.inappbilling.events.InAppBillingEvent")]
   [Event(name="consume:failed",type="com.distriqt.extension.inappbilling.events.InAppBillingEvent")]
   [Event(name="purchase:success",type="com.distriqt.extension.inappbilling.events.PurchaseEvent")]
   [Event(name="purchase:cancelled",type="com.distriqt.extension.inappbilling.events.PurchaseEvent")]
   [Event(name="purchase:failed",type="com.distriqt.extension.inappbilling.events.PurchaseEvent")]
   [Event(name="purchase:removed",type="com.distriqt.extension.inappbilling.events.PurchaseEvent")]
   [Event(name="purchase:notallowed",type="com.distriqt.extension.inappbilling.events.PurchaseEvent")]
   [Event(name="purchase:deferred",type="com.distriqt.extension.inappbilling.events.PurchaseEvent")]
   [Event(name="purchase:purchasing",type="com.distriqt.extension.inappbilling.events.PurchaseEvent")]
   [Event(name="purchase:restored",type="com.distriqt.extension.inappbilling.events.PurchaseEvent")]
   [Event(name="productview:loaded",type="com.distriqt.extension.inappbilling.events.ProductViewEvent")]
   [Event(name="productview:failed",type="com.distriqt.extension.inappbilling.events.ProductViewEvent")]
   [Event(name="productview:displayed",type="com.distriqt.extension.inappbilling.events.ProductViewEvent")]
   [Event(name="productview:dismissed",type="com.distriqt.extension.inappbilling.events.ProductViewEvent")]
   public class InAppBilling extends EventDispatcher
   {
      
      private static const VERSION_BASE:String = "8";
      
      private static var _extContext:ExtensionContext = null;
      
      public static const EXT_CONTEXT_ID:String = "com.distriqt.InAppBilling";
      
      private static const EXT_ID_NUMBER:int = 15;
      
      public static const VERSION:String = "4.7.004";
      
      private static const VERSION_DEFAULT:String = "0";
      
      private static const IMPLEMENTATION_DEFAULT:String = "unknown";
      
      private static const ERROR_CREATION:String = "The native extension context could not be created";
      
      private static const ERROR_SINGLETON:String = "The singleton has already been created. Use InAppBilling.service to access the functionality";
      
      private static var _instance:InAppBilling;
      
      private static var _shouldCreateInstance:Boolean = false;
      
      private var _extensionId:String = "";
      
      private var _extensionIdNumber:int = -1;
      
      private var _registered:Boolean = false;
      
      private var _initialised:Boolean = false;
      
      private var _key:String = "";
      
      private var _serviceType:String = "apple_inapp_purchase";
      
      private var _serviceSetup:Boolean = false;
      
      private var _applicationReceipt:ApplicationReceipt;
      
      private var _pendingPurchases:Array;
      
      private var _downloads:Downloads;
      
      public function InAppBilling()
      {
         super();
         if(_shouldCreateInstance)
         {
            try
            {
               _extensionId = "com.distriqt.InAppBilling";
               _extensionIdNumber = 15;
               _extContext = ExtensionContext.createExtensionContext("com.distriqt.InAppBilling",null);
               _extContext.addEventListener("status",extension_statusHandler,false,0,true);
               _applicationReceipt = new ApplicationReceiptImpl(_extContext);
               _downloads = new DownloadsImpl(_extContext);
               _pendingPurchases = [];
            }
            catch(e:Error)
            {
               throw new Error("The native extension context could not be created");
            }
            return;
         }
         throw new Error("The singleton has already been created. Use InAppBilling.service to access the functionality");
      }
      
      public static function get service() : InAppBilling
      {
         createInstance();
         _instance.verify();
         return _instance;
      }
      
      private static function createInstance() : void
      {
         if(_instance == null)
         {
            _shouldCreateInstance = true;
            _instance = new InAppBilling();
            _shouldCreateInstance = false;
         }
      }
      
      public static function init(param1:String) : void
      {
         createInstance();
         _instance.key = param1;
         var _loc2_:String = "unknown";
         try
         {
            _loc2_ = _extContext.call("implementation") as String;
            switch(_loc2_.toLowerCase())
            {
               case "android":
                  _instance.setServiceType("google_play_inapp_billing");
                  break;
               case "ios":
                  _instance.setServiceType("apple_inapp_purchase");
                  break;
               default:
                  _instance.setServiceType("unimplemented");
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public static function get isSupported() : Boolean
      {
         createInstance();
         return _extContext.call("isSupported");
      }
      
      private function get key() : String
      {
         return _key;
      }
      
      private function set key(param1:String) : void
      {
         if(_initialised)
         {
            trace("You cannot change the key once initialised");
            return;
         }
         validateKey(param1,_extensionId,_extensionIdNumber);
      }
      
      override public function dispatchEvent(param1:Event) : Boolean
      {
         try
         {
            if(verify())
            {
               return super.dispatchEvent(param1);
            }
         }
         catch(e:Error)
         {
            return super.dispatchEvent(new ErrorEvent("error",param1.bubbles,param1.cancelable,e.message));
         }
         return false;
      }
      
      private function verify() : Boolean
      {
         if(_key == "" || !_initialised)
         {
            throw new Error("You must call the init() method of the " + _extensionId + " native extension class with your key");
         }
         if(!_registered)
         {
            throw new Error("Your key was not able to be verified for the " + _extensionId + " native extension");
         }
         return _registered;
      }
      
      private function validateKey(param1:String, param2:String, param3:int) : void
      {
         _key = param1;
         _initialised = true;
         _registered = false;
         try
         {
            _registered = _extContext.call("vV2",_key,param3);
         }
         catch(e:Error)
         {
         }
      }
      
      public function get version() : String
      {
         return "4.7.004";
      }
      
      public function get nativeVersion() : String
      {
         try
         {
            return _extContext.call("version") as String;
         }
         catch(e:Error)
         {
         }
         return "0";
      }
      
      public function get implementation() : String
      {
         try
         {
            return _extContext.call("implementation") as String;
         }
         catch(e:Error)
         {
         }
         return "unknown";
      }
      
      public function dispose() : void
      {
         cleanup();
         ApplicationReceiptImpl(_applicationReceipt).cleanup();
         _applicationReceipt = null;
         DownloadsImpl(_downloads).cleanup();
         _downloads = null;
         _extContext.removeEventListener("status",extension_statusHandler);
         _extContext.dispose();
         _extContext = null;
         _instance = null;
      }
      
      public function get canMakePayments() : Boolean
      {
         try
         {
            return _extContext.call("canMakePayments") as Boolean;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      public function setServiceType(param1:String) : String
      {
         if(!_serviceSetup)
         {
            switch(param1)
            {
               case "apple_inapp_purchase":
                  _serviceType = "apple_inapp_purchase";
                  break;
               case "google_play_inapp_billing":
                  _serviceType = "google_play_inapp_billing";
                  break;
               default:
                  _serviceType = "unimplemented";
            }
            return _serviceType;
         }
         throw new Error("Service already setup");
      }
      
      public function setup(param1:String = "") : Boolean
      {
         return _extContext.call("setup",param1) as Boolean;
      }
      
      public function cleanup() : void
      {
         _extContext.call("cleanup");
         _serviceSetup = false;
      }
      
      public function getProducts(param1:Array, param2:Boolean = false) : Boolean
      {
         if(_serviceSetup)
         {
            if(param1 == null || param1.length == 0)
            {
               return false;
            }
            return _extContext.call("getProducts",param1,param2) as Boolean;
         }
         return false;
      }
      
      public function get activeProducts() : Array
      {
         var _loc1_:String = null;
         if(_serviceSetup)
         {
            try
            {
               _loc1_ = _extContext.call("activeProducts") as String;
               return processProductsResponse(_loc1_);
            }
            catch(e:Error)
            {
            }
         }
         return [];
      }
      
      public function get activeProductIds() : Array
      {
         if(_serviceSetup)
         {
            try
            {
               return _extContext.call("activeProductIds") as Array;
            }
            catch(e:Error)
            {
            }
         }
         return [];
      }
      
      public function get isProductViewSupported() : Boolean
      {
         try
         {
            return _extContext.call("isProductViewSupported") as Boolean;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      public function showProductView(param1:String) : Boolean
      {
         try
         {
            if(isProductViewSupported)
            {
               return _extContext.call("showProductView",param1) as Boolean;
            }
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      public function get applicationReceipt() : ApplicationReceipt
      {
         return _applicationReceipt;
      }
      
      public function makePurchase(param1:PurchaseRequest) : Boolean
      {
         if(_serviceSetup)
         {
            if(!checkPurchaseRequestValid(param1))
            {
               return true;
            }
            return _extContext.call("makePurchase",param1) as Boolean;
         }
         return false;
      }
      
      public function finishPurchase(param1:Purchase) : Boolean
      {
         if(_serviceSetup)
         {
            return _extContext.call("finishPurchase",param1) as Boolean;
         }
         return false;
      }
      
      public function consumePurchase(param1:PurchaseRequest) : Boolean
      {
         if(_serviceSetup)
         {
            return _extContext.call("consumePurchase",param1) as Boolean;
         }
         return false;
      }
      
      public function restorePurchases(param1:String = "") : void
      {
         if(_serviceSetup)
         {
            _extContext.call("restorePurchases",param1);
         }
      }
      
      public function checkPurchaseRequestValid(param1:PurchaseRequest) : Boolean
      {
         var _loc2_:Array = getPendingPurchases();
         for each(var _loc3_ in _loc2_)
         {
            if(_loc3_.productId == param1.productId)
            {
               dispatchPurchaseEvents([_loc3_]);
               return false;
            }
         }
         return true;
      }
      
      public function getPendingPurchases() : Array
      {
         return _pendingPurchases;
      }
      
      public function get downloads() : Downloads
      {
         return _downloads;
      }
      
      private function processProductsResponse(param1:String) : Array
      {
         var _loc2_:Object = null;
         var _loc4_:Array = [];
         try
         {
            _loc2_ = JSON.parse(param1);
            for each(var _loc3_ in _loc2_.products)
            {
               _loc4_.push(Product.fromObject(_loc3_));
            }
         }
         catch(e:Error)
         {
            trace(e);
            trace(param1);
         }
         return _loc4_;
      }
      
      private function processPurchaseResponse(param1:String) : Array
      {
         var _loc2_:Object = null;
         var _loc3_:Array = [];
         try
         {
            _loc2_ = JSON.parse(param1);
            for each(var _loc4_ in _loc2_.purchases)
            {
               _loc3_.push(Purchase.fromObject(_loc4_));
            }
         }
         catch(e:Error)
         {
            trace(e);
            trace(param1);
         }
         return _loc3_;
      }
      
      private function removePurchasesFromPendingPurchases(param1:Array, param2:Array) : Array
      {
         var _loc5_:Boolean = false;
         var _loc4_:Array = [];
         for each(var _loc3_ in param2)
         {
            _loc5_ = false;
            for each(var _loc6_ in param1)
            {
               if(_loc3_.productId == _loc6_.productId)
               {
                  _loc5_ = true;
                  break;
               }
            }
            if(!_loc5_)
            {
               _loc4_.push(_loc3_);
            }
         }
         return _loc4_;
      }
      
      private function dispatchPurchaseEvents(param1:Array, param2:String = "") : void
      {
         for each(var _loc3_ in param1)
         {
            switch(_loc3_.transactionState)
            {
               case "transaction:purchased":
                  dispatchEvent(new PurchaseEvent("purchase:success",new <Purchase>[_loc3_]));
                  break;
               case "transaction:deferred":
                  dispatchEvent(new PurchaseEvent("purchase:deferred",new <Purchase>[_loc3_]));
                  break;
               case "transaction:notallowed":
                  dispatchEvent(new PurchaseEvent("purchase:notallowed",new <Purchase>[_loc3_]));
                  dispatchEvent(new PurchaseEvent("purchase:failed",new <Purchase>[_loc3_]));
                  break;
               case "transaction:failed":
                  dispatchEvent(new PurchaseEvent("purchase:failed",new <Purchase>[_loc3_]));
                  break;
               case "transaction:cancelled":
                  dispatchEvent(new PurchaseEvent("purchase:cancelled",new <Purchase>[_loc3_]));
                  break;
               case "transaction:purchasing":
                  dispatchEvent(new PurchaseEvent("purchase:purchasing",new <Purchase>[_loc3_]));
                  break;
               case "transaction:restored":
                  dispatchEvent(new PurchaseEvent("purchase:restored",new <Purchase>[_loc3_]));
                  break;
               case "transaction:refunded":
                  dispatchEvent(new PurchaseEvent("purchase:refunded",new <Purchase>[_loc3_]));
                  break;
               case "transaction:removed":
                  dispatchEvent(new PurchaseEvent("purchase:removed",new <Purchase>[_loc3_]));
            }
         }
         if(param2 != "")
         {
            dispatchEvent(new PurchaseEvent(param2,Vector.<Purchase>(param1)));
         }
      }
      
      private function extension_statusHandler(param1:StatusEvent) : void
      {
         var _loc3_:Object = null;
         var _loc7_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc2_:String = null;
         var _loc6_:String = null;
         switch(param1.code)
         {
            case "setup:success":
               _serviceSetup = true;
               dispatchEvent(new InAppBillingEvent("setup:success",null,"",param1.level));
               break;
            case "setup:failure":
               _serviceSetup = false;
               _loc3_ = JSON.parse(param1.level);
               dispatchEvent(new InAppBillingEvent("setup:failure",null,_loc3_.errorCode,_loc3_.error));
               break;
            case "products:loaded":
               _loc7_ = processProductsResponse(param1.level);
               dispatchEvent(new InAppBillingEvent("products:loaded",_loc7_));
               break;
            case "products:failed":
               _loc3_ = JSON.parse(param1.level);
               dispatchEvent(new InAppBillingEvent("products:failed",_loc3_.error,_loc3_.errorCode,_loc3_.error));
               break;
            case "product:invalid":
               dispatchEvent(new InAppBillingEvent("product:invalid",null,param1.level,"Invalid product identifier"));
               break;
            case "purchases:updated":
               _loc4_ = processPurchaseResponse(param1.level);
               dispatchPurchaseEvents(_loc4_,"purchases:updated");
               break;
            case "purchases:removed":
               break;
            case "purchases:queue:updated":
               _pendingPurchases = processPurchaseResponse(param1.level);
               dispatchPurchaseEvents(_pendingPurchases,"purchases:updated");
               break;
            case "purchases:queue:removed":
               _loc5_ = processPurchaseResponse(param1.level);
               _pendingPurchases = removePurchasesFromPendingPurchases(_loc5_,_pendingPurchases);
               break;
            case "purchase:success":
               _loc3_ = JSON.parse(param1.level);
               dispatchEvent(new PurchaseEvent("purchase:success",new <Purchase>[Purchase.fromObject(_loc3_)]));
               break;
            case "purchase:failed":
               _loc3_ = JSON.parse(param1.level);
               _loc2_ = _loc3_.hasOwnProperty("errorCode") ? _loc3_.errorCode : "";
               _loc6_ = _loc3_.hasOwnProperty("error") ? _loc3_.error : "";
               dispatchEvent(new PurchaseEvent("purchase:failed",null,_loc2_,_loc6_));
               break;
            case "purchase:cancelled":
               _loc3_ = JSON.parse(param1.level);
               dispatchEvent(new PurchaseEvent("purchase:cancelled",new <Purchase>[Purchase.fromObject(_loc3_)]));
               break;
            case "restore:purchases:complete":
               dispatchEvent(new InAppBillingEvent("restore:purchases:success"));
               break;
            case "restore:purchases:failed":
               _loc3_ = JSON.parse(param1.level);
               dispatchEvent(new InAppBillingEvent("restore:purchases:failed",null,_loc3_.error,_loc3_.errorCode));
               break;
            case "consume:success":
               _loc3_ = JSON.parse(param1.level);
               dispatchEvent(new InAppBillingEvent("consume:success",[Purchase.fromObject(_loc3_)]));
               break;
            case "consume:failed":
               _loc3_ = JSON.parse(param1.level);
               dispatchEvent(new InAppBillingEvent("consume:failed",null,_loc3_.errorCode,_loc3_.error));
               break;
            case "productview:dismissed":
            case "productview:displayed":
            case "productview:loaded":
               dispatchEvent(new ProductViewEvent(param1.code));
               break;
            case "productview:failed":
               _loc3_ = JSON.parse(param1.level);
               dispatchEvent(new ProductViewEvent(param1.code,_loc3_.error,_loc3_.errorCode));
         }
      }
   }
}

