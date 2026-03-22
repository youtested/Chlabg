package com.distriqt.extension.inappbilling.events
{
   public class InAppBillingEvent
   {
      public static const SETUP_SUCCESS:String = "setup_success";
      public static const SETUP_FAILURE:String = "setup_failure";
      public static const PRODUCTS_LOADED:String = "products_loaded";
      public static const PRODUCTS_FAILED:String = "products_failed";
      public static const INVALID_PRODUCT:String = "invalid_product";
      public static const RESTORE_PURCHASES_SUCCESS:String = "restore_success";
      public static const RESTORE_PURCHASES_FAILED:String = "restore_failed";
      
      public var type:String = "";
      public var data:Object;
      public var errorCode:int = 0;
      public var message:String = "";
      
      public function InAppBillingEvent(type:String = "") 
      {
         this.type = type;
      }
   }
}
