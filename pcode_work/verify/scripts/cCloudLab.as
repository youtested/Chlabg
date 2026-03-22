package
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class cCloudLab
   {
      
      private const URL:String = "cloudLabDb.txt";
      
      private var cDbLoader:URLLoader;
      
      private var cDbReq:URLRequest;
      
      private var Version:String = "120";
      
      private var myPan:iPan;
      
      private var myDb:cDb;
      
      public function cCloudLab()
      {
         super();
      }
      
      private static function httpStatusHandler(e:HTTPStatusEvent) : void
      {
         trace("httpStatusHandler:" + e);
      }
      
      private static function securityErrorHandler(e:SecurityErrorEvent) : void
      {
         trace("securityErrorHandler:" + e);
      }
      
      public function iSetPan(p:iPan, d:cDb) : void
      {
         this.myPan = p;
         this.myDb = d;
         this.Version = d.cCloudVersion ? d.cCloudVersion : "120";
      }
      
      public function cLoad() : void
      {
      }
      
      private function cDbError(e:IOErrorEvent) : void
      {
         trace(e.text);
      }
      
      private function cDbLoaded(e:Event) : *
      {
         var version:String = null;
         var gross:uint = 0;
         var i:* = undefined;
         var j:* = undefined;
         var submain:Array = null;
         var submainr:Array = null;
         var Input:Array = new Array();
         var statues:String = "N";
         var main:Array = new Array();
         var mainr:Array = new Array();
         if(this.cDbLoader.data != null)
         {
            Input = String(this.cDbLoader.data).split("|");
            statues = Input[0];
         }
         if(statues == "A")
         {
            version = Input[1];
            this.myDb.cSaveVersion(version);
            gross = Number(Input[2]);
            main = Input[3].split("*");
            for(i in main)
            {
               submain = main[i].split("~");
               this.myDb.cAddReq(submain);
            }
            mainr = Input[4].split("*");
            for(j in mainr)
            {
               submainr = mainr[j].split("~");
               this.myDb.cAddReqR(submainr);
            }
         }
      }
   }
}

