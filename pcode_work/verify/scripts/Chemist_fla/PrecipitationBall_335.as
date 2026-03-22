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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol329")]
   public dynamic class PrecipitationBall_335 extends MovieClip
   {
      
      public function PrecipitationBall_335()
      {
         super();
         addFrameScript(0,this.frame1,370,this.frame371);
      }
      
      internal function frame1() : *
      {
         rotation = Math.random() * 20 - 10;
         scaleX = Math.random() * 0.5 + 0.5;
         scaleY = (Math.random() * 0.2 + 0.9) * scaleX;
      }
      
      internal function frame371() : *
      {
         stop();
      }
   }
}

