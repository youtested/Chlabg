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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1341")]
   public dynamic class movCreditPanel_241 extends MovieClip
   {
      
      public var txtPrice:TextField;
      
      public function movCreditPanel_241()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function doBuy(e:*) : void
      {
         Credit.buyOrganic();
      }
      
      internal function frame1() : *
      {
         addEventListener(MouseEvent.CLICK,this.doBuy);
      }
   }
}

