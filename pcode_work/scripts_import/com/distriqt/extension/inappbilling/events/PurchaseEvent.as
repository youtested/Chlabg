package com.distriqt.extension.inappbilling.events
{
   import com.distriqt.extension.inappbilling.Purchase;
   import flash.events.Event;
   
   public class PurchaseEvent extends Event
   {
      
      public static const PURCHASE_SUCCESS:String = "purchase:success";
      
      public static const PURCHASE_CANCELLED:String = "purchase:cancelled";
      
      public static const PURCHASE_FAILED:String = "purchase:failed";
      
      public static const PURCHASE_PURCHASING:String = "purchase:purchasing";
      
      public static const PURCHASE_RESTORED:String = "purchase:restored";
      
      public static const PURCHASE_REFUNDED:String = "purchase:refunded";
      
      public static const PURCHASES_UPDATED:String = "purchases:updated";
      
      public static const PURCHASE_REMOVED:String = "purchase:removed";
      
      public static const PURCHASE_NOTALLOWED:String = "purchase:notallowed";
      
      public static const PURCHASE_DEFERRED:String = "purchase:deferred";
      
      public var data:Vector.<Purchase>;
      
      public var message:String = "";
      
      public var errorCode:String = "";
      
      public function PurchaseEvent(param1:String, param2:Vector.<Purchase>, param3:String = "", param4:String = "", param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         this.data = param2;
         this.message = param4;
         this.errorCode = param3;
      }
   }
}

