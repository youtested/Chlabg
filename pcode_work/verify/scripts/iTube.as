package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol222")]
   public class iTube extends iBase
   {
      
      public var btnClose:SimpleButton;
      
      public var d1:MovieClip;
      
      public var d2:MovieClip;
      
      public var d3:MovieClip;
      
      public var movDes:MovieClip;
      
      public var y1:MovieClip;
      
      public var y2:MovieClip;
      
      public var iIsIgn:Boolean;
      
      public var iUID:String;
      
      public var iDvNm1:String;
      
      public var iDvNm2:String;
      
      public var iDv1:iDevice;
      
      public var iDv2:iDevice;
      
      public var iLinking:Boolean = false;
      
      public var iDvId1:*;
      
      public var iDvId2:Number;
      
      public var leakToObj:iDevice;
      
      public function iTube(inStance:cTube, inLb:*, inName:*)
      {
         super();
         addFrameScript(0,this.frame1);
         iName = inName;
         iLabs = inLb;
         cDv = inStance;
         iType = cDv.cType;
         this.iInit();
         this.iIsIgn = false;
         visible = false;
         this.d2.height = 100;
         this.d1.height = 100;
         this.movDes.mouseEnabled = false;
         this.movDes.mouseChildren = false;
         this.d1.visible = false;
         this.d2.visible = false;
         iLabs.root["pPan"].iRollingAdd(iType);
         this.iUID = "Tube" + String(iLabs.root["pPan"].iRolling[iType]);
      }
      
      public function iLinkUp() : void
      {
         this.iLinkTo1(root["myLab"].iBox[this.iDvNm1]);
         if(this.iDvNm2 != null)
         {
            this.iLinkTo2(root["myLab"].iBox[this.iDvNm2]);
            this.movDes.gotoAndStop(1);
         }
      }
      
      private function dolink(e:*) : *
      {
         if(this.hitTestPoint(stage.mouseX,stage.mouseY,false))
         {
            this.iLinking = true;
            root["myLab"].iDoLink = 2;
            root["myLab"].iTheLink = this;
            this.movDes.gotoAndPlay(14);
            stage.addEventListener(MouseEvent.MOUSE_UP,this.stoplink);
         }
         else
         {
            root["myLab"].iDoLink = 0;
            this.iDelete();
         }
      }
      
      private function stoplink(e:*) : *
      {
         this.iLinking = false;
         this.movDes.gotoAndPlay(1);
         this.initTube();
         root["myLab"].iDoLink = 0;
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stoplink);
      }
      
      public function iLinkTo1(d:iDevice) : void
      {
         d.iSetLid(true);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this.dolink);
         this.iDv1 = d;
         visible = true;
         root["pPan"].iDoDark(false);
         this.initTube();
         iLabs.iSortDepth();
      }
      
      private function initTube() : void
      {
         var fixx:Number = 0;
         var fixy:Number = 0;
         if(this.iDv1.iType == "TT" && Boolean(this.iDv1.iD.Device_1.Str.visible))
         {
            fixx = 114 * this.iDv1.iD.scaleX * Window.getRes();
            fixy = 25 * this.iDv1.iD.scaleY * Window.getRes();
         }
         this.d2.visible = true;
         this.d1.x = this.iDv1.x + this.iDv1.iD.x * Window.getRes() - x + fixx;
         this.d1.y = this.iDv1.y - y - 230 * this.iDv1.iD.scaleX * Window.getRes() + this.iDv1.iD.y * Window.getRes() + fixy;
         this.d2.x = this.d1.x + 100 * Window.getRes();
         this.d2.y = this.d1.y + 1;
         this.d3.x = this.d1.x;
         this.d3.y = this.d1.y;
         this.y1.x = this.d1.x;
         this.y1.y = this.d1.y;
         this.y2.x = this.d2.x;
         this.y2.y = this.d2.y;
         this.movDes.x = this.d2.x;
         this.movDes.y = this.d2.y + 120;
         this.d3.d.height = 100;
         var dix:* = this.d2.x - this.d1.x;
         var diy:* = this.d2.y - this.d1.y;
         if(dix < 0 && diy < 0)
         {
            this.d3.rotation = -Math.atan(dix / diy) / Math.PI * 180;
         }
         if(dix > 0 && diy < 0)
         {
            this.d3.rotation = -Math.atan(dix / diy) / Math.PI * 180;
         }
         if(dix > 0 && diy > 0)
         {
            this.d3.rotation = 180 - Math.atan(dix / diy) / Math.PI * 180;
         }
         if(dix < 0 && diy > 0)
         {
            this.d3.rotation = 180 - Math.atan(dix / diy) / Math.PI * 180;
         }
         this.d1.x /= Window.getRes();
         this.d1.y /= Window.getRes();
         this.d2.x /= Window.getRes();
         this.d2.y /= Window.getRes();
         this.d3.x /= Window.getRes();
         this.d3.y /= Window.getRes();
         this.y1.x /= Window.getRes();
         this.y1.y /= Window.getRes();
         this.y2.x /= Window.getRes();
         this.y2.y /= Window.getRes();
         this.movDes.x /= Window.getRes();
         this.movDes.y /= Window.getRes();
      }
      
      public function iLinkTo2(d:iDevice) : void
      {
         this.d2.visible = false;
         d.iSetLid(true);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stoplink);
         this.iDv2 = d;
         this.iDvId1 = this.iDv1.cDv.cLink(this.iDv2.cDv);
         this.iDvId2 = this.iDv2.cDv.cLink(this.iDv1.cDv);
         iLabs.mSd.inmIr.play();
         iLabs.iSortDepth();
         stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.dolink);
      }
      
      private function iProgLink() : void
      {
         var fixx1:Number = NaN;
         var fixy1:Number = NaN;
         var fixx2:Number = NaN;
         var fixy2:Number = NaN;
         var dix:* = undefined;
         var diy:* = undefined;
         if(this.iDv1 != null)
         {
            fixx1 = 0;
            fixy1 = 0;
            fixx2 = 0;
            fixy2 = 0;
            if(this.iDv1.iType == "TT" && Boolean(this.iDv1.iD.Device_1.Str.visible))
            {
               fixx1 = 114 * this.iDv1.iD.scaleX * Window.getRes();
               fixy1 = 25 * this.iDv1.iD.scaleY * Window.getRes();
            }
            this.d1.x = this.iDv1.x - x + this.iDv1.iD.x * Window.getRes() + fixx1;
            this.d1.y = this.iDv1.y - y - 230 * this.iDv1.iD.scaleX * Window.getRes() + this.iDv1.iD.y * Window.getRes() + fixy1;
            if(this.iDv2 != null)
            {
               if(this.iDv2.iType == "TT" && Boolean(this.iDv2.iD.Device_1.Str.visible))
               {
                  fixx2 = 114 * this.iDv2.iD.scaleX * Window.getRes();
                  fixy2 = 25 * this.iDv2.iD.scaleY * Window.getRes();
               }
               alpha = (this.iDv2.iD.Device_1.alpha + this.iDv1.iD.Device_1.alpha) / 2;
               this.d2.x = this.iDv2.x - x + this.iDv2.iD.x * Window.getRes() + fixx2;
               this.d2.y = this.iDv2.y - y - 230 * this.iDv2.iD.scaleX * Window.getRes() + this.iDv2.iD.y * Window.getRes() + fixy2;
            }
            else
            {
               this.d2.x = mouseX * Window.getRes();
               this.d2.y = mouseY * Window.getRes() - 120;
            }
            this.d3.x = this.d1.x;
            this.d3.y = this.d1.y;
            this.movDes.x = this.d2.x;
            this.movDes.y = this.d2.y + 120;
            this.y1.x = this.d1.x;
            this.y1.y = this.d1.y;
            this.y2.x = this.d2.x;
            this.y2.y = this.d2.y;
            this.d3.d.height = Math.sqrt((this.d1.y - this.d2.y) * (this.d1.y - this.d2.y) + (this.d1.x - this.d2.x) * (this.d1.x - this.d2.x)) / Window.getRes();
            dix = this.d2.x - this.d1.x;
            diy = this.d2.y - this.d1.y;
            if(dix < 0 && diy < 0)
            {
               this.d3.rotation = -Math.atan(dix / diy) / Math.PI * 180;
            }
            if(dix > 0 && diy < 0)
            {
               this.d3.rotation = -Math.atan(dix / diy) / Math.PI * 180;
            }
            if(dix > 0 && diy > 0)
            {
               this.d3.rotation = 180 - Math.atan(dix / diy) / Math.PI * 180;
            }
            if(dix < 0 && diy > 0)
            {
               this.d3.rotation = 180 - Math.atan(dix / diy) / Math.PI * 180;
            }
            this.btnClose.addEventListener(MouseEvent.MOUSE_DOWN,this.dodelete);
            this.d1.x /= Window.getRes();
            this.d1.y /= Window.getRes();
            this.d2.x /= Window.getRes();
            this.d2.y /= Window.getRes();
            this.d3.x /= Window.getRes();
            this.d3.y /= Window.getRes();
            this.y1.x /= Window.getRes();
            this.y1.y /= Window.getRes();
            this.y2.x /= Window.getRes();
            this.y2.y /= Window.getRes();
            this.movDes.x /= Window.getRes();
            this.movDes.y /= Window.getRes();
         }
      }
      
      private function dodelete(e:*) : void
      {
         this.iDelete();
      }
      
      private function iProgLabel() : *
      {
         this.btnClose.x = (this.d1.x + this.d2.x) * 0.5;
         this.btnClose.y = (this.d1.y + this.d2.y) * 0.5;
      }
      
      public function iDelete(e:Boolean = true) : *
      {
         this.iDv1.iSetLid(false);
         stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.dolink);
         this.iDv1.cDv.cDisLink(this.iDvId1);
         if(this.iDv2 != null)
         {
            this.iDv2.iSetLid(false);
            this.iDv2.cDv.cDisLink(this.iDvId2);
         }
         iLife = false;
         iLabs.iRemove(this);
      }
      
      public function iInit() : *
      {
      }
      
      public function iProg() : *
      {
         if(iLife)
         {
            this.iProgLabel();
            this.iProgShine();
            if(this.iDv2 != null || this.iLinking)
            {
               this.iProgLink();
            }
            if(this.iDv1 != null && this.iDv2 != null)
            {
               if(!this.iDv1.iLife || !this.iDv2.iLife)
               {
                  this.iDelete();
               }
            }
         }
      }
      
      private function iProgShine() : void
      {
         if(iLabs.shineObj == this)
         {
            this.iShine(true);
         }
         else
         {
            this.iShine(false);
         }
      }
      
      public function iShine(n:*) : *
      {
         if(!n)
         {
         }
      }
      
      internal function frame1() : *
      {
      }
   }
}

