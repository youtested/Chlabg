package
{
   import fl.motion.*;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.media.*;
   
   public class iTripod extends iBase
   {
      
      public var Blurs:MovieClip;
      
      public var Device_1:MovieClip;
      
      public var iHitObj:MovieClip;
      
      public var iHitObj2:MovieClip;
      
      public var iSr:MovieClip;
      
      public var movLeak:MovieClip;
      
      public var movLeak2:MovieClip;
      
      public var iUID:String;
      
      public var iIsLink:Boolean = false;
      
      public var shineObj:Boolean = false;
      
      public var iIsSteelRing:Boolean = true;
      
      private var iValue:Number = 1;
      
      private var iValueX:Number = 0;
      
      private var mDrop:SoundChannel = new SoundChannel();
      
      private var Zaxx:*;
      
      private var Zaxy:Number;
      
      private var isGn:Boolean = false;
      
      private var iMove:Boolean = false;
      
      public function iTripod(inStance:cStructure, inLb:*, inName:*)
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
         iLabs.iDvNumSet(1);
         iGenr = "Structure";
         iLabs.root["pPan"].iRollingAdd(iType);
         switch(iLoc.LG)
         {
            case "en":
               this.iUID = "Tripod" + String(iLabs.root["pPan"].iRolling[iType]);
               break;
            case "zh":
               this.iUID = "三脚架" + String(iLabs.root["pPan"].iRolling[iType]);
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
      
      private function iProgLabel() : *
      {
      }
      
      public function iDelete(n:Boolean = false) : *
      {
         var i:* = undefined;
         iLabs.cDm.cRemove2(cDv.cName);
         iLabs.iRemove(this);
         iLabs.iSelected = null;
         iLabs.myReport.NewAction(ActionType.DELETE,this.iUID);
         for(i in iLinkBox)
         {
            if(iLinkBox[i] != null)
            {
               iLinkBox[i].objs.iDelete();
            }
         }
         iLabs.iDvNumSet(-1);
         iLife = false;
      }
      
      public function iInit() : *
      {
         this.Device_1.addEventListener(MouseEvent.MOUSE_DOWN,this.startDrag_Press);
      }
      
      private function Hg(b:Boolean) : void
      {
         if(b)
         {
            if(iLinkBox[0].objs.iHeaterType == 1)
            {
               this.Device_1.gotoAndStop(2);
            }
            else
            {
               this.Device_1.gotoAndStop(3);
            }
         }
         else
         {
            this.Device_1.gotoAndStop(1);
         }
         this.Gn(this.isGn);
      }
      
      private function Gn(b:Boolean) : void
      {
         this.isGn = b;
         if(b)
         {
            this.Device_1.movGn.visible = true;
         }
         else
         {
            this.Device_1.movGn.visible = false;
         }
      }
      
      public function iLinkTo(inS1:*, num:*) : *
      {
         var ax:* = undefined;
         var ay:Number = NaN;
         if(num == 0)
         {
            iLinkBox[0] = {
               "objs":inS1,
               "point":new Array(0,1),
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
            inS1.iLinked = "Tripod";
            this.Hg(true);
            x = iLinkBox[0].objs.x;
            y = iLinkBox[0].objs.y + 25 * Window.getRes();
         }
         else if(num == 1)
         {
            iLinkBox[0] = {
               "objs":inS1,
               "point":new Array(0,1),
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
            inS1.iLinked = "Tripod";
            this.Hg(true);
            iLinkBox[0].objs.x = x;
            iLinkBox[0].objs.y = y - 25 * Window.getRes();
         }
         else if(num == 2)
         {
            if(inS1.iType != "Heater" && inS1.iType != "StandSteel" && inS1.iType != "Tripod")
            {
               if(inS1.isSmall)
               {
                  ax = -5;
                  ay = -8;
               }
               else
               {
                  ax = 2;
                  ay = 0;
               }
               iLinkBox[1] = {
                  "objs":inS1,
                  "point":new Array(ax,-110 * Window.getRes() + ay),
                  "lk":null
               };
               inS1.iLink = this;
               if(inS1.isSmall)
               {
                  this.Gn(true);
               }
               else
               {
                  this.Gn(false);
               }
               this.mDrop = iLabs.mSd.inmIr.play();
               this.mDrop.soundTransform = new SoundTransform(this.iValue,this.iValueX);
            }
            if(inS1.iType == "Funnel")
            {
               inS1.iD.Device_1.Str.visible = true;
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
         iLabs.iSortDepth();
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
            inS1.iLink = null;
            inS1.iLinked = "";
            inS1.iIsLink = false;
            this.Hg(false);
         }
         else if(inS1.iType == "Funnel")
         {
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
         if(iLinkBox[0] != null)
         {
            if(iLinkBox[0].objs.iType == "Heater")
            {
               iLinkBox[0].objs.leakToObj = null;
            }
         }
         for(i in iLinkBox)
         {
            if(iLinkBox[i] != null)
            {
               if(iLinkBox[i].objs != null)
               {
                  if(iLinkBox[i].objs == inS1)
                  {
                     iLinkBox[i].objs.iLink = null;
                     iLinkBox[i] = null;
                     if(i == 1)
                     {
                        this.Gn(false);
                     }
                     break;
                  }
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
      
      public function iDragLink() : *
      {
         var ax:* = undefined;
         var ay:Number = NaN;
         if(iLinkBox[1] != undefined)
         {
            ax = 3;
            ay = 0;
            iLinkBox[1].objs.x = x + (iLinkBox[1].point[0] + ax + this.Zaxx) * this.Device_1.scaleX;
            iLinkBox[1].objs.y = y + (iLinkBox[1].point[1] + ay + this.Zaxy) * this.Device_1.scaleY;
            iLinkBox[1].objs.ref(y);
         }
      }
      
      public function iGetDis() : Number
      {
         return -100;
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
         if(iLinkBox[0] != null)
         {
            this.iDisLink(iLinkBox[0].objs);
         }
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
         var st:* = iLabs.iHitTripod(this).isHit;
         if(st > 0)
         {
            iLabs.iLink(this,iLabs.iHitTripod(this).byObj,0);
         }
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
            this.mDrop = iLabs.mSd.inmDropHeater.play();
            this.mDrop.soundTransform = new SoundTransform(this.iValue,this.iValueX);
         }
         else if(!this.iMove)
         {
            iLabs.iSelected = this;
         }
         this.iMove = false;
         iLabs.iSortDepth();
         iLabs.iDrag = false;
         iFirst = false;
         this.iDragLink();
         this.iTestHit();
         if(x > 1024 || x < 0)
         {
            this.iDelete();
            return;
         }
         if(y > 768 || y < 0)
         {
            this.iDelete();
         }
      }
   }
}

