package
{
   import flash.events.*;
   import flash.net.*;
   
   public class CSVLoader
   {
      
      private static var csv:CSV = new CSV();
      
      private static var csvr:CSV = new CSV();
      
      private static var csvo:CSV = new CSV();
      
      private static var csvor:CSV = new CSV();
      
      public function CSVLoader()
      {
         super();
      }
      
      public static function Load() : void
      {
         csv.addEventListener(Event.COMPLETE,loaded);
         csv.load(new URLRequest("/CSV/cdb.csv"));
      }
      
      private static function loaded(e:*) : void
      {
         Database.Install(csv.data);
         csvo.addEventListener(Event.COMPLETE,loadedo);
         csvo.load(new URLRequest("/CSV/odb.csv"));
      }
      
      private static function loadedo(e:*) : void
      {
         Database.Install(csvo.data);
         csvr.addEventListener(Event.COMPLETE,loadedr);
         csvr.load(new URLRequest("/CSV/rdb.csv"));
         Database.finishUp();
      }
      
      private static function loadedr(e:*) : void
      {
         Database.InstallReaction(csvr.data);
         csvor.addEventListener(Event.COMPLETE,loadedor);
         csvor.load(new URLRequest("/CSV/ordb.csv"));
      }
      
      private static function loadedor(e:*) : void
      {
         Database.InstallReaction(csvor.data);
         Database.iLoad();
      }
   }
}

