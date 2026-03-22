package com.distriqt.extension.inappbilling
{
   import com.distriqt.extension.inappbilling.events.ApplicationReceiptEvent;
   import flash.events.EventDispatcher;
   import flash.events.StatusEvent;
   import flash.external.ExtensionContext;
   
   internal class ApplicationReceiptImpl extends EventDispatcher implements ApplicationReceipt
   {
      
      private var _extContext:ExtensionContext;
      
      public function ApplicationReceiptImpl(param1:ExtensionContext)
      {
         super();
         _extContext = param1;
         _extContext.addEventListener("status",extContext_statusHandler);
      }
      
      public function get isSupported() : Boolean
      {
         try
         {
            return _extContext.call("applicationReceipt_isSupported") as Boolean;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      public function getAppReceipt() : String
      {
         try
         {
            return _extContext.call("applicationReceipt_getAppReceipt") as String;
         }
         catch(e:Error)
         {
         }
         return "";
      }
      
      public function refresh(param1:ApplicationReceiptProperties = null) : Boolean
      {
         try
         {
            if(param1 == null)
            {
               param1 = new ApplicationReceiptProperties();
            }
            return _extContext.call("applicationReceipt_refresh",param1) as Boolean;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      public function cleanup() : void
      {
         _extContext.removeEventListener("status",extContext_statusHandler);
         _extContext = null;
      }
      
      private function extContext_statusHandler(param1:StatusEvent) : void
      {
         var _loc2_:Object = null;
         switch(param1.code)
         {
            case "applicationreceipt:refresh:success":
               dispatchEvent(new ApplicationReceiptEvent("applicationreceipt:refresh:success"));
               break;
            case "applicationreceipt:refresh:failed":
               _loc2_ = JSON.parse(param1.level);
               dispatchEvent(new ApplicationReceiptEvent("applicationreceipt:refresh:failed",_loc2_.error,_loc2_.errorCode));
         }
      }
   }
}

