package
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.ui.*;
   
   public class iSpoon extends iBase
   {
      
      public static var iSignAll:Number = 0;
      
      public var Btn:MovieClip;
      
      public var TB:MovieClip;
      
      public var TapHit:MovieClip;
      
      public var iD:MovieClip;
      
      public var iExp:MovieClip;
      
      private var iLb:iLabel;
      
      public var iSign:Number;
      
      private var iIsTap:Boolean = false;
      
      private var iTapTime:Number = 0;
      
      private var iTapMt:Number = 1;
      
      public function iSpoon(inStance:cDevice, inLb:*, inName:*)
      {
         super();
         iName = inName;
         ++iSignAll;
         this.iSign = iSignAll;
         iLabs = inLb;
         cDv = inStance;
         iType = cDv.cType;
         this.iLb = new iLabel(this);
         this.iLb.y = -160;
         this.iLb.x = -55;
         this.buttonMode = true;
         addChild(this.iLb);
         this.iInit();
         this.iTapTime = 0;
         this.iTapMt = 1;
         this.TB.visible = false;
      }
      
      public function iInit() : *
      {
         Multitouch.inputMode = MultitouchInputMode.GESTURE;
         this.addEventListener(TransformGestureEvent.GESTURE_ROTATE,this.iRotate);
         this.Btn.addEventListener(MouseEvent.MOUSE_DOWN,this.iGoStep);
         this.Btn.addEventListener(MouseEvent.MOUSE_UP,this.iDoStep);
      }
      
      public function iProg() : *
      {
         if(iLife)
         {
            if(visible != iLabs.iShowDevice)
            {
               visible = iLabs.iShowDevice;
            }
            this.iLb.iProg();
            this.iProgLabel();
            this.iProgTB();
         }
      }
      
      private function iProgTB() : *
      {
         if(!this.TB.visible && cDv.cMt.cGetTotalMVol() > 0)
         {
            this.TB.visible = true;
         }
         if(this.TB.visible && cDv.cMt.cGetTotalMVol() <= 0)
         {
            this.TB.visible = false;
         }
      }
      
      private function iProgLabel() : *
      {
      }
      
      public function iGoStep(e:*) : *
      {
         this.iDrag();
      }
      
      public function iDoStep(e:*) : *
      {
         this.iStopDrag();
      }
      
      public function startDrag_Press(e:*) : void
      {
         this.iDrag();
      }
      
      public function stopDrag_Release(e:*) : void
      {
         this.iStopDrag();
      }
      
      public function iDrag() : *
      {
         startDrag(false);
         iLabs.iDrag = true;
      }
      
      public function iRotate(evt:TransformGestureEvent) : void
      {
         if(evt.phase == GesturePhase.BEGIN)
         {
            this.iStopDrag();
         }
         var p:* = this.iD.rotation;
         var v:* = evt.rotation;
         this.iD.rotation += v * 1.3;
         if(this.iD.rotation < -30)
         {
            this.iD.rotation = -30;
         }
         else if(this.iD.rotation > 90)
         {
            this.iD.rotation = 90;
         }
         this.TB.TV.height = cDv.cMt.cGetTotalMVol() / 5 * 180;
         if(v > 0)
         {
            if(cDv.cMt.cGetTotalMVol() < 5)
            {
               this.iTapTime = v / 30;
               this.iTrySuck();
            }
         }
         else if(v < 0)
         {
            if(cDv.cMt.cGetTotalMVol() > 0)
            {
               this.iTapTime = -v / 30;
               this.iTryLeak();
            }
         }
      }
      
      public function iStopDrag() : *
      {
         iLabs.iSortDepth();
         stopDrag();
         iFirst = true;
         iLabs.iDrag = false;
         if(!iLabs.iHitDsk(this))
         {
            cDv.cMt.cFather.cRemove2(cDv.cName);
            iLabs.iRemove(this);
            iLife = false;
         }
      }
      
      public function iTrySuck() : *
      {
         var i:* = undefined;
         var ary_temp:* = undefined;
         var j:* = undefined;
         var mat_temp:* = undefined;
         for(i in iLabs.iBox)
         {
            if(iLabs.iBox[i] != null && iLabs.iBox[i].iGenr == "Container")
            {
               if(iLabs.iBox[i].iD.iHitObj.hitTestObject(this.TapHit))
               {
                  ary_temp = iLabs.iBox[i].cDv.cMt.cStack;
                  for(j in ary_temp)
                  {
                     if(ary_temp[j].cState == 1)
                     {
                        iLabs.iBox[i].cDv.cMt.cStack[j].cMass -= this.iTapTime;
                        mat_temp = cDv.cMt.cFather.cCreatMatter(ary_temp[j].cName,this.iTapTime,ary_temp[j].cTemp);
                        cDv.cMt.cAddSub(cDv.cMt.cFather.cCore[mat_temp],1);
                     }
                  }
                  break;
               }
            }
         }
      }
      
      public function iSpread(inN:*, inC:*, inS:*) : *
      {
      }
      
      public function iTryLeak() : *
      {
         var i:* = undefined;
         var ary_temp:* = undefined;
         var j:* = undefined;
         var mat_temp:* = undefined;
         var ary_temp4:* = undefined;
         var k:* = undefined;
         var iSsc:Boolean = false;
         for(i in iLabs.iBox)
         {
            if(iLabs.iBox[i] != null && iLabs.iBox[i].iType != "SteelStand" && iLabs.iBox[i].iType != "Spoon" && iLabs.iBox[i].iType != "Dropper" && iLabs.iBox[i].iType != "Heater")
            {
               if(iLabs.iBox[i].iD.iHitObj.hitTestObject(this.TapHit))
               {
                  ary_temp = cDv.cMt.cStack;
                  for(j in ary_temp)
                  {
                     iSsc = true;
                     cDv.cMt.cStack[j].cMass -= ary_temp[j].cMass * this.iTapTime;
                     mat_temp = iLabs.iBox[i].cDv.cMt.cFather.cCreatMatter(ary_temp[j].cName,ary_temp[j].cMass * this.iTapTime,ary_temp[j].cTemp);
                     iLabs.iBox[i].cDv.cMt.cAddSub(iLabs.iBox[i].cDv.cMt.cFather.cCore[mat_temp],1);
                  }
                  if(iLabs.iBox[i].iType == "Mc")
                  {
                     iLabs.iMagOn(iLabs.iBox[i]);
                  }
               }
            }
         }
         if(!iSsc)
         {
            ary_temp4 = cDv.cMt.cStack;
            for(k in ary_temp4)
            {
               cDv.cMt.cStack[k].cMass -= ary_temp4[k].cMass * this.iTapTime;
               this.iSpread(ary_temp4[k].cMass * this.iTapTime,ary_temp4[k].cColor,ary_temp4[k].cState);
            }
         }
      }
   }
}

