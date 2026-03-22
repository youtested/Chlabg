package Chemist_fla
{
   import flash.accessibility.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.sensors.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public dynamic class SharePane_300 extends MovieClip
   {
      
      public var btnback:SimpleButton;
      
      public var btnsa:iBtnCo;
      
      public var btnse:iBtnCo;
      
      public function SharePane_300()
      {
         super();
      }
      
      public function sa(e:*) : void
      {
         var bc:Number = NaN;
         var bitmap_data:BitmapData = null;
         var rct:Rectangle = null;
         var mat:Matrix = null;
         var cameraroll:CameraRoll = null;
         if(CameraRoll.supportsAddBitmapData)
         {
            parent.btnBack.visible = false;
            parent.btnShare.visible = false;
            bc = 16777215;
            visible = false;
            bitmap_data = new BitmapData(2 * 1024,2 * 768,false,bc);
            rct = parent.getBounds(parent);
            mat = new Matrix(1,0,0,1,0,-rct.top);
            mat.scale(2,2);
            bitmap_data.draw(parent,mat);
            cameraroll = new CameraRoll();
            cameraroll.addBitmapData(bitmap_data);
            visible = true;
            parent.btnBack.visible = true;
            parent.btnShare.visible = true;
         }
         parent.visible = false;
      }
      
      public function bk(e:*) : void
      {
         visible = false;
         alpha = 0;
      }
      
      public function se(e:*) : void
      {
         navigateToURL(new URLRequest("mailto:?subject=Lab Report&body=" + root["myLab"].myReport.PlainTxt),"_self");
      }
   }
}

