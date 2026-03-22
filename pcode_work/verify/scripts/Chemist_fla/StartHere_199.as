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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1234")]
   public dynamic class StartHere_199 extends MovieClip
   {
      
      public var wso:SharedObject;
      
      public function StartHere_199()
      {
         super();
         addFrameScript(0,this.frame1,35,this.frame36);
      }
      
      internal function frame1() : *
      {
         this.wso = SharedObject.getLocal("ChemistWelcome3");
         if(this.wso.data.pass == null)
         {
            visible = true;
         }
         if(Window.getRes() != 1)
         {
            x -= 40;
         }
      }
      
      internal function frame36() : *
      {
         stop();
      }
   }
}

