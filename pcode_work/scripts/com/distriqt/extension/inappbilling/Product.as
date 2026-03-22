package com.distriqt.extension.inappbilling
{
   public class Product
   {
      public var id:String = "";
      public var title:String = "";
      public var description:String = "";
      public var price:String = "";
      public var priceString:String = "";
      
      public function Product() {}
      
      public function toString():String { return id; }
   }
}
