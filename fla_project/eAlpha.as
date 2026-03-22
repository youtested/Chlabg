package
{
   import flash.events.*;
   
   public class eAlpha
   {
      
      private static var iAlphaObj:*;
      
      public function eAlpha()
      {
         super();
      }
      
      public static function iAlpha(o:*, dir:Number) : void
      {
         iAlphaObj = o;
         if(dir == 1)
         {
            o.addEventListener(Event.ENTER_FRAME,alphaTimer1);
            iAlphaObj.mouseEnabled = false;
         }
         else
         {
            o.addEventListener(Event.ENTER_FRAME,alphaTimer2);
         }
      }
      
      private static function alphaTimer1(e:*) : void
      {
         iAlphaObj.removeEventListener(Event.ENTER_FRAME,alphaTimer2);
         if(iAlphaObj.alpha > 0)
         {
            iAlphaObj.alpha -= 0.1;
         }
         else
         {
            iAlphaObj.alpha = 0;
            iAlphaObj.visible = false;
            StopAlpha();
         }
      }
      
      private static function alphaTimer2(e:*) : void
      {
         if(iAlphaObj)
         {
            if(iAlphaObj.alpha < 1)
            {
               iAlphaObj.visible = true;
               iAlphaObj.alpha += 0.1;
            }
            else
            {
               iAlphaObj.alpha = 1;
               iAlphaObj.mouseEnabled = true;
               StopAlpha();
            }
         }
      }
      
      private static function StopAlpha() : void
      {
         iAlphaObj.removeEventListener(Event.ENTER_FRAME,alphaTimer1);
         iAlphaObj.removeEventListener(Event.ENTER_FRAME,alphaTimer2);
         iAlphaObj = null;
      }
   }
}

