package com.distriqt.extension.inappbilling
{
   public class ApplicationReceiptEvent
   {
      public static const REFRESH_SUCCESS:String = "refresh_success";
      public static const REFRESH_FAILED:String = "refresh_failed";
      
      public var type:String = "";
      
      public function ApplicationReceiptEvent(type:String = "") 
      {
         this.type = type;
      }
   }
}
