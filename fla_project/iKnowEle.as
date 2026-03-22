package
{
   public class iKnowEle
   {
      
      private static var iKnow:Object = new Object();
      
      public function iKnowEle()
      {
         super();
      }
      
      public static function Set(e:String, n:Number, type:Number) : void
      {
         if(iKnow[e] == null)
         {
            iKnow[e] = new Array();
         }
         iKnow[e][type] = n;
      }
      
      public static function Get(e:String, type:Number) : Number
      {
         if(iKnow[e] != null)
         {
            if(iKnow[e][type] != null)
            {
               return iKnow[e][type];
            }
            if(type == 1)
            {
               return 19;
            }
            return 1;
         }
         if(type == 1)
         {
            return 19;
         }
         return 1;
      }
   }
}

