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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1525")]
   public dynamic class iLoading extends MovieClip
   {
      
      public function iLoading()
      {
         super();
         addFrameScript(44,this.frame45);
      }
      
      internal function frame45() : *
      {
         parent.removeChild(this);
         stop();
      }
   }
}

