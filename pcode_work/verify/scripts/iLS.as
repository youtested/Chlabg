package
{
   import flash.display.MovieClip;
   
   public class iLS extends MovieClip
   {
      
      public var movBack:MovieClip;
      
      public function iLS()
      {
         super();
         stop();
         gotoAndStop(iLoc.LG);
      }
   }
}

