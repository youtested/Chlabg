package
{
   import fl.transitions.*;
   import fl.transitions.easing.*;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol501")]
   public dynamic class iReporter extends MovieClip
   {
      
      public var MainTxt:TextField;
      
      public var SharePane:MovieClip;
      
      public var btnBack:SimpleButton;
      
      public var btnShare:SimpleButton;
      
      public var datetxt:TextField;
      
      public var t:Tween;
      
      public function iReporter()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function bk(e:*) : void
      {
         visible = false;
      }
      
      public function share(e:*) : void
      {
         this.SharePane.visible = true;
         this.t = new Tween(this.SharePane,"alpha",None.easeNone,0,1,10,false);
      }
      
      internal function frame1() : *
      {
         this.btnBack.addEventListener(MouseEvent.CLICK,this.bk);
         this.btnShare.addEventListener(MouseEvent.CLICK,this.share);
      }
   }
}

