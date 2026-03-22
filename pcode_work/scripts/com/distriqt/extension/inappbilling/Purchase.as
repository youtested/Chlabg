package com.distriqt.extension.inappbilling
{
   public class Purchase
   {
      public var productId:String = "";
      public var transactionId:String = "";
      public var originalMessage:String = "";
      public var purchaseToken:String = "";
      public var purchaseState:int = 0;
      public var purchaseDate:Number = 0;
      
      public function Purchase() {}
      
      public function toString():String { return productId; }
   }
}
