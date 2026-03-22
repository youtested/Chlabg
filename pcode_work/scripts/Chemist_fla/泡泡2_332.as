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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol324")]
   public dynamic class 泡泡2_332 extends MovieClip
   {
      
      public function 泡泡2_332()
      {
         super();
         addFrameScript(0,this.frame1,29,this.frame30);
      }
      
      internal function frame1() : *
      {
         gotoAndPlay(Math.round(Math.random() * 10));
         rotation = Math.random() * 30 - 15;
      }
      
      internal function frame30() : *
      {
         if(stage != null)
         {
            if(Math.random() < 0.8)
            {
               gotoAndPlay(1);
            }
            else
            {
               gotoAndPlay(Math.round(Math.random() * 20) + 30);
            }
         }
         else
         {
            gotoAndStop(1);
         }
      }
   }
}

