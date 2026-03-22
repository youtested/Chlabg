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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1912")]
   public dynamic class WaterExp_118 extends MovieClip
   {
      
      public function WaterExp_118()
      {
         super();
         addFrameScript(0,this.frame1,26,this.frame27);
      }
      
      internal function frame1() : *
      {
         scaleX = 1 - Math.random() * 2;
         scaleY = Math.abs(scaleX);
         gotoAndPlay(Math.round(Math.random() * 9) + 1);
      }
      
      internal function frame27() : *
      {
         stop();
      }
   }
}

