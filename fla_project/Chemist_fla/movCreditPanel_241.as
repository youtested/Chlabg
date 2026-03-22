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
   
   public dynamic class movCreditPanel_241 extends MovieClip
   {
      
      public var txtPrice:TextField;
      
      public function movCreditPanel_241()
      {
         super();
      }
      
      public function doBuy(e:*) : void
      {
         Credit.buyOrganic();
      }
   }
}

