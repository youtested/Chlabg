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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1198")]
   public dynamic class LSmovRestore extends iLS
   {
      
      public function LSmovRestore()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function doBuy(e:*) : void
      {
         Credit.restoreChem();
      }
      
      internal function frame1() : *
      {
         addEventListener(MouseEvent.CLICK,this.doBuy);
      }
   }
}

