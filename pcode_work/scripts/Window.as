package
{
   import flash.display.Stage;
   
   public class Window
   {
      
      private static var _stage:Stage;
      
      public function Window()
      {
         super();
      }
      
      public static function getDev() : Number
      {
         if(getWidth() == 2208)
         {
            return 1;
         }
         if(getWidth() == 1334)
         {
            return 1;
         }
         if(getWidth() == 1136)
         {
            return 1;
         }
         if(getWidth() == 2048)
         {
            return 2;
         }
         if(getWidth() == 1024)
         {
            return 2;
         }
         return 1;
      }
      
      public static function getRes() : Number
      {
         if(getWidth() == 2208)
         {
            return 1.4;
         }
         if(getWidth() == 1334)
         {
            return 1.4;
         }
         if(getWidth() == 1136)
         {
            return 1.4;
         }
         if(getWidth() == 2048)
         {
            return 1;
         }
         if(getWidth() == 1024)
         {
            return 1;
         }
         return 1.4;
      }
      
      public static function getRes2() : Number
      {
         if(getWidth() == 2208)
         {
            return 1.2;
         }
         if(getWidth() == 1334)
         {
            return 1.2;
         }
         if(getWidth() == 1136)
         {
            return 1.2;
         }
         if(getWidth() == 2048)
         {
            return 1;
         }
         if(getWidth() == 1024)
         {
            return 1;
         }
         return 1.2;
      }
      
      public static function getWidth(_percent:Number = 100) : Number
      {
         return _stage.fullScreenWidth * _percent / 100;
      }
      
      public static function getHeight(_percent:Number = 100) : Number
      {
         return _stage.fullScreenHeight * _percent / 100;
      }
      
      public static function init(__stage:Stage) : void
      {
         _stage = __stage;
      }
      
      public static function report() : void
      {
         trace(getWidth(),getHeight());
      }
   }
}

