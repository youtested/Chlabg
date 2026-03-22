package
{
   public class ChemStore
   {
      
      private static var MainIAP:IAP;
      
      public function ChemStore()
      {
         super();
      }
      
      public static function getPrice(_id:*) : String
      {
         return MainIAP.getProductPrice(_id);
      }
      
      public static function Setup() : void
      {
         MainIAP = new IAP();
      }
      
      public static function restorePurchase() : void
      {
         MainIAP.restorePurchses();
      }
      
      public static function Buy(_id:*) : void
      {
         MainIAP.makePurchase(_id);
      }
   }
}

