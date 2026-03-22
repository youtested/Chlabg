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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1586")]
   public dynamic class SmokeFlame_166 extends MovieClip
   {
      
      public function SmokeFlame_166()
      {
         super();
         addFrameScript(0,this.frame1,77,this.frame78);
      }
      
      internal function frame1() : *
      {
         gotoAndPlay(Math.round(Math.random() * 35) + 1);
         scaleX = Math.random() * 0.5 + 0.5;
         if(stage != null)
         {
            x = root["pPan"].iIgnTX;
            y = root["pPan"].iIgnTY - 35;
         }
      }
      
      internal function frame78() : *
      {
         gotoAndPlay(35);
         if(stage != null)
         {
            x = root["pPan"].iIgnTX;
            y = root["pPan"].iIgnTY - 35;
         }
      }
   }
}

