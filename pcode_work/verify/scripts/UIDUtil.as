package
{
   public class UIDUtil
   {
      
      private static const ALPHA_CHAR_CODES:Array = [48,49,50,51,52,53,54,55,56,57,65,66,67,68,69,70];
      
      public function UIDUtil()
      {
         super();
      }
      
      public static function createUID() : String
      {
         var i:int = 0;
         var j:int = 0;
         var uid:Array = new Array(36);
         var index:* = 0;
         for(i = 0; i < 8; i++)
         {
            var _loc7_:Number;
            uid[_loc7_ = index++] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
         }
         for(i = 0; i < 3; i++)
         {
            uid[_loc7_ = index++] = 45;
            for(j = 0; j < 4; j++)
            {
               var _loc8_:Number;
               uid[_loc8_ = index++] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
            }
         }
         uid[_loc7_ = index++] = 45;
         var time:Number = new Date().getTime();
         var timeString:String = ("0000000" + time.toString(16).toUpperCase()).substr(-8);
         for(i = 0; i < 8; i++)
         {
            uid[_loc8_ = index++] = timeString.charCodeAt(i);
         }
         for(i = 0; i < 4; i++)
         {
            uid[_loc8_ = index++] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
         }
         return String.fromCharCode.apply(null,uid);
      }
   }
}

