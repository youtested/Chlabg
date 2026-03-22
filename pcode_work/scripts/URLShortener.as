package
{
   import flash.events.*;
   import flash.net.*;
   
   public class URLShortener extends EventDispatcher
   {
      
      private static const IS_GD_URL:String = "http://is.gd/api.php?longurl=";
      
      private var urlLoader:URLLoader;
      
      private var urlRequest:URLRequest;
      
      private var _url:String;
      
      public function URLShortener()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.urlLoader = new URLLoader();
         this.urlRequest = new URLRequest();
         this.urlLoader.addEventListener(Event.COMPLETE,this.handleComplete);
         this.urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.handleError);
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function shorten(url:String) : void
      {
         this._url = null;
         this.urlRequest.url = IS_GD_URL + url;
         this.urlLoader.load(this.urlRequest);
      }
      
      public function destroy() : void
      {
         this._url = null;
         this.urlLoader = null;
         this.urlRequest = null;
         this.urlLoader.removeEventListener(Event.COMPLETE,this.handleComplete);
         this.urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.handleError);
      }
      
      private function handleComplete(event:Event) : void
      {
         this._url = this.urlLoader.data;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function handleError(event:IOErrorEvent) : void
      {
         dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR,false,false,"Shortening failed"));
      }
   }
}

