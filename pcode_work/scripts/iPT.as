package
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol85")]
   public dynamic class iPT extends MovieClip
   {
      
      public var btnBack:SimpleButton;
      
      public function iPT()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function bk(e:*) : void
      {
         visible = false;
      }
      
      internal function frame1() : *
      {
         this.btnBack.addEventListener(MouseEvent.CLICK,this.bk);
      }
   }
}

