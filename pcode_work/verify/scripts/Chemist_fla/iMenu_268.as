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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1511")]
   public dynamic class iMenu_268 extends MovieClip
   {
      
      public var Board:MovieClip;
      
      public var Sel:MovieClip;
      
      public var btnBu:btnCo2;
      
      public var btnDo:SimpleButton;
      
      public var btnDr:iBtnCo;
      
      public var btnEmail:btnCo2;
      
      public var btnFb:btnCo2;
      
      public var btnFr:btnCo2;
      
      public var btnGl:btnCo2;
      
      public var btnMa:btnCo2;
      
      public var btnMass:iBtnCo;
      
      public var btnMol:iBtnCo;
      
      public var btnMolar:iBtnCo;
      
      public var btnNone:iBtnCo;
      
      public var btnReset:iBtnCo;
      
      public var btnTemp:iBtnCo;
      
      public var btnTh:btnCo2;
      
      public var btnTt:btnCo2;
      
      public var btnVol:iBtnCo;
      
      public var btnpH:btnCo2;
      
      public var lMass:iBtnCo;
      
      public var lMol:iBtnCo;
      
      public var lMolarity:iBtnCo;
      
      public var lTemp:iBtnCo;
      
      public var lVolume:iBtnCo;
      
      public var mDr:MovieClip;
      
      public var mDt:MovieClip;
      
      public var mFrz:MovieClip;
      
      public var mGr:MovieClip;
      
      public var mIgn:MovieClip;
      
      public var mPh:MovieClip;
      
      public var movSet:MovieClip;
      
      public var pClose:SimpleButton;
      
      public function iMenu_268()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3,3,this.frame4);
      }
      
      public function SetLabel(n:Number) : void
      {
         if(n == 0)
         {
            root["pPan"].iShowLabel = false;
         }
         else
         {
            root["pPan"].iShowLabel = true;
         }
         root["pPan"].LabelType = n;
         root["pPan"].saveLabel();
         this.Sel.gotoAndStop(n + 1);
         root["pPan"].bset.iconLabel.gotoAndStop(root["pPan"].LabelType + 1);
      }
      
      public function iReset(e:*) : *
      {
         root["pPan"].d_quit(0);
         root["pPan"].d_ac(0);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         this.Sel.gotoAndStop(root["pPan"].LabelType + 1);
         this.btnNone.addEventListener(MouseEvent.MOUSE_DOWN,function():*
         {
            SetLabel(0);
         });
         this.btnMass.addEventListener(MouseEvent.MOUSE_DOWN,function():*
         {
            SetLabel(1);
         });
         this.btnVol.addEventListener(MouseEvent.MOUSE_DOWN,function():*
         {
            SetLabel(2);
         });
         this.btnMolar.addEventListener(MouseEvent.MOUSE_DOWN,function():*
         {
            SetLabel(3);
         });
         this.btnTemp.addEventListener(MouseEvent.MOUSE_DOWN,function():*
         {
            SetLabel(4);
         });
         this.btnMol.addEventListener(MouseEvent.MOUSE_DOWN,function():*
         {
            SetLabel(5);
         });
      }
      
      internal function frame4() : *
      {
         this.btnReset.addEventListener(MouseEvent.CLICK,this.iReset);
      }
   }
}

