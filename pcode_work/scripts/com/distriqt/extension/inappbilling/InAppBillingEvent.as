package com.distriqt.extension.inappbilling
{
   public class InAppBillingEvent
   {
      public static const SETUP_SUCCESS:String = "setup_success";
      public static const SETUP_FAILURE:String = "setup_failure";
      public static const PRODUCTS_LOADED:String = "products_loaded";
      public static const PRODUCTS_FAILED:String = "products_failed";
      public static const INVALID_PRODUCT:String = "invalid_product";
      public static const PURCHASE_SUCCESS:String = "purchase_success";
      public static const PURCHASE_PURCHASING:String = "purchase_purchasing";
      public static const PURCHASE_RESTORED:String = "purchase_restored";
      public static const PURCHASE_REFUNDED:String = "purchase_refunded";
      public static const PURCHASE_CANCELLED:String = "purchase_cancelled";
      public static const PURCHASE_FAILED:String = "purchase_failed";
      public static const RESTORE_PURCHASES_SUCCESS:String = "restore_success";
      public static const RESTORE_PURCHASES_FAILED:String = "restore_failed";
      
      public var type:String = "";
      public var data:Object;
      public var errorCode:int = 0;
      public var message:String = "";
      
      public function InAppBillingEvent(type:String = "", bubbles:Boolean = false, cancelable:Boolean = false) 
      {
         this.type = type;
      }
   }
}
