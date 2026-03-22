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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1582")]
   public dynamic class iFlameDotExt_164 extends MovieClip
   {
      
      public function iFlameDotExt_164()
      {
         super();
         addFrameScript(0,this.frame1,10,this.frame11,40,this.frame41);
      }
      
      internal function frame1() : *
      {
         gotoAndPlay(Math.round(Math.random() * 10 + 1));
         rotation = Math.random() * 5 - 2.5;
      }
      
      internal function frame11() : *
      {
         if(stage != null)
         {
            x = stage.mouseX;
            y = stage.mouseY - 35;
         }
      }
      
      internal function frame41() : *
      {
         stop();
      }
   }
}

