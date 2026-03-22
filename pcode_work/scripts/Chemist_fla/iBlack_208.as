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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1262")]
   public dynamic class iBlack_208 extends MovieClip
   {
      
      public var iTip:MovieClip;
      
      public function iBlack_208()
      {
         super();
         addFrameScript(0,this.frame1,8,this.frame9,15,this.frame16);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame9() : *
      {
         stop();
         if(root["myLab"].iDvNum > 0)
         {
            this.iTip.visible = false;
         }
         else
         {
            this.iTip.visible = true;
         }
      }
      
      internal function frame16() : *
      {
         gotoAndStop(1);
      }
   }
}

