package com.distriqt.extension.inappbilling
{
   import flash.events.EventDispatcher;
   
   public class InAppBillingService extends EventDispatcher
   {
      public var addEventListener:Function;
      public var removeEventListener:Function;
      public var setServiceType:Function;
      public var setup:Function;
      public var getProducts:Function;
      public var makePurchase:Function;
      public var finishPurchase:Function;
      public var restorePurchases:Function;
      public var applicationReceipt:ApplicationReceiptSupport;
      
      public function InAppBillingService() {}
   }
}
