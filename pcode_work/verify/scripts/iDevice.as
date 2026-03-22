package
{
   import fl.motion.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1932")]
   public class iDevice extends iBase
   {
      
      public static var iSignAll:Number = 0;
      
      public var iD:MovieClip;
      
      public var iExp:MovieClip;
      
      public var iHitObj:MovieClip;
      
      public var iHitObj2:MovieClip;
      
      public var iPour:MovieClip;
      
      public var iShadow:MovieClip;
      
      public var movLeak:MovieClip;
      
      private var myshineObj:*;
      
      public var iCtn:MovieClip;
      
      public var iSign:Number;
      
      public var iMark:String;
      
      public var shineObj:Boolean = false;
      
      public var iIsLid:Boolean = false;
      
      public var iIsLink:Boolean = false;
      
      public var iLinked:String = "";
      
      public var isSmall:Boolean = false;
      
      public var isSmallOpen:Boolean = false;
      
      private var iIsLeak:Boolean = false;
      
      public var iHt:Number;
      
      private var iTID:int = 0;
      
      private var iBox:Dictionary;
      
      public var iUID:String;
      
      private var iCircle:Number;
      
      private var iLb:iLabel;
      
      private var iWater:Number;
      
      private var iEffect:String = "";
      
      private var mSc:SoundChannel = new SoundChannel();
      
      private var mSt:SoundTransform = new SoundTransform();
      
      private var mFlameStream:SoundChannel = new SoundChannel();
      
      private var mDrop:SoundChannel = new SoundChannel();
      
      private var iValue:Number = 1;
      
      private var iValueX:Number = 0;
      
      private var flashtime:Number = -5;
      
      public var iReadytoPour:Boolean = false;
      
      public var iIsTube:Boolean = false;
      
      public var iIsCap:Boolean = false;
      
      private var iLidNum:uint = 0;
      
      private var Zaxx:*;
      
      private var Zaxy:Number;
      
      private var iPourTID:int;
      
      public var iBlasted:Boolean = false;
      
      public var iHasWater:Boolean = false;
      
      private var iTemp:Number = 0;
      
      private var lastPress:Number;
      
      private var isLeging:Boolean = true;
      
      private var iTouchPoint:Point;
      
      private var iTouchEvent:TouchEvent;
      
      public var iZoomed:Boolean = false;
      
      private var _px:Number;
      
      private var _py:Number;
      
      private var iMove:Boolean = false;
      
      private var iPotObj:*;
      
      private var iMovetoX:*;
      
      private var iMovetoY:Number;
      
      public var iPouring:*;
      
      public var iPouringReported:Boolean = false;
      
      public var leakToObj:*;
      
      public var leakMeObj:*;
      
      private var mixTime:Number = 0;
      
      private var pastx:Number = 0;
      
      private var pasty:Number = 0;
      
      private const MixDistance:Number = 10;
      
      private var shineType:Number;
      
      public function iDevice(inStance:cDevice, inLb:*, inName:*)
      {
         super();
         iName = inName;
         ++iSignAll;
         iLabs = inLb;
         iPans = iLabs.root["pPan"];
         this.iSign = iSignAll;
         cDv = inStance;
         cDv.iDv = this;
         iType = cDv.cType;
         this.iUID = this.GetUID();
         this.iBox = new Dictionary(true);
         this.iCtn = new MovieClip();
         this.iInitLabel();
         this.iInitSub();
         this.iInitTouch();
         this.iInitPourDrag();
         this.iInitDevice();
         this.iInitFirst();
         this.iInitMouseEnabled();
         this.iSetLid(false);
         this.iSetSmall();
         this.iIsLeak = false;
         this.iHt = 0;
         this.iCircle = 0;
         iNumber = 0;
         this.iWater = 0;
         iGenr = "Container";
         iLabs.iDvNumSet(1);
      }
      
      private function GetUID() : String
      {
         switch(iLoc.LG)
         {
            case "zh":
               switch(iType)
               {
                  case "Beaker2":
                     iPans.iRollingAdd(iType);
                     return "烧杯(100mL)" + String(iPans.iRolling[iType]);
                  case "Beaker1":
                     iPans.iRollingAdd(iType);
                     return "烧杯(250mL)" + String(iPans.iRolling[iType]);
                  case "Funnel":
                     iPans.iRollingAdd(iType);
                     return "漏斗" + String(iPans.iRolling[iType]);
                  case "GasBottle":
                     iPans.iRollingAdd(iType);
                     return "集气瓶" + String(iPans.iRolling[iType]);
                  case "Awl":
                     iPans.iRollingAdd(iType);
                     return "锥形瓶(100mL)" + String(iPans.iRolling[iType]);
                  case "Awl2":
                     iPans.iRollingAdd(iType);
                     return "锥形瓶(250mL)" + String(iPans.iRolling[iType]);
                  case "Watch":
                     iPans.iRollingAdd(iType);
                     return "观察皿" + String(iPans.iRolling[iType]);
                  case "Bowl":
                     iPans.iRollingAdd(iType);
                     return "蒸发皿" + String(iPans.iRolling[iType]);
                  case "Boiler":
                     iPans.iRollingAdd(iType);
                     return "烧瓶(100mL)" + String(iPans.iRolling[iType]);
                  case "Boiler2":
                     iPans.iRollingAdd(iType);
                     return "烧瓶(250mL)" + String(iPans.iRolling[iType]);
                  case "TT":
                     iPans.iRollingAdd(iType);
                     return "试管" + String(iPans.iRolling[iType]);
               }
               break;
            default:
               switch(iType)
               {
                  case "Beaker2":
                     iPans.iRollingAdd(iType);
                     return "Beaker(100mL)" + String(iPans.iRolling[iType]);
                  case "Beaker1":
                     iPans.iRollingAdd(iType);
                     return "Beaker(250mL)" + String(iPans.iRolling[iType]);
                  case "Funnel":
                     iPans.iRollingAdd(iType);
                     return "Funnel" + String(iPans.iRolling[iType]);
                  case "GasBottle":
                     iPans.iRollingAdd(iType);
                     return "Gas bottle" + String(iPans.iRolling[iType]);
                  case "Awl":
                     iPans.iRollingAdd(iType);
                     return "Erlenmeyer flask(100mL)" + String(iPans.iRolling[iType]);
                  case "Awl2":
                     iPans.iRollingAdd(iType);
                     return "Erlenmeyer flask(250mL)" + String(iPans.iRolling[iType]);
                  case "Watch":
                     iPans.iRollingAdd(iType);
                     return "Watch glass" + String(iPans.iRolling[iType]);
                  case "Bowl":
                     iPans.iRollingAdd(iType);
                     return "Evaporating dish" + String(iPans.iRolling[iType]);
                  case "Boiler":
                     iPans.iRollingAdd(iType);
                     return "Flask(100mL)" + String(iPans.iRolling[iType]);
                  case "Boiler2":
                     iPans.iRollingAdd(iType);
                     return "Flask(250mL)" + String(iPans.iRolling[iType]);
                  case "TT":
                     iPans.iRollingAdd(iType);
                     return "Test tube" + String(iPans.iRolling[iType]);
               }
         }
      }
      
      public function iSubRefresh() : void
      {
         var i:* = undefined;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(this.iBox[i].iLife)
               {
                  this.iBox[i].iRefresh();
               }
            }
         }
      }
      
      public function iFlash() : void
      {
         if(this.flashtime == -5 && !this.iReadytoPour)
         {
            addEventListener(Event.ENTER_FRAME,this.flashevt);
         }
      }
      
      public function iStopFlash() : void
      {
         this.flashtime = -5;
         removeEventListener(Event.ENTER_FRAME,this.flashevt);
         this.iReadytoPour = false;
         this.iD.iRTP.gotoAndStop(1);
      }
      
      private function flashevt(e:*) : void
      {
         ++this.flashtime;
         if(this.flashtime == 0)
         {
            this.iReadytoPour = true;
            this.iD.iRTP.gotoAndPlay(2);
            removeEventListener(Event.ENTER_FRAME,this.flashevt);
            this.flashtime = -5;
         }
      }
      
      public function iRot(b:Boolean) : void
      {
         if(b)
         {
            this.iD.rotation = 30;
         }
         else
         {
            this.iD.rotation = 0;
         }
      }
      
      private function iSetSmall() : void
      {
         switch(iType)
         {
            case "Beaker2":
               this.isSmallOpen = false;
               break;
            case "Awl2":
               this.isSmallOpen = true;
               break;
            case "Awl":
               this.isSmallOpen = true;
               break;
            case "Boiler2":
               this.isSmallOpen = true;
               break;
            case "Boiler":
               this.isSmallOpen = true;
               break;
            case "TT":
               this.isSmallOpen = true;
               this.isSmall = true;
               this.iHitObj.gotoAndStop(2);
               break;
            case "Watch":
            case "Bowl":
               this.isSmall = true;
               this.iHitObj.gotoAndStop(3);
               break;
            default:
               this.isSmallOpen = false;
               this.isSmall = false;
               this.iHitObj.gotoAndStop(1);
         }
      }
      
      public function iSetLid(n:Boolean) : void
      {
         this.iIsLid = this.iIsTube = n;
         if(n)
         {
            this.iIsCap = false;
            ++this.iLidNum;
         }
         else if(this.iLidNum > 0)
         {
            --this.iLidNum;
         }
         if(this.iLidNum == 0)
         {
            this.iD.Device_2.iCap.visible = false;
         }
         else
         {
            this.iD.Device_2.iCap.visible = true;
            this.iD.Device_2.iLid.visible = false;
         }
      }
      
      private function iInitMouseEnabled() : void
      {
         this.mouseEnabled = false;
         this.iHitObj.mouseEnabled = false;
         this.iShadow.mouseEnabled = false;
         this.iShadow.mouseChildren = false;
         this.iHitObj2.mouseEnabled = false;
      }
      
      private function iInitLabel() : void
      {
         this.iLb = new iLabel(this);
         this.iLb.y = -130;
         this.iLb.x = -55;
         addChild(this.iLb);
      }
      
      private function iInitFirst() : void
      {
         this.iD.y = -10;
         if(iType == "TT")
         {
            this.isLeging = false;
         }
      }
      
      private function iInitTouch() : void
      {
         this.iD.iHitObj.addEventListener(MouseEvent.MOUSE_UP,this.MouseRelease);
         this.iD.iHitObj.addEventListener(TouchEvent.TOUCH_BEGIN,this.iTouchBegin);
      }
      
      private function iInitDevice() : void
      {
         trace(iType);
         this.iD.Device_1.gotoAndStop(iType);
         this.iShadow.gotoAndStop(iType);
         this.iD.Device_2.gotoAndStop(iType);
         this.iD.Device_3.gotoAndStop(iType);
         this.iD.Blurs.gotoAndStop(iType);
      }
      
      private function iInitSub() : void
      {
         this.iD.iSubInst.addChild(this.iCtn);
      }
      
      private function iInitPourDrag() : void
      {
         this.iPour.btnPour.addEventListener(TouchEvent.TOUCH_BEGIN,this.iDragPour);
      }
      
      private function iDoPourBack(e:Event) : void
      {
         if(this.iPour.btnPour.y < 0)
         {
            this.iPour.btnPour.y += (4 - this.iPour.btnPour.y) * 0.3;
         }
         else
         {
            this.iPour.btnPour.y = 0;
            this.iStopPourBack();
         }
         this.iRotateAll();
      }
      
      private function iStopPourBack() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.iDoPourBack);
      }
      
      private function iRotateAll() : void
      {
         this.iD.Device_1.rotation = this.iPour.btnPour.y * 1.1;
         this.iD.Device_2.rotation = this.iD.Device_1.rotation;
         this.iD.Device_3.rotation = this.iD.Device_1.rotation;
         this.iD.Blurs.rotation = this.iD.Device_1.rotation;
         this.iSubRefresh();
      }
      
      private function iProgZax() : void
      {
         var d:Number = Math.round(y / 34);
         this.Zaxx = -Math.pow(1.2,d) * iLabs.rollingX;
         this.Zaxy = Math.pow(1.2,d) * iLabs.rollingY;
         if(!this.isLeging && !this.iIsLink && !this.iPouring)
         {
            if(!iIsExp)
            {
               this.iD.x = this.Zaxx;
               this.iD.y = this.Zaxy;
            }
            else
            {
               this.iExp.x = this.Zaxx;
               this.iExp.y = this.Zaxy;
            }
         }
         this.iShadow.y = this.Zaxy + 5;
         this.iShadow.x = this.Zaxx;
      }
      
      private function iDragPour(e:TouchEvent) : *
      {
         this.iPourTID = e.touchPointID;
         this.iPour.btnPour.startTouchDrag(this.iPourTID,false,new Rectangle(0,-109,0,109));
         stage.addEventListener(TouchEvent.TOUCH_MOVE,this.iDragPourMove);
         stage.addEventListener(TouchEvent.TOUCH_END,this.iDragPourStop);
      }
      
      private function iDragPourMove(e:TouchEvent) : *
      {
         if(e.touchPointID == this.iPourTID)
         {
            this.iRotateAll();
         }
      }
      
      private function iDragPourStop(e:TouchEvent) : *
      {
         if(this.iPourTID == e.touchPointID)
         {
            this.iPourTID = 0;
            this.iPour.btnPour.stopTouchDrag(this.iPourTID);
            addEventListener(Event.ENTER_FRAME,this.iDoPourBack);
            stage.removeEventListener(TouchEvent.TOUCH_MOVE,this.iDragPourMove);
            stage.removeEventListener(TouchEvent.TOUCH_END,this.iDragPourStop);
         }
      }
      
      public function iDelete(f:Boolean = false) : void
      {
         if(f)
         {
            iLabs.mSd.inmDelete.play();
         }
         else
         {
            iLabs.myReport.NewAction(ActionType.DELETE,this.iUID);
         }
         iIsExp = false;
         this.iD.airBubble.Stop();
         this.iClearSub();
         this.iClearLink();
         this.iClearSoundStream();
         this.iClearCore();
         iPans.Ams.iClose();
         iLabs.iDvNumSet(-1);
         iLabs.iRemove(this);
      }
      
      private function iClearCore() : void
      {
         cDv.cMt.cFather.cRemove2(cDv.cName);
         cDv.cMt.cFather.cRemove2(cDv.cMt.cName);
      }
      
      private function iClearSub() : void
      {
         for(var i:* = cDv.cMt.cStackShow.length - 1; i >= 0; i--)
         {
            this.iProgClearSub(cDv.cMt.cStackShow[i]);
         }
      }
      
      private function iClearLink() : void
      {
         if(iLink != null)
         {
            this.iIsLink = false;
            iLink.iDisLink(this);
            iLink = null;
         }
      }
      
      private function iClearSoundStream() : void
      {
         if(this.mFlameStream != null)
         {
            this.mFlameStream.stop();
         }
         if(this.mSc != null)
         {
            this.mSc.stop();
         }
      }
      
      public function iProgExp() : void
      {
         if((Boolean(cDv.cMt.cIsExp) || Boolean(cDv.cMt.cIsGExp)) && Boolean(cDv.cMt.cFather.sExp))
         {
            iLife = false;
            iIsExp = true;
            iLabs.myReport.NewAction(ActionType.EXPLODE,this.iUID);
            cDv.cMt.cStopMix();
            iPans.iStopByExp();
            iPans.Ams.iClose();
            if(cDv.cMt.cIsGExp)
            {
               this.iExp.gotoAndPlay(15);
            }
            else
            {
               this.iExp.gotoAndPlay(2);
            }
            this.iHideCompByExp();
            this.iClearSoundStream();
            this.iClearLink();
            iLabs.iSelected = null;
            iPans.doExp(this);
            if(Boolean(this.iMove) && !this.iPouring)
            {
               this.iDrop();
            }
            this.iMove = false;
            iLabs.iDrag = false;
         }
         else if(cDv.cMt.cIsDet)
         {
            this.doEffect(null,"Det");
            cDv.cMt.cIsDet = false;
         }
         else if(cDv.cMt.cIsLDet)
         {
            this.doEffect(null,"LDet");
            cDv.cMt.cIsLDet = false;
         }
         else if(cDv.cMt.cIsEle)
         {
            this.doEffect(null,"Ele");
            cDv.cMt.cIsEle = false;
         }
         else if(cDv.cMt.cIsBB)
         {
            this.doEffect(null,"BB");
            cDv.cMt.cIsBB = false;
         }
         else if(cDv.cMt.cIsE1)
         {
            this.doEffect(null,"E1");
            cDv.cMt.cIsE1 = false;
         }
      }
      
      private function iHideCompByExp() : void
      {
         this.iLb.visible = false;
         this.iD.visible = false;
         this.iShadow.visible = false;
         this.movLeak.visible = false;
      }
      
      public function iLidUp() : void
      {
         this.iIsLid = true;
         this.iIsCap = true;
         this.iD.Device_2.iLid.gotoAndStop(this.iType);
         this.iD.Device_2.iLid.visible = true;
         if(this.iD.Device_2.iLid.btnDelete != null)
         {
            this.iD.Device_2.iLid.btnDelete.addEventListener(MouseEvent.MOUSE_DOWN,this.iLidUpHide);
         }
      }
      
      private function iLidUpHide(e:*) : void
      {
         this.iIsLid = false;
         this.iIsCap = false;
         this.iD.Device_2.iLid.visible = false;
         this.iD.Device_2.iLid.gotoAndStop(1);
         if(this.iD.Device_2.iLid.btnDelete != null)
         {
            this.iD.Device_2.iLid.btnDelete.removeEventListener(MouseEvent.MOUSE_DOWN,this.iLidUpHide);
         }
      }
      
      public function iDoIgn(n:Boolean) : void
      {
         var IgnRate:Number = NaN;
         var isIgn:Boolean = false;
         var a:* = undefined;
         var k:* = undefined;
         var isOtherGas:Boolean = false;
         if(n)
         {
            IgnRate = 0.05;
            isIgn = false;
            for(a in cDv.cMt.cG())
            {
               if(cDv.cMt.cG()[a].cName == "O2" && cDv.cMt.cG()[a].cState == 3 || iType == "Watch" && cDv.cMt.cFather.sAtmN != 2 || iType == "Bowl" && cDv.cMt.cFather.sAtmN != 2)
               {
                  isIgn = true;
                  for(k = 0; k < cDv.cMt.cGetMaxDepth() + 1; k++)
                  {
                     cDv.cMt.cHeat(cDv.cMt.cFather.sIgnTemp,k);
                  }
                  cDv.cMt.cFire = true;
                  if(!this.iBlasted)
                  {
                     isOtherGas = false;
                     for(a in cDv.cMt.cG())
                     {
                        if(cDv.cMt.cG()[a].cState == 3)
                        {
                           if(cDv.cMt.cG()[a].cName == "H2")
                           {
                              iPans.iBlastIgn();
                              this.iBlasted = true;
                           }
                           if(cDv.cMt.cG()[a].cName != "O2")
                           {
                              isOtherGas = true;
                              break;
                           }
                        }
                     }
                     if(!isOtherGas)
                     {
                        iPans.iMoreIgn();
                     }
                  }
                  break;
               }
            }
            if(!isIgn)
            {
               iPans.iStopIgn();
            }
         }
      }
      
      public function iDoFrz(inB:*) : *
      {
         var k:* = undefined;
         if(inB)
         {
            for(k = 0; k < cDv.cMt.cStack.length; k++)
            {
               cDv.cMt.cHeat(cDv.cMt.cFather.sFrzTemp,k);
            }
         }
      }
      
      private function iSweep() : void
      {
         var i:* = undefined;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               this.iBox[i].iScanLife();
            }
         }
         this.iDoClearance();
      }
      
      private function iDoClearance() : void
      {
         var con1:* = undefined;
         var con2:* = undefined;
         try
         {
            con1 = new LocalConnection();
            con1.connect("gc1");
            con2 = new LocalConnection();
            con2.connect("gc2");
         }
         catch(e:*)
         {
         }
         finally
         {
            con1 = null;
            con2 = null;
         }
      }
      
      public function iRemove(inN:String) : void
      {
         if(this.iBox[inN] != null)
         {
            this.iCtn.removeChild(this.iBox[inN]);
            this.iBox[inN] = null;
         }
      }
      
      private function iProgLabel() : void
      {
         this.iLb.iProg();
      }
      
      public function iClear() : void
      {
         cDv.cClear();
         this.iD.airBubble.Stop();
         this.iD.iEffect.gotoAndStop(1);
         this.iD.EleEffect.gotoAndStop(1);
         iLabs.myReport.NewAction(ActionType.CLEARSUB,this.iUID);
      }
      
      private function iProgSub(inS1:cMatter) : void
      {
         if(this.iBox[inS1.cSignReturn()] != null)
         {
            if(iNumber != this.iCtn.getChildIndex(this.iBox[inS1.cSignReturn()]))
            {
               this.iCtn.setChildIndex(this.iBox[inS1.cSignReturn()],iNumber);
            }
            this.iBox[inS1.cSignReturn()].y = -this.iHt;
            if(inS1.cName == "H2O" && inS1.cState == 2)
            {
               this.iHasWater = true;
               this.iWater = this.iBox[inS1.cSignReturn()].y;
            }
            if(inS1.cState == 4 && !inS1.cIsMix)
            {
               this.iBox[inS1.cSignReturn()].y = this.iWater;
            }
            this.iBox[inS1.cSignReturn()].iRefresh();
            if(inS1.cState != 4 && !inS1.cIsMix)
            {
               if(this.iBox[inS1.cSignReturn()])
               {
                  this.iHt += this.iBox[inS1.cSignReturn()].iGetHt(2);
               }
            }
            ++iNumber;
         }
         if(this.iBox[inS1.cSignReturn()] === undefined)
         {
            this.iBox[inS1.cSignReturn()] = new iSub(inS1,this);
            this.iBox[inS1.cSignReturn()].iName = inS1.cSignReturn();
            this.iCtn.addChildAt(this.iBox[inS1.cSignReturn()],iNumber);
         }
      }
      
      private function iProgClearSub(inS1:cMatter) : void
      {
         if(this.iBox[inS1.cSignReturn()] != null)
         {
            this.iBox[inS1.cSignReturn()].iRemove();
         }
      }
      
      private function iScanSub() : void
      {
         var j:* = undefined;
         this.iHasWater = false;
         this.iTemp = 0;
         for(var i:* = cDv.cMt.cStackShow.length - 1; i >= 0; i--)
         {
            this.iProgSub(cDv.cMt.cStackShow[i]);
            this.iTemp += cDv.cMt.cStackShow[i].cTemp;
         }
         for(j in this.iBox)
         {
            if(this.iBox[j] != null)
            {
               this.iBox[j].iSweep();
            }
         }
         this.iTemp *= 1 / cDv.cMt.cStackShow.length;
         if(!this.iHasWater)
         {
            this.iWater = 0;
         }
      }
      
      private function RaiseUp(e:Event) : void
      {
         if(this.iD.y > this.Zaxy - 10)
         {
            this.iD.y -= 3;
            this.isLeging = true;
         }
         else
         {
            this.iD.y = this.Zaxy - 10;
            removeEventListener(Event.ENTER_FRAME,this.RaiseUp);
         }
      }
      
      private function RaiseDown(e:Event) : void
      {
         if(this.iD.y < this.Zaxy)
         {
            this.iD.y += 3;
         }
         else
         {
            this.iD.y = this.Zaxy;
            this.isLeging = false;
            removeEventListener(Event.ENTER_FRAME,this.RaiseDown);
         }
      }
      
      private function iRaise() : void
      {
         if(iType != "Funnel" && iType != "TT")
         {
            removeEventListener(Event.ENTER_FRAME,this.RaiseDown);
            addEventListener(Event.ENTER_FRAME,this.RaiseUp);
         }
      }
      
      private function iDrop() : void
      {
         if(iType != "Funnel" && iType != "TT")
         {
            removeEventListener(Event.ENTER_FRAME,this.RaiseUp);
            addEventListener(Event.ENTER_FRAME,this.RaiseDown);
            if(!this.iIsLink)
            {
               this.mDrop = iLabs.mSd.inmDrop.play();
               this.mDrop.soundTransform = new SoundTransform(this.iValue,this.iValueX);
            }
         }
      }
      
      public function iTouchBegin(e:TouchEvent) : void
      {
         this.iTID = e.touchPointID;
         iLabs.cancelAll();
         iLabs.iSelected = null;
         this.iTouchPoint = new Point(mouseX,mouseY);
         this.iTouchEvent = e;
         addEventListener(Event.ENTER_FRAME,this.iTouchHold);
         stage.addEventListener(TouchEvent.TOUCH_END,this.iTouchEnd);
      }
      
      public function iTouchOver(e:TouchEvent) : void
      {
         if(root["pPan"].iTap)
         {
            if(!this.iZoomed)
            {
               this.iTouchEvent = e;
               iTouchHoldTime = 0;
               addEventListener(Event.ENTER_FRAME,this.iTouchOverHold);
               stage.addEventListener(TouchEvent.TOUCH_END,this.iTouchHoldOverEnd);
            }
         }
      }
      
      private function iTouchHold(e:Event) : void
      {
         ++iTouchHoldTime;
         this.iTouchHoldStop();
         this.iDrag(this.iTouchEvent);
      }
      
      private function iTouchOverHold(e:Event) : void
      {
         ++iTouchHoldTime;
         if(iTouchHoldTime > 45)
         {
            this.iZoom2();
            this.iTouchHoldOverStop();
         }
      }
      
      private function iZoom() : void
      {
         this.iZoomed = true;
         addEventListener(TouchEvent.TOUCH_OUT,this.iZoomOut);
         stage.addEventListener(TouchEvent.TOUCH_END,this.iZoomEnd);
         root["pPan"].iZoomTo(this,this.iTouchEvent);
      }
      
      private function iZoom2() : void
      {
         this.iHitObj2.gotoAndStop(2);
         this.iZoomed = true;
         iTouchHoldTime = 0;
         root["pPan"].iZoomTo2(this,this.iTouchEvent);
         stage.addEventListener(TouchEvent.TOUCH_END,this.iZoomEnd2);
      }
      
      private function iZoomEnd(e:TouchEvent) : void
      {
         if(e.touchPointID == this.iTouchEvent.touchPointID)
         {
            root["pPan"].iDisZoom();
            this.iZoomed = false;
            removeEventListener(TouchEvent.TOUCH_OUT,this.iZoomOut);
            removeEventListener(TouchEvent.TOUCH_OVER,this.iZoomOver);
            stage.removeEventListener(TouchEvent.TOUCH_END,this.iZoomEnd);
         }
      }
      
      private function iTouchHoldOverEnd(e:TouchEvent) : void
      {
         if(e.touchPointID == this.iTouchEvent.touchPointID)
         {
            root["pPan"].iDisZoom();
            this.iTouchHoldOverStop();
            this.iZoomed = false;
            stage.removeEventListener(TouchEvent.TOUCH_END,this.iTouchHoldOverEnd);
         }
      }
      
      private function iZoomEnd2(e:TouchEvent) : void
      {
         if(e.touchPointID == this.iTouchEvent.touchPointID)
         {
            this.iHitObj2.gotoAndStop(1);
            root["pPan"].iDisZoom();
            this.iZoomed = false;
            stage.removeEventListener(TouchEvent.TOUCH_END,this.iZoomEnd2);
         }
      }
      
      public function iZoomOverEnd() : void
      {
         if(this.iZoomed)
         {
            root["pPan"].iDisZoom();
            this.iZoomed = false;
            stage.removeEventListener(TouchEvent.TOUCH_END,this.iZoomEnd2);
         }
      }
      
      private function iZoomOut(e:TouchEvent) : void
      {
         if(e.touchPointID == this.iTouchEvent.touchPointID)
         {
            root["pPan"].iZm.iHideZoom();
            this.addEventListener(TouchEvent.TOUCH_OVER,this.iZoomOver);
         }
      }
      
      private function iZoomOver(e:TouchEvent) : void
      {
         if(e.touchPointID == this.iTouchEvent.touchPointID)
         {
            root["pPan"].iZm.iReZoom();
         }
      }
      
      private function iTouchHoldStop() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.iTouchHold);
         iTouchHoldTime = 0;
      }
      
      private function iTouchHoldOverStop() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.iTouchOverHold);
         iTouchHoldTime = 0;
      }
      
      public function iDrag(e:TouchEvent = null) : *
      {
         if(iFirst)
         {
            this.iMove = true;
            this.iTID = e.touchPointID;
         }
         stage.addEventListener(TouchEvent.TOUCH_END,this.iTouchEnd);
         stage.addEventListener(TouchEvent.TOUCH_MOVE,this.iTouchMove);
         startTouchDrag(e.touchPointID,false);
         if(iLabs.iSelected == this)
         {
            iLabs.iSelected = null;
         }
         if(this.leakMeObj != null)
         {
            this.leakMeObj.iPutDown();
            this.leakMeObj.leakToObj = null;
            this.leakMeObj = null;
         }
         if(this.leakToObj != null)
         {
            this.leakToObj = null;
         }
         iLabs.iDrag = true;
         this._px = e.stageX;
         this._py = e.stageY;
      }
      
      private function iTouchMove(e:TouchEvent) : void
      {
         if(e.touchPointID == this.iTID)
         {
            if(new Point(e.stageX - this._px,e.stageY - this._py).length > 10)
            {
               if(this.iPouring)
               {
                  this.iPutDownQuick();
               }
               this.iTouchHoldStop();
               if(!this.iMove)
               {
                  if(!iFirst)
                  {
                     if(iPans.iCreator.currentFrame == 2)
                     {
                        iPans.doblack1(0);
                     }
                     if(iPans.iCreator.currentFrame == 3)
                     {
                        iPans.doblack2(0);
                     }
                  }
                  if(this.iIsLink)
                  {
                     this.iIsLink = false;
                     this.iShadow.visible = true;
                     iLink.iDisLink(this);
                     iLink = null;
                  }
                  iPans.Ams.iClose();
                  this.iRaise();
                  this.iMove = true;
               }
               this.iD.x = this.Zaxx;
               this.iProgMove();
            }
         }
      }
      
      private function iProgMove() : *
      {
         this.changeScale(-999);
         this.iTestHitDev();
      }
      
      public function iTouchEnd(e:TouchEvent) : *
      {
         if(e.touchPointID == this.iTID)
         {
            this.iTouchHoldStop();
            this.iTID = 0;
            this.mSc.stop();
            if(!this.iMove)
            {
               if(!iLabs.iIgn && !iLabs.iFrz && !iLabs.ipH && !iLabs.iIsTube && !iLabs.iGr)
               {
                  if(!this.iZoomed)
                  {
                     iLabs.iSelected = this;
                     stage.removeEventListener(TouchEvent.TOUCH_MOVE,this.iTouchMove);
                     stage.removeEventListener(TouchEvent.TOUCH_END,this.iTouchEnd);
                  }
               }
            }
            else
            {
               this.iStopDrag(e);
            }
         }
      }
      
      public function iTestHit(d:Boolean = false) : void
      {
         var iHited:* = iLabs.iHitDev(this);
         if(iHited != null)
         {
            if(this.iPotObj != null)
            {
               if(Boolean(this.iPotObj.iReadytoPour) && Boolean(this.iD.iEffect.currentFrame != 332) && this.iPotObj.iD.iEffect.currentFrame != 332)
               {
                  this.leakToObj = this.iPotObj;
                  iHited.leakMeObj = this;
                  this.iMoveTo(this.leakToObj);
                  this.iPotObj.iReadytoPour = false;
                  this.iPotObj.iStopFlash();
               }
               else
               {
                  this.iPotObj.iReadytoPour = false;
                  this.iPotObj.iStopFlash();
                  this.iPotObj = null;
               }
            }
            else if(iHited.iGenr == "Structure")
            {
               iLabs.iLink(iHited,this,1);
            }
            else if(iHited.iGenr == "SteelRing")
            {
               this.iLinkSetSmallShadow(iHited.parent.parent);
               iLabs.iLink(iHited.parent.parent,this,2);
            }
            else if(iHited.parent.iGenr == "Structure")
            {
               this.iLinkSetSmallShadow(iHited);
               iLabs.iLink(iHited.parent,this,2);
            }
         }
      }
      
      public function iTestHitDev() : void
      {
         var iHited:* = iLabs.iHitDev(this);
         if(iHited != null)
         {
            if(iHited.iGenr == "Container")
            {
               if(this.iPotObj != null)
               {
                  if(this.iPotObj != iHited)
                  {
                     this.iPotObj.iStopFlash();
                  }
               }
               iHited.iFlash();
               this.iPotObj = iHited;
            }
         }
         else if(this.iPotObj != null)
         {
            this.iPotObj.iStopFlash();
            this.iPotObj = null;
         }
      }
      
      public function iStopDrag(e:TouchEvent) : void
      {
         iPans.Ams.iClose();
         stopTouchDrag(e.touchPointID);
         stage.removeEventListener(TouchEvent.TOUCH_MOVE,this.iTouchMove);
         stage.removeEventListener(TouchEvent.TOUCH_END,this.iTouchEnd);
         this.iTestHit(true);
         if(Boolean(this.iMove) && !this.iPouring)
         {
            this.iDrop();
         }
         this.iMove = false;
         this.iMix(false);
         if(iFirst)
         {
            root["pPan"].iReset();
            if(y < 300)
            {
               this.iDelete(true);
               return;
            }
            iFirst = false;
         }
         iLabs.iSortDepth();
         iLabs.iDrag = false;
      }
      
      private function iLinkSetSmallShadow(h:*) : void
      {
         if(h.parent.iType == "Tripod" && this.isSmall)
         {
            this.iShadow.visible = true;
         }
         else
         {
            this.iShadow.visible = false;
         }
      }
      
      public function ref(yg:Number) : void
      {
         this.iD.x = 0;
         this.iD.y = 0;
         this.iShadow.y = 5;
         this.iShadow.x = 0;
         this.changeScale(yg);
      }
      
      private function changeScale(ys:Number) : void
      {
         var zy:Number = y;
         if(ys != -999)
         {
            zy = ys;
         }
         var _scale:Number = (zy - 274) / (768 - 274) * 0.4 + 0.7;
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
         this.iD.scaleX = _scale;
         this.iD.scaleY = _scale;
         var bx:Number = 0;
         this.iD.iSubInst.alpha = 1;
         if(_scale < 0.7)
         {
            bx = (0.7 - _scale) * 4;
            this.iD.iSubInst.alpha = _scale;
         }
         else if(_scale > 1)
         {
            bx = (_scale - 1) * 5;
         }
         else
         {
            bx = 0;
         }
         this.iValueX = (x - 512) / 512;
         this.iValue = _scale;
         this.iD.Blurs.alpha = bx;
         this.iD.Device_1.alpha = 1 - bx;
         this.iD.Device_2.alpha = 1 - bx;
         this.iD.transform.colorTransform = color;
         this.iShadow.scaleX = _scale;
         this.iShadow.scaleY = _scale;
         if(this.mFlameStream != null)
         {
            this.mFlameStream.soundTransform = new SoundTransform(this.iValue,this.iValueX);
         }
      }
      
      public function iBlur(f:Boolean) : void
      {
         if(f)
         {
            this.iD.Blurs.alpha = 1;
            this.iD.Device_1.alpha = 0;
            this.iD.Device_2.alpha = 0;
         }
         else
         {
            this.changeScale(-999);
         }
      }
      
      public function MouseRelease(e:*) : void
      {
         this.iScanTool();
      }
      
      private function iScanTool() : void
      {
         if(iLabs.iDoLink == 2)
         {
            if(iLabs.iDoLink1 != this)
            {
               if(!iLabs.iDoLink1.cDv.cHasLink(this))
               {
                  iLabs.iDoLink2 = this;
                  iLabs.iCreateLink();
                  iLabs.iDoLink = 0;
               }
            }
         }
         if(iLabs.iIsTube)
         {
            iLabs.iIsTube = false;
            this.movLeak.alpha = 1;
            iPans.cCreateTube(0);
            iLabs.iDoLink1 = this;
            iLabs.iInitLink();
            iLabs.iSelected = null;
         }
         if(iLabs.iIsLid)
         {
            iLabs.myReport.NewAction(ActionType.ADDLID,this.iUID);
            iLabs.iIsLid = false;
            this.movLeak.alpha = 1;
            this.iLidUp();
            iLabs.iSelected = null;
         }
      }
      
      private function imovehdl2(e:*) : void
      {
         if(this.iD.y < 0)
         {
            this.iD.y -= (this.iD.y - 5) * 0.3;
         }
         else
         {
            this.iPouring = false;
            this.iPouringReported = false;
            removeEventListener(Event.ENTER_FRAME,this.imovehdl2);
            this.iD.y = 0;
         }
         this.iLb.y = this.iD.y - 130;
      }
      
      private function imovehdl(e:*) : void
      {
         if(this.iD.y > -150)
         {
            this.iD.y -= (this.iD.y - -160) * 0.3;
         }
         else
         {
            removeEventListener(Event.ENTER_FRAME,this.imovehdl);
            this.iD.y = -150;
            this.iPour.visible = true;
         }
         this.iLb.y = this.iD.y - 130;
      }
      
      private function imovehdlx1(e:*) : void
      {
         if(x < this.iMovetoX - 5)
         {
            x += (this.iMovetoX + 10 - x) * 0.3;
         }
         else
         {
            x = this.iMovetoX;
            removeEventListener(Event.ENTER_FRAME,this.imovehdlx1);
         }
      }
      
      private function imovehdlx2(e:*) : void
      {
         if(x > this.iMovetoX + 5)
         {
            x -= (x + 10 - this.iMovetoX) * 0.3;
         }
         else
         {
            x = this.iMovetoX;
            removeEventListener(Event.ENTER_FRAME,this.imovehdlx2);
         }
      }
      
      private function imovehdly1(e:*) : void
      {
         if(y < this.iMovetoY - 5)
         {
            y += (this.iMovetoY + 10 - y) * 0.3;
         }
         else
         {
            y = this.iMovetoY;
            removeEventListener(Event.ENTER_FRAME,this.imovehdly1);
         }
      }
      
      private function imovehdly2(e:*) : void
      {
         if(y > this.iMovetoY + 5)
         {
            y -= (y + 10 - this.iMovetoY) * 0.3;
         }
         else
         {
            y = this.iMovetoY;
            removeEventListener(Event.ENTER_FRAME,this.imovehdly2);
         }
      }
      
      public function iMoveTo(obj:*) : void
      {
         this.iMovetoX = obj.x + 80;
         this.iMovetoY = obj.y + 5;
         addEventListener(Event.ENTER_FRAME,this.imovehdl);
         if(x < this.iMovetoX)
         {
            addEventListener(Event.ENTER_FRAME,this.imovehdlx1);
         }
         else
         {
            addEventListener(Event.ENTER_FRAME,this.imovehdlx2);
         }
         if(y < this.iMovetoY)
         {
            addEventListener(Event.ENTER_FRAME,this.imovehdly1);
         }
         else
         {
            addEventListener(Event.ENTER_FRAME,this.imovehdly2);
         }
         this.iPouring = true;
         removeEventListener(Event.ENTER_FRAME,this.RaiseUp);
         removeEventListener(Event.ENTER_FRAME,this.RaiseDown);
      }
      
      public function iPutDown() : void
      {
         if(this.iPouring)
         {
            this.iPour.visible = false;
            addEventListener(Event.ENTER_FRAME,this.imovehdl2);
         }
      }
      
      public function iSetDown() : void
      {
         iFirst = false;
         this.iProgZax();
         this.changeScale(-999);
         this.isLeging = false;
         this.iPouring = false;
         this.iPouringReported = false;
         this.iD.y = 0;
         this.iLb.y = this.iD.y - 130;
      }
      
      public function iPutDownQuick() : void
      {
         this.iPour.visible = false;
         this.iPouring = false;
         this.iPouringReported = false;
         this.iD.y = 0;
         this.iLb.y = this.iD.y - 130;
         y -= 150;
      }
      
      public function iProg() : *
      {
         if(iLife)
         {
            this.iD.iRef.x = -x / 2;
            if(this.iCircle >= iLabs.cDm.sCircle)
            {
               this.iCircle = 0;
            }
            cDv.cLid = this.iIsLid;
            if(this.iCircle == 0)
            {
               this.iHt = 0;
               iNumber = 0;
               this.iScanSub();
               this.iSweep();
            }
            ++this.iCircle;
            this.iProgLabel();
            this.iProgExp();
            this.iLeak();
            this.iScanMix();
         }
         if(parent != null)
         {
            if(!this.iZoomed)
            {
               this.iProgZax();
            }
         }
         cDv.cLife = iLife;
      }
      
      public function iLeak() : void
      {
         var inN:Number = NaN;
         var vol_temp:* = undefined;
         cDv.cMt.cIsPour = this.iIsLeak;
         cDv.cIsLeak = this.iIsLeak;
         if(this.iD.Device_1.rotation < -80 || iType == "Funnel" && !this.iPour.visible && this.leakToObj != null)
         {
            if(!this.iPouringReported && iType != "Funnel")
            {
               this.iPouringReported = true;
               iLabs.myReport.NewAction(ActionType.POUR,this.iUID,this.leakToObj.iUID);
            }
            if(iType == "Funnel" && !this.iPour.visible)
            {
               inN = 10;
            }
            else
            {
               inN = -this.iD.Device_1.rotation - 80;
            }
            vol_temp = inN / 50;
            if(cDv.cMt.cGetTotalLVol() > 0 && iType == "Funnel" && !this.iPour.visible || cDv.cMt.cGetTotalMVol() > 0)
            {
               if(this.leakToObj.iLife)
               {
                  this.iLeakTo(vol_temp);
               }
               else
               {
                  this.iPutDown();
               }
            }
            else if(this.iIsLeak)
            {
               this.iIsLeak = false;
               this.mSc.stop();
               this.iD.movLeakObj.gotoAndStop(1);
            }
         }
         else if(this.iIsLeak)
         {
            this.iIsLeak = false;
            this.mSc.stop();
            this.iD.movLeakObj.gotoAndStop(1);
         }
      }
      
      public function iLeakTo(inN:*) : void
      {
         var isOk:* = undefined;
         var iSsc:Boolean = false;
         var ary_temp:* = undefined;
         var j:* = undefined;
         var i:* = undefined;
         var t1:* = undefined;
         var t2:* = undefined;
         var mm0:* = undefined;
         var mm1:* = undefined;
         var mm2:* = undefined;
         var mass_temp:* = undefined;
         var mat_temp:* = undefined;
         var isFilter:Boolean = false;
         if(this.leakToObj != null && !this.iIsLid)
         {
            if(this.leakToObj.iGenr == "Container")
            {
               if(iType == "Funnel" && !this.iPour.visible)
               {
                  isFilter = true;
               }
               else
               {
                  isFilter = false;
               }
               ary_temp = cDv.cMt.cG();
               for(j in ary_temp)
               {
                  if(ary_temp[j].cMass > 0)
                  {
                     isOk = false;
                     if(isFilter)
                     {
                        if(ary_temp[j].cState == 2 || ary_temp[j].cState == 4)
                        {
                           isOk = true;
                        }
                     }
                     else if(ary_temp[j].cState != 3)
                     {
                        isOk = true;
                     }
                     if(isOk)
                     {
                        iSsc = false;
                        for(i = 0; i < this.leakToObj.cDv.cMt.cStack.length; i++)
                        {
                           if(this.leakToObj.cDv.cMt.cStack[i] != null)
                           {
                              if(this.leakToObj.cDv.cMt.cStack[i].cName == ary_temp[j].cName)
                              {
                                 t1 = this.leakToObj.cDv.cMt.cStack[i].cTemp;
                                 t2 = ary_temp[j].cTemp;
                                 mm0 = ary_temp[j].cMass;
                                 mm1 = this.leakToObj.cDv.cMt.cStack[i].cMass;
                                 mm2 = ary_temp[j].cDensity * inN;
                                 this.leakToObj.cDv.cMt.cStack[i].cTemp = t1 + Math.abs((t1 - t2) / (mm1 / mm2 + 1));
                                 if(mm0 <= mm2)
                                 {
                                    ary_temp[j].cFlow(mm0 / ary_temp[j].cDensity,"cVol");
                                    this.leakToObj.cDv.cMt.cStack[i].cFlow(-mm0 / ary_temp[j].cDensity,"cVol");
                                 }
                                 else
                                 {
                                    ary_temp[j].cFlow(inN,"cVol");
                                    this.leakToObj.cDv.cMt.cStack[i].cFlow(-inN,"cVol");
                                 }
                                 iSsc = true;
                                 break;
                              }
                           }
                        }
                        if(!iSsc)
                        {
                           ary_temp[j].cFlow(inN,"cVol");
                           mass_temp = ary_temp[j].cDensity * inN;
                           mat_temp = this.leakToObj.cDv.cMt.cFather.cCreatMatter(ary_temp[j].cName,mass_temp,ary_temp[j].cTemp);
                           this.leakToObj.cDv.cMt.cAddSub(this.leakToObj.cDv.cMt.cFather.cCore[mat_temp],1);
                        }
                        if(this.iD.movLeakObj.currentFrame != ary_temp[j].cState + 1 && isFilter)
                        {
                           this.iD.movLeakObj.gotoAndStop(ary_temp[j].cState + 1);
                        }
                     }
                  }
               }
            }
            if(iPans.Ams.iN != 1)
            {
               iPans.Ams.iSet(this.leakToObj);
               iPans.Ams.iStart(2);
               iPans.Ams.iMag();
            }
            if(!this.iIsLeak)
            {
               this.iIsLeak = true;
               if(ary_temp[j].cState == 1)
               {
                  this.mSc = iLabs.mSd.inmSLeak.play(0,99);
               }
               else if(ary_temp[j].cState == 2 || ary_temp[j].cState == 4)
               {
                  this.mSc = iLabs.mSd.inmLeak.play(0,99);
               }
            }
            else
            {
               this.mSt.volume = -(this.iD.Device_1.rotation + 80) / 50 * this.iValue;
               this.mSt.pan = this.iValueX;
               this.mSc.soundTransform = this.mSt;
            }
         }
      }
      
      private function iScanMix() : *
      {
         if(this.iMove)
         {
            if(Math.abs(x - this.pastx) > this.MixDistance || Math.abs(y - this.pasty) > this.MixDistance)
            {
               ++this.mixTime;
            }
            else
            {
               this.mixTime = 0;
               this.iMix(false);
            }
            if(this.mixTime > 3)
            {
               this.iMix(true);
            }
            this.pastx = x;
            this.pasty = y;
         }
      }
      
      public function iMix(inP:Boolean) : *
      {
         cDv.cMix(inP);
      }
      
      public function doEffect(t:iSub, v:String) : void
      {
         var ifct_temp2:ColorTransform = null;
         switch(v)
         {
            case "Ele":
               if(this.iEffect != v)
               {
                  this.iD.iEffect.gotoAndStop("Ele");
                  if(this.iD.iEffect.Ele.currentFrame == 1)
                  {
                     if(this.isSmallOpen)
                     {
                        this.iD.iEffect.Ele.scaleX = 1;
                        this.iD.iEffect.Ele.scaleY = 1;
                     }
                     else
                     {
                        this.iD.iEffect.Ele.scaleX = 2;
                     }
                     this.iD.EleEffect.play();
                  }
                  this.iEffect = v;
               }
               this.iD.iEffect.alpha = 1;
               break;
            case "BB":
               if(this.iEffect != v)
               {
                  this.iD.airBubble.Start();
                  this.iEffect = v;
               }
               this.iD.iEffect.alpha = 1;
               break;
            case "E1":
               if(this.iEffect != v)
               {
                  this.iD.iEffect.gotoAndPlay(v);
                  this.iEffect = v;
                  this.mFlameStream = iLabs.mSd.inmFlame2.play(0,9999);
                  this.mFlameStream.soundTransform = new SoundTransform(this.iValue,this.iValueX);
               }
               this.iD.iEffect.alpha = 1;
               break;
            case "E2":
               if(this.iEffect != v)
               {
                  this.iD.iEffect.gotoAndPlay(v);
                  this.iEffect = v;
                  this.mFlameStream = iLabs.mSd.inmFlame2.play(0,9999);
                  this.mFlameStream.soundTransform = new SoundTransform(this.iValue,this.iValueX);
               }
               this.iD.iEffect.alpha = 1;
               break;
            case "":
               if(this.iEffect == "Glow")
               {
                  this.iD.iEffect.gotoAndPlay(32);
                  if(this.mFlameStream != null)
                  {
                     this.mFlameStream.stop();
                  }
               }
               else if(this.iEffect == "Smoke")
               {
                  this.iD.iEffect.gotoAndPlay(122);
               }
               else if(this.iEffect == "E1")
               {
                  this.iD.iEffect.gotoAndPlay(225);
                  if(this.mFlameStream != null)
                  {
                     this.mFlameStream.stop();
                  }
               }
               else if(this.iEffect == "E2")
               {
                  this.iD.iEffect.gotoAndPlay(276);
                  if(this.mFlameStream != null)
                  {
                     this.mFlameStream.stop();
                  }
               }
               this.iEffect = "";
               break;
            case "Glow":
               if(this.iEffect != v)
               {
                  this.iD.iEffect.gotoAndPlay("Glow");
                  ifct_temp2 = new ColorTransform();
                  ifct_temp2.color = t.cM.cIgnCol;
                  this.iD.iEffect.transform.colorTransform = ifct_temp2;
                  this.iD.iEffect.alpha = Math.min(1,cDv.cMt.cBurnEng / 10);
                  this.iEffect = "Glow";
                  this.mFlameStream = iLabs.mSd.inmFlame.play(0,9999);
               }
               break;
            case "Det":
               if(this.iEffect != v)
               {
                  if(this.iD.iEffect.currentFrame == 1)
                  {
                     this.iD.iEffect.gotoAndPlay("Det");
                     this.iEffect = "Det";
                  }
               }
               break;
            case "LDet":
               if(this.iEffect != v)
               {
                  if(this.iD.iEffect.currentFrame == 1)
                  {
                     this.iD.iEffect.gotoAndPlay("LDet");
                     this.iEffect = "LDet";
                  }
               }
               break;
            case "Smoke":
               if(this.iEffect != "Glow" && this.iEffect != "E1" && this.iEffect != "E2")
               {
                  if(this.iEffect != v && this.iD.iEffect.currentFrame == 1)
                  {
                     this.iD.iEffect.gotoAndPlay("Smoke");
                     this.iD.iEffect.transform.colorTransform = new ColorTransform();
                     this.iD.iEffect.alpha = 1;
                     if(t.cM.cEva > 0 && t.cM.cEva < 1)
                     {
                        this.iD.iEffect.alpha = t.cM.cEva;
                     }
                     else
                     {
                        this.iD.iEffect.alpha = 1;
                     }
                     if(t.cM.cEva > 0.5)
                     {
                        this.iD.iEffect.alpha = 2;
                     }
                     else
                     {
                        this.iD.iEffect.alpha = t.cM.cEva * 4;
                     }
                     this.iEffect = "Smoke";
                     if(this.mFlameStream != null)
                     {
                        this.mFlameStream.stop();
                     }
                  }
                  break;
               }
            case "Smoke2":
               if(this.iEffect != "Glow" && this.iEffect != "E1" && this.iEffect != "E2")
               {
                  if(this.iEffect != v)
                  {
                     this.iD.iEffect.gotoAndPlay("Smoke2");
                     this.iEffect = "Smoke2";
                     if(this.mFlameStream != null)
                     {
                        this.mFlameStream.stop();
                     }
                  }
               }
         }
      }
      
      public function getpH() : Number
      {
         return cDv.cGetpH();
      }
      
      public function iGetTemp() : Number
      {
         return cDv.cGetTemp();
      }
   }
}

