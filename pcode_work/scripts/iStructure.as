package
{
   import fl.motion.*;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.media.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol353")]
   public class iStructure extends iBase
   {
      
      public var Blurs:MovieClip;
      
      public var Device_1:MovieClip;
      
      public var iHit:MovieClip;
      
      public var iHitObj:MovieClip;
      
      public var iHitObj2:MovieClip;
      
      public var movLeak:MovieClip;
      
      public var movLeak2:MovieClip;
      
      public var iUID:String;
      
      public var iIsLink:Boolean = false;
      
      public var iIsSteelRing:Boolean = true;
      
      public var iSr:iSteelRing = new iSteelRing(this);
      
      public var shineObj:Boolean = false;
      
      private var iValue:Number = 1;
      
      private var iValueX:Number = 0;
      
      private var mDrop:SoundChannel = new SoundChannel();
      
      private var Zaxx:*;
      
      private var Zaxy:Number;
      
      private var iMove:Boolean = false;
      
      public function iStructure(inStance:cStructure, inLb:*, inName:*)
      {
         super();
         iName = inName;
         iLabs = inLb;
         cDv = inStance;
         iType = cDv.cType;
         iLife = true;
         iFirst = true;
         this.iInit();
         iLinkBox = new Array();
         this.iDoSteelRing(true);
         iLabs.iDvNumSet(1);
         this.movLeak.mouseEnabled = false;
         this.movLeak2.mouseEnabled = false;
         this.Blurs.mouseEnabled = false;
         iGenr = "Structure";
         if(iType == "SteelStand")
         {
            iLabs.root["pPan"].iRollingAdd(iType);
            switch(iLoc.LG)
            {
               case "en":
                  this.iUID = "Steel stand" + String(iLabs.root["pPan"].iRolling[iType]);
                  break;
               case "zh":
                  this.iUID = "铁架台" + String(iLabs.root["pPan"].iRolling[iType]);
            }
         }
      }
      
      public function iSetDown() : void
      {
         iFirst = false;
         this.iProgZax();
         this.changeScale();
      }
      
      private function changeScale() : void
      {
         var _scale:Number = NaN;
         _scale = (y - 274) / (768 - 274) * 0.4 + 0.7;
         if(_scale < 0.7)
         {
         }
         var color:Color = new Color();
         if(_scale < 0.9)
         {
            color.brightness = _scale - 0.9;
         }
         else
         {
            color.brightness = 0;
         }
         if(color.brightness > 0)
         {
            color.brightness = 0;
         }
         this.iValueX = (x - 512) / 512;
         this.iValue = _scale;
         this.Device_1.scaleX = _scale;
         this.Device_1.scaleY = _scale;
         this.Blurs.scaleX = _scale;
         this.Blurs.scaleY = _scale;
         var bx:Number = 0;
         if(_scale < 0.9)
         {
            bx = (0.9 - _scale) * 4;
         }
         else
         {
            bx = 0;
         }
         this.Blurs.alpha = bx;
         this.Device_1.transform.colorTransform = color;
         this.Device_1.alpha = 1 - bx;
      }
      
      private function iProgLabel() : *
      {
      }
      
      public function iDelete(n:Boolean = false) : *
      {
         var i:* = undefined;
         iLabs.cDm.cRemove2(cDv.cName);
         iLabs.myReport.NewAction(ActionType.DELETE,this.iUID);
         iLabs.iRemove(this);
         iLabs.iSelected = null;
         for(i in iLinkBox)
         {
            if(iLinkBox[i] != undefined)
            {
               iLinkBox[i].objs.iDelete();
            }
         }
         iLabs.iDvNumSet(-1);
         iLife = false;
      }
      
      public function iInit() : *
      {
         this.iHit.addEventListener(MouseEvent.MOUSE_DOWN,this.startDrag_Press);
      }
      
      public function iLinkTo(inS1:*, num:*) : *
      {
         var dy:Number = NaN;
         var dx:Number = NaN;
         if(num == 1)
         {
            iLinkBox[0] = {
               "objs":inS1,
               "point":new Array(5 * Window.getRes(),10 * Window.getRes()),
               "lk":parent
            };
            inS1.iLink = this;
            this.mDrop = iLabs.mSd.inmIr.play();
            this.mDrop.soundTransform = new SoundTransform(this.iValue,this.iValueX);
            if(inS1.iType == "Heater")
            {
               if(iLinkBox[1] != null)
               {
                  inS1.leakToObj = iLinkBox[1].objs;
               }
            }
            if(iLinkBox[1] != null)
            {
               if(iLinkBox[1].objs.iType == "Funnel")
               {
                  iLinkBox[1].objs.leakToObj = inS1;
               }
            }
         }
         else if(num == 2)
         {
            dy = 0;
            dx = 100 * Window.getRes();
            if(inS1.iType == "TT")
            {
               dy = 73 * Window.getRes();
               dx = 79 * Window.getRes();
            }
            if(inS1.iType != "Heater" && inS1.iType != "StandSteel" && inS1.iType != "Tripod")
            {
               iLinkBox[1] = {
                  "objs":inS1,
                  "point":new Array(dx,dy),
                  "lk":this.iSr
               };
               inS1.iLink = this;
               this.mDrop = iLabs.mSd.inmIr.play();
               this.mDrop.soundTransform = new SoundTransform(this.iValue,this.iValueX);
            }
            if(inS1.iType == "Funnel" || inS1.iType == "TT")
            {
               inS1.iD.Device_1.Str.visible = true;
            }
            if(inS1.iType == "TT")
            {
               this.iSr.gotoAndStop(2);
               inS1.iRot(true);
            }
            else
            {
               this.iSr.gotoAndStop(1);
            }
            if(iLinkBox[0] != null)
            {
               if(iLinkBox[0].objs.iType == "Heater")
               {
                  iLinkBox[0].objs.leakToObj = inS1;
               }
               else if(inS1.iType == "Funnel")
               {
                  inS1.leakToObj = iLinkBox[0].objs;
               }
            }
         }
         this.iDragLink();
      }
      
      public function iScanLink(inS:*, n:*) : Boolean
      {
         var i:* = undefined;
         for(i in iLinkBox)
         {
            if(iLinkBox[n] != null)
            {
               if(iLinkBox[n].objs != inS)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function iDisLink(inS1:*) : *
      {
         var i:* = undefined;
         if(inS1.iType == "Heater")
         {
            inS1.leakToObj = null;
         }
         else if(inS1.iType == "Funnel" || inS1.iType == "TT")
         {
            if(inS1.iType == "TT")
            {
               inS1.iRot(false);
            }
            inS1.iD.Device_1.Str.visible = false;
            inS1.leakToObj = null;
         }
         if(iLinkBox[1] != null)
         {
            if(iLinkBox[1].objs.iType == "Funnel")
            {
               iLinkBox[1].objs.leakToObj = null;
            }
         }
         if(inS1.iGenr == "Container")
         {
            if(iLinkBox[0] != null)
            {
               if(iLinkBox[0].objs.iType == "Heater")
               {
                  iLinkBox[0].objs.leakToObj = null;
               }
            }
         }
         for(i in iLinkBox)
         {
            if(iLinkBox[i] != null)
            {
               if(iLinkBox[i].objs == inS1)
               {
                  iLinkBox[i] = null;
                  break;
               }
            }
         }
      }
      
      public function iProg() : *
      {
         this.iProgShine();
         this.iProgLabel();
         this.iProgZax();
      }
      
      private function iProgZax() : void
      {
         var d:Number = Math.round(y / 34);
         this.Zaxx = -Math.pow(1.2,d) * iLabs.rollingX;
         this.Zaxy = Math.pow(1.2,d) * iLabs.rollingY;
         this.Device_1.x = this.Zaxx;
         this.Device_1.y = this.Zaxy;
         this.Blurs.y = this.Zaxy;
         this.Blurs.x = this.Zaxx;
         this.iDragLink();
      }
      
      public function iDoSteelRing(inN:*) : *
      {
         this.iIsSteelRing = inN;
         if(inN)
         {
            this.iSr.x = -90;
            this.iSr.y = -200;
            this.iSr.visible = true;
            this.Device_1.addChild(this.iSr);
         }
      }
      
      public function iDragLink() : *
      {
         var i:* = undefined;
         var ax:* = undefined;
         var ay:Number = NaN;
         if(iLinkBox.length > 0)
         {
            for(i in iLinkBox)
            {
               if(iLinkBox[i] != undefined)
               {
                  ax = 0;
                  ay = 0;
                  if(iLinkBox[i].objs.iType == "Funnel")
                  {
                     ax = 8;
                     ay = 32 * Window.getRes();
                  }
                  iLinkBox[i].objs.x = x + (iLinkBox[i].lk.x * Window.getRes() + iLinkBox[i].point[0] + ax + this.Zaxx) * this.Device_1.scaleX;
                  iLinkBox[i].objs.y = y + (iLinkBox[i].lk.y * Window.getRes() + iLinkBox[i].point[1] + ay + this.Zaxy) * this.Device_1.scaleY;
                  iLinkBox[i].objs.ref(y);
               }
            }
         }
      }
      
      public function iGetDis() : Number
      {
         return -this.iSr.y * 2;
      }
      
      public function startDrag_Press(e:*) : void
      {
         this.iDrag();
      }
      
      public function startMove_Press(e:*) : *
      {
         startDrag(false);
         if(!iFirst)
         {
            if(root["pPan"].iCreator.currentFrame == 2)
            {
               root["pPan"].doblack1(0);
            }
            if(root["pPan"].iCreator.currentFrame == 3)
            {
               root["pPan"].doblack2(0);
            }
         }
         this.changeScale();
         this.iDragLink();
         this.iMove = true;
      }
      
      public function stopDrag_Release(e:*) : void
      {
         this.iStopDrag();
      }
      
      public function iDrag() : *
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDrag_Release);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.startMove_Press);
         if(iLabs.iSelected == this)
         {
            iLabs.iSelected = null;
         }
      }
      
      private function iProgShine() : void
      {
         if(iLabs.shineObj != this)
         {
            this.iShine(0);
            Forb = true;
         }
      }
      
      public function iShine(n:*) : *
      {
         if(n == 1)
         {
            if(Forb)
            {
               this.movLeak.gotoAndStop(1);
               this.movLeak2.gotoAndStop(1);
            }
            else
            {
               this.movLeak.gotoAndStop(2);
               this.movLeak2.gotoAndStop(2);
            }
            this.movLeak.visible = true;
            this.movLeak2.visible = false;
         }
         else if(n == 2)
         {
            if(Forb)
            {
               this.movLeak.gotoAndStop(1);
               this.movLeak2.gotoAndStop(1);
            }
            else
            {
               this.movLeak.gotoAndStop(2);
               this.movLeak2.gotoAndStop(2);
            }
            this.movLeak.visible = false;
            this.movLeak2.visible = true;
         }
         else
         {
            this.movLeak.visible = false;
            this.movLeak2.visible = false;
         }
      }
      
      public function iTestHit() : void
      {
      }
      
      public function iStopDrag() : *
      {
         stopDrag();
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDrag_Release);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.startMove_Press);
         if(iFirst)
         {
            root["pPan"].iReset();
            if(y < 300)
            {
               this.iDelete();
               return;
            }
            iFirst = false;
         }
         else if(!this.iMove)
         {
            iLabs.iSelected = this;
            trace(308);
         }
         this.iMove = false;
         iLabs.iSortDepth();
         iLabs.iDrag = false;
         this.iDragLink();
      }
   }
}

