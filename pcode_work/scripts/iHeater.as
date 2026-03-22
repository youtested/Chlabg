package
{
   import fl.motion.*;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.media.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1556")]
   public class iHeater extends iBase
   {
      
      public var iD:MovieClip;
      
      public var iHitObj:MovieClip;
      
      public var iHitObj2:MovieClip;
      
      public var iShadow:MovieClip;
      
      public var movLeak:MovieClip;
      
      public var iIsIgn:Boolean;
      
      public var iUID:String;
      
      public var iHeaterType:Number = 1;
      
      public var MaxCap:Number = 800;
      
      public var iIsTube:Boolean = false;
      
      public var iIsLink:Boolean = false;
      
      public var iLinked:String = "";
      
      private var iValue:Number = 1;
      
      private var iValueX:Number = 0;
      
      private var mDrop:SoundChannel = new SoundChannel();
      
      public var shineObj:Boolean = false;
      
      public var leakToObj:iDevice;
      
      private var isLeging:Boolean = true;
      
      private var Zaxx:*;
      
      private var Zaxy:Number;
      
      private var iIsShake:Boolean = false;
      
      private var iMove:Boolean = false;
      
      public function iHeater(inStance:cHeater, inLb:*, inName:*, inHeaterType:*)
      {
         super();
         this.mouseEnabled = false;
         iName = inName;
         this.iHeaterType = inHeaterType;
         iLabs = inLb;
         cDv = inStance;
         iType = cDv.cType;
         this.iInit();
         iGenr = "Heater";
         this.iIsIgn = false;
         this.iD.mouseEnabled = false;
         this.iD.mouseChildren = false;
         this.movLeak.visible = false;
         this.iShadow.mouseEnabled = false;
         iLabs.iDvNumSet(1);
         if(this.iHeaterType == 1)
         {
            this.iD.gotoAndStop(1);
            iLabs.root["pPan"].iRollingAdd(iType);
            switch(iLoc.LG)
            {
               case "en":
                  this.iUID = "Alcohol lamp" + String(iLabs.root["pPan"].iRolling[iType]);
                  break;
               case "zh":
                  this.iUID = "酒精灯" + String(iLabs.root["pPan"].iRolling[iType]);
            }
            this.iD.Blurs.gotoAndStop(1);
            this.iShadow.gotoAndStop(1);
            this.MaxCap = 500;
         }
         else if(this.iHeaterType == 2)
         {
            this.iD.gotoAndStop(3);
            iLabs.root["pPan"].iRollingAdd(iType);
            switch(iLoc.LG)
            {
               case "en":
                  this.iUID = "Busen burner" + String(iLabs.root["pPan"].iRolling[iType]);
                  break;
               case "zh":
                  this.iUID = "酒精喷灯" + String(iLabs.root["pPan"].iRolling[iType]);
            }
            this.iShadow.gotoAndStop(2);
            this.iD.Blurs.gotoAndStop(2);
            this.MaxCap = 1000;
         }
      }
      
      public function iSetDown() : void
      {
         iFirst = false;
         this.iProgZax();
         this.changeScale();
      }
      
      private function changeScale(ys:Number = -999) : void
      {
         var zy:Number = y;
         if(ys != -999)
         {
            zy = ys;
         }
         var _scale:Number = (y - 274) / (768 - 274) * 0.4 + 0.7;
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
         this.iD.scaleX = _scale;
         this.iD.scaleY = _scale;
         this.iValueX = (x - 512) / 512;
         this.iValue = _scale;
         var bx:Number = 0;
         if(_scale < 0.9)
         {
            bx = (0.9 - _scale) * 4;
            this.iD.alpha = (_scale + 0.1) * 0.8;
         }
         else
         {
            bx = 0;
         }
         this.iD.Blurs.alpha = bx;
         this.iD.Device.alpha = 1 - bx;
         this.iD.transform.colorTransform = color;
         this.iShadow.scaleX = _scale;
         this.iShadow.scaleY = _scale;
      }
      
      public function iDelete(f:Boolean = false) : *
      {
         if(iLink != null)
         {
            this.iIsLink = false;
            iLink.iDisLink(this);
            iLink = null;
         }
         iLabs.myReport.NewAction(ActionType.DELETE,this.iUID);
         iLabs.iDvNumSet(-1);
         iLabs.iSelected = null;
         iLife = false;
         iLabs.iRemove(this);
         if(f)
         {
            iLabs.mSd.inmDelete.play();
         }
      }
      
      public function iInit() : *
      {
         this.iHitObj.addEventListener(MouseEvent.MOUSE_DOWN,this.startDrag_Press);
      }
      
      private function iRaise() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.RaiseDown);
         addEventListener(Event.ENTER_FRAME,this.RaiseUp);
      }
      
      private function iDrop() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.RaiseUp);
         addEventListener(Event.ENTER_FRAME,this.RaiseDown);
         if(!this.iIsLink && Boolean(this.iMove))
         {
            this.mDrop = iLabs.mSd.inmDropHeater.play();
            this.mDrop.soundTransform = new SoundTransform(this.iValue,this.iValueX);
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
      
      public function iProg() : *
      {
         if(iLife)
         {
            this.iProgZax();
            this.iProgShine();
            if(this.iIsIgn)
            {
               this.iHeatDv();
            }
         }
      }
      
      public function ref(yz:Number) : void
      {
         this.iD.x = 0;
         this.iD.y = 0;
         this.iShadow.y = -9;
         this.iShadow.x = 0;
         this.changeScale(yz);
      }
      
      private function iProgZax() : void
      {
         var d:Number = Math.round(y / 34);
         this.Zaxx = -Math.pow(1.2,d) * iLabs.rollingX;
         this.Zaxy = Math.pow(1.2,d) * iLabs.rollingY;
         if(!this.iIsLink && !this.isLeging)
         {
            this.iD.x = this.Zaxx;
            this.iD.y = this.Zaxy;
         }
         this.iShadow.y = this.Zaxy - 9;
         this.iShadow.x = this.Zaxx;
      }
      
      public function iShake(n:*) : *
      {
         this.iIsShake = n;
      }
      
      private function iProgMove() : void
      {
         if(!this.iIsShake)
         {
         }
      }
      
      private function iProgShine() : void
      {
      }
      
      public function startDrag_Press(e:*) : void
      {
         this.iDrag();
      }
      
      public function iDoIgn(inB:*) : *
      {
         var sign:SoundChannel = null;
         if(!this.iIsIgn && Boolean(inB))
         {
            iLabs.myReport.NewAction(ActionType.IGNITE,this.iUID);
            sign = iLabs.mSd.inmIgn.play();
            sign.soundTransform = new SoundTransform(0.4);
            if(this.iHeaterType == 1)
            {
               this.iD.gotoAndStop(2);
               this.iD.Blurs.gotoAndStop(1);
            }
            else if(this.iHeaterType == 2)
            {
               this.iD.gotoAndStop(4);
               this.iD.Blurs.gotoAndStop(2);
            }
            this.iD.iFire.mouseEnabled = false;
            this.iD.iFire.mouseChildren = false;
            iLabs.mSd.inmIgn.play();
         }
         else if(this.iIsIgn && !inB)
         {
            iLabs.myReport.NewAction(ActionType.DISIGNITE,this.iUID);
            if(this.iHeaterType == 1)
            {
               this.iD.gotoAndStop(1);
               this.iD.Blurs.gotoAndStop(1);
            }
            else if(this.iHeaterType == 2)
            {
               this.iD.gotoAndStop(3);
               this.iD.Blurs.gotoAndStop(2);
            }
         }
         this.iIsIgn = inB;
      }
      
      public function iDoIgn2() : void
      {
         if(this.iHeaterType == 1)
         {
            this.iD.gotoAndStop(2);
            this.iD.Blurs.gotoAndStop(1);
         }
         else if(this.iHeaterType == 2)
         {
            this.iD.gotoAndStop(4);
            this.iD.Blurs.gotoAndStop(2);
         }
         this.iD.iFire.mouseEnabled = false;
         this.iD.iFire.mouseChildren = false;
         this.iIsIgn = true;
      }
      
      public function stopDrag_Release(e:*) : void
      {
         this.iStopDrag();
      }
      
      public function iHeatDv() : *
      {
         var dis:Number = NaN;
         var iHt:Number = NaN;
         if(this.leakToObj != null)
         {
            dis = y - this.leakToObj.y - 163;
            iHt = Math.round(this.MaxCap * Math.exp(-dis * dis / 30000));
            this.leakToObj.cDv.cHeat(iHt);
         }
      }
      
      private function stopDrag_Move(e:*) : void
      {
         if(!this.iMove)
         {
            iLabs.iSelected = null;
            startDrag(false);
            this.iRaise();
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
         }
         this.iD.x = this.Zaxx;
         this.iMove = true;
         this.changeScale();
      }
      
      public function iDrag() : *
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDrag_Release);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.stopDrag_Move);
         px = x;
         py = y;
         this.iShake(true);
         iLabs.iDrag = true;
         if(iLabs.iSelected == this)
         {
            iLabs.iSelected = null;
         }
         if(iLink != null)
         {
            this.iIsLink = false;
            iLink.iDisLink(this);
            iLink = null;
         }
      }
      
      public function iTestHit() : void
      {
         var st:* = iLabs.iHitForHeater(this);
         if(st != null)
         {
            iLabs.iLink(st,this,1);
         }
      }
      
      public function iStopDrag() : *
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDrag_Release);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.stopDrag_Move);
         this.iShake(false);
         if(this.iMove)
         {
            this.iDrop();
         }
         stopDrag();
         this.iShadow.visible = true;
         this.iD.alpha = 1;
         iLabs.iSortDepth();
         if(iFirst)
         {
            root["pPan"].iReset();
            if(y < 300)
            {
               this.iDelete(true);
               return;
            }
            this.mDrop = iLabs.mSd.inmDropHeater.play();
            this.mDrop.soundTransform = new SoundTransform(this.iValue,this.iValueX);
         }
         else if(!this.iMove)
         {
            iLabs.iSelected = this;
         }
         iLabs.iDrag = false;
         this.iTestHit();
         if(iFirst)
         {
            iFirst = false;
         }
         this.iMove = false;
         if(y > 768 || y < 0)
         {
            this.iDelete();
         }
      }
   }
}

