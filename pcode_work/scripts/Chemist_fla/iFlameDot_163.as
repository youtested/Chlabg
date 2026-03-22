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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1581")]
   public dynamic class iFlameDot_163 extends MovieClip
   {
      
      public function iFlameDot_163()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,18,this.frame19);
      }
      
      internal function frame1() : *
      {
         gotoAndPlay(Math.round(Math.random() * 10 + 1));
         rotation = Math.random() * 5 - 2.5;
      }
      
      internal function frame10() : *
      {
         if(stage != null)
         {
            x = root["pPan"].iIgnTX;
            y = root["pPan"].iIgnTY - 35;
         }
      }
      
      internal function frame19() : *
      {
         gotoAndPlay(10);
      }
   }
}

