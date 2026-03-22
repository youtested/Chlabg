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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1909")]
   public dynamic class SmokeStar_117 extends MovieClip
   {
      
      public function SmokeStar_117()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         gotoAndPlay(Math.round(Math.random() * 35) + 1);
         scaleX = 0.5 - Math.random() * 0.5;
         scaleY = scaleX * 1.5;
         alpha = Math.random() * 0.8 + 0.2;
      }
   }
}

