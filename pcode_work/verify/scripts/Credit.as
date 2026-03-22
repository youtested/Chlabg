package
{
   import flash.net.*;
   
   public class Credit
   {
      
      private static var myPan:iPan;
      
      private static var So:SharedObject = SharedObject.getLocal("chemist_store1");
      
      public static var organic:Number = 0;
      
      public function Credit()
      {
         super();
      }
      
      public static function Setup(pan:iPan) : void
      {
         myPan = pan;
         if(So.data.organic == 1)
         {
            organic = 1;
         }
      }
      
      public static function getPrice(id:String) : String
      {
         return ChemStore.getPrice(id);
      }
      
      public static function buyOrganic() : void
      {
         ChemStore.Buy("chemist.chemicals.organic");
      }
      
      public static function restoreChem() : void
      {
         ChemStore.restorePurchase();
      }
      
      public static function addChem(creditId:String) : void
      {
         if(creditId == "chemist.chemicals.organic")
         {
            organic = 1;
            myPan.rank1(0);
            new Au_Bought().play();
         }
         So.data.organic = 1;
         So.flush();
      }
   }
}

