package
{
   import com.adobe.images.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.net.*;
   
   public class Uploader
   {
      
      private static var SendRequest:URLRequest;
      
      private static var SendLoader:URLLoader;
      
      public static var evts:EventDispatcher = new EventDispatcher();
      
      public function Uploader()
      {
         super();
      }
      
      private static function RDM() : Number
      {
         return Math.round(Math.random() * 9999999);
      }
      
      public static function iUploadThumb(stg:*, Name:String) : *
      {
         var form:MsMultiPartFormData = new MsMultiPartFormData();
         form.AddFormField("act","1");
         var scale:Number = 0.5;
         var matrix:Matrix = new Matrix();
         var bitmap_data:BitmapData = new BitmapData(1024,768,false);
         bitmap_data.draw(stg,matrix);
         var jpg:JPGEncoder = new JPGEncoder(80);
         form.AddStreamFile("fileUpload",Name + ".jpg",jpg.encode(bitmap_data));
         form.PrepareFormData();
         var req:URLRequest = new URLRequest("http://thixlab.com/CloudLab/LabThumb.aspx?name=" + Name + "&id=" + RDM());
         var header:URLRequestHeader = new URLRequestHeader("Content-Type","multipart/form-data; boundary=" + form.Boundary);
         req.requestHeaders.push(header);
         req.method = "POST";
         req.data = form.GetFormData();
         var loader:URLLoader = new URLLoader(req);
      }
      
      public static function iSend(cnt:String, txt:String) : void
      {
         SendRequest = new URLRequest("http://www.thixlab.com/CloudLab/LabSend.aspx?act=csend&object=" + txt + "&content=" + cnt + "&id=" + RDM());
         SendLoader = new URLLoader();
         SendLoader.load(SendRequest);
         SendLoader.addEventListener(Event.COMPLETE,cmp);
      }
      
      public static function cmp(e:*) : void
      {
         evts.dispatchEvent(new Event(Event.COMPLETE));
         SendLoader.removeEventListener(Event.COMPLETE,cmp);
      }
      
      private static function loaderIOErrorHandler(e:IOErrorEvent) : void
      {
         trace(e.text);
      }
   }
}

