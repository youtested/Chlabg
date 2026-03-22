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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1591")]
   public dynamic class MoreIgnEffect_167 extends MovieClip
   {
      
      public function MoreIgnEffect_167()
      {
         super();
         addFrameScript(0,this.frame1,12,this.frame13);
      }
      
      internal function frame1() : *
      {
         if(stage != null)
         {
            x = root["pPan"].iIgnTX;
            y = root["pPan"].iIgnTY - 35;
         }
      }
      
      internal function frame13() : *
      {
         gotoAndPlay(5);
         if(stage != null)
         {
            x = root["pPan"].iIgnTX;
            y = root["pPan"].iIgnTY - 35;
         }
      }
   }
}

