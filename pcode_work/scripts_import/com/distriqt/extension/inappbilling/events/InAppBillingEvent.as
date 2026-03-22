package com.distriqt.extension.inappbilling.events
{
   import flash.events.Event;
   
   public class InAppBillingEvent extends Event
   {
      
      public static const SETUP_SUCCESS:String = "setup:success";
      
      public static const SETUP_FAILURE:String = "setup:failure";
      
      public static const PRODUCTS_LOADED:String = "products:loaded";
      
      public static const PRODUCTS_FAILED:String = "products:failed";
      
      public static const INVALID_PRODUCT:String = "product:invalid";
      
      public static const RESTORE_PURCHASES_SUCCESS:String = "restore:purchases:success";
      
      public static const RESTORE_PURCHASES_FAILED:String = "restore:purchases:failed";
      
      public static const CONSUME_SUCCESS:String = "consume:success";
      
      public static const CONSUME_FAILED:String = "consume:failed";
      
      public var errorCode:String = "";
      
      public var message:String = "";
      
      public var data:*;
      
      public function InAppBillingEvent(param1:String, param2:* = null, param3:String = "", param4:String = "", param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         this.errorCode = param3;
         this.message = param4;
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new InAppBillingEvent(type,data,errorCode,message,bubbles,cancelable);
      }
   }
}

