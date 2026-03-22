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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1908")]
   public dynamic class Smoke2_116 extends MovieClip
   {
      
      public function Smoke2_116()
      {
         super();
         addFrameScript(0,this.frame1,66,this.frame67);
      }
      
      internal function frame1() : *
      {
         gotoAndPlay(Math.round(Math.random() * 35) + 1);
         scaleX = Math.random() * 0.5 + 0.5;
      }
      
      internal function frame67() : *
      {
         gotoAndPlay(35);
      }
   }
}

