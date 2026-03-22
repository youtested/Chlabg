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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1584")]
   public dynamic class iFlameDotBlast_165 extends MovieClip
   {
      
      public function iFlameDotBlast_165()
      {
         super();
         addFrameScript(0,this.frame1,6,this.frame7);
      }
      
      internal function frame1() : *
      {
         if(stage != null)
         {
            x = stage.mouseX;
            y = stage.mouseY - 35;
         }
      }
      
      internal function frame7() : *
      {
         (parent as MovieClip).gotoAndStop(2);
      }
   }
}

