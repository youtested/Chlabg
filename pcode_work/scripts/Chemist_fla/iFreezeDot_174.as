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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1569")]
   public dynamic class iFreezeDot_174 extends MovieClip
   {
      
      public function iFreezeDot_174()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,18,this.frame19);
      }
      
      internal function frame1() : *
      {
         gotoAndPlay(Math.round(Math.random() * 10 + 1));
         rotation = Math.random() * 30 - 15;
      }
      
      internal function frame10() : *
      {
         x = root["pPan"].iFrzTX;
         y = root["pPan"].iFrzTY + 40;
      }
      
      internal function frame19() : *
      {
         gotoAndPlay(10);
      }
   }
}

