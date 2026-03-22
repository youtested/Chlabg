package com.distriqt.extension.inappbilling
{
   public class PurchaseRequest
   {
      
      public var productId:String = "";
      
      public var quantity:int = 1;
      
      public var developerPayload:String = "";
      
      public var applicationUsername:String = "";
      
      public function PurchaseRequest(param1:String = "", param2:int = 1)
      {
         super();
         this.productId = param1;
         this.quantity = param2;
      }
   }
}

