package
{
   import flash.events.IOErrorEvent;
   import flash.net.*;
   import flash.utils.*;
   
   public class Database
   {
      
      private static var myXML:XML;
      
      public static var Installed:Boolean = false;
      
      private static var ldr:URLLoader = new URLLoader();
      
      private static var Total:Number = 0;
      
      private static var ChemList:Array = new Array();
      
      private static var ChemPool:Dictionary = new Dictionary(false);
      
      private static var ReactionPool:Dictionary = new Dictionary(false);
      
      private var cdb:cDb;
      
      public function Database()
      {
         super();
      }
      
      public static function UnlockAll() : void
      {
         var i:* = undefined;
         for(i in ChemPool)
         {
            ChemPool[i].Avaliable = 2;
         }
         Unlocked = Total;
      }
      
      public static function iLoad() : void
      {
         cdb.iLoad();
      }
      
      public static function Print() : void
      {
         var i:* = undefined;
         for(i in ChemPool)
         {
         }
      }
      
      public static function TotalUnlocked() : Number
      {
         return Unlocked;
      }
      
      public static function TotalChemical() : Number
      {
         return Total;
      }
      
      public static function init(_cdb:cDb) : void
      {
         cdb = _cdb;
         LoadCSV();
      }
      
      public static function finishUp() : void
      {
         cdb.cLoadStar();
      }
      
      public static function Install(d:Array) : void
      {
         var i:* = undefined;
         for(var _loc5_ in d)
         {
            i = _loc5_;
            _loc5_;
            AddChem(d[i],i);
         }
         Installed = true;
      }
      
      public static function InstallReaction(d:Array) : void
      {
         var i:* = undefined;
         for(var _loc5_ in d)
         {
            i = _loc5_;
            _loc5_;
            AddReaction(d[i]);
         }
      }
      
      private static function AddChem(a:Array, rank:Number) : void
      {
         if(a[0] != null)
         {
            cdb.cAddChem(a,rank);
         }
      }
      
      private static function AddReaction(a:Array) : void
      {
         if(a[0] != null)
         {
            cdb.cAddReaction(a);
         }
      }
      
      private static function LoadCSV() : void
      {
         CSVLoader.Load();
      }
      
      private static function loadError(e:IOErrorEvent) : void
      {
         trace("Error reading the data file. The server may be busy. Try refreshing the page.");
      }
   }
}

