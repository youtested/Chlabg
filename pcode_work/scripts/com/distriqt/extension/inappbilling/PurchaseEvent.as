package com.distriqt.extension.inappbilling
{
   public class PurchaseEvent
   {
      public static const PURCHASE_SUCCESS:String = "purchase_success";
      public static const PURCHASE_PURCHASING:String = "purchase_purchasing";
      public static const PURCHASE_RESTORED:String = "purchase_restored";
      public static const PURCHASE_REFUNDED:String = "purchase_refunded";
      public static const PURCHASE_CANCELLED:String = "purchase_cancelled";
      public static const PURCHASE_FAILED:String = "purchase_failed";
      
      public var type:String = "";
      public var data:Object;
      public var errorCode:int = 0;
      public var message:String = "";
      
      public function PurchaseEvent(type:String = "", bubbles:Boolean = false, cancelable:Boolean = false) 
      {
         this.type = type;
      }
   }
}
