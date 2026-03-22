package
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol338")]
   public class iSub extends MovieClip
   {
      
      public var Sub:MovieClip;
      
      public var cM:cMatter;
      
      public var iCtn:*;
      
      public var iLife:Boolean;
      
      public var iName:String;
      
      public var iPreState:Number = 0;
      
      public var iFlag:Boolean;
      
      public var iIsIgn:Boolean;
      
      public var iIsShow:Boolean;
      
      public var iWdth:Number;
      
      public var iF:iFire = new iFire();
      
      public var mSd:Object = new Object();
      
      private var realSize:Number = 0;
      
      private var isAdding:Boolean = false;
      
      private var last_vol:Number;
      
      public function iSub(inS1:cMatter, inCtn:MovieClip)
      {
         super();
         addFrameScript(0,this.frame1);
         this.cM = inS1;
         this.iCtn = inCtn;
         this.iLife = true;
         this.iFlag = false;
         this.iIsIgn = false;
         this.iIsShow = false;
         this.iRefresh();
         if(this.iCtn.iType == "TT")
         {
            this.iWdth = 40;
         }
         else
         {
            this.iWdth = 94.55;
         }
      }
      
      public function iClear() : void
      {
      }
      
      public function iGetHt(n:Number) : *
      {
         if(this.iLife)
         {
            if(this.cM.cState == 2 || this.cM.cState == 1 || this.cM.cState == 4)
            {
               if(n == 2)
               {
                  return this.Sub.SubMuch.bac1.height;
               }
               return this.Sub.SubMuch.bac1.height / 2;
            }
            return 0;
         }
         return 0;
      }
      
      public function iSweep() : void
      {
         this.iScanLife();
      }
      
      public function iScanLife() : void
      {
         if(this.iLife)
         {
            if(!this.cM.cLife)
            {
               if(this.contains(this.iF))
               {
                  this.iCtn.doEffect(this,"");
                  this.iIsIgn = false;
                  removeChild(this.iF);
               }
               removeEventListener(Event.ENTER_FRAME,this.Colorchange);
               this.iLife = false;
               gotoAndStop(1);
               this.iCtn.iRemove(this.iName);
            }
         }
      }
      
      public function iRemove() : void
      {
         if(this.contains(this.iF))
         {
            this.iCtn.doEffect(this,"");
            this.iIsIgn = false;
            removeChild(this.iF);
         }
         this.iLife = false;
         gotoAndStop(1);
         this.iCtn.iRemove(this.iName);
      }
      
      public function iRefresh() : *
      {
         var wata_temp:Number = NaN;
         this.iScanLife();
         if(this.iLife)
         {
            if(this.contains(this.iF))
            {
               this.iF.iProg();
            }
            if(this.iPreState != this.cM.cState)
            {
               this.iShow();
               this.iPreState = this.cM.cState;
            }
            switch(this.cM.cState)
            {
               case 1:
                  this.DoIf();
                  this.DoSize();
                  this.DoSurf2();
                  this.DoMist();
                  break;
               case 2:
                  this.DoBubble();
                  this.DoSize();
                  this.DoSurf();
                  this.DoEva();
                  break;
               case 3:
                  this.DoIf();
                  break;
               case 4:
                  this.DoBubble();
                  this.DoPrec();
                  this.DoSize();
                  this.DoSurf();
                   if(this.cM.cG.cGetWater() != null)
                   {
                      wata_temp = Number(this.cM.cG.cGetWater().cVol);
                      if(wata_temp > 0 && this.cM.cVol / wata_temp < this.cM.cSolu / 100)
                      {
                         this.Sub.SubColor.alpha = this.cM.cAlp4 * (this.cM.cVol / wata_temp / (this.cM.cSolu / 100));
                      }
                      else
                      {
                         this.Sub.SubColor.alpha = this.cM.cAlp4;
                      }
                   }
            }
            if(!cacheAsBitmap)
            {
               cacheAsBitmap = true;
            }
         }
      }
      
      private function DoEva() : void
      {
         if(this.cM.cEva > 0)
         {
            this.iCtn.doEffect(this,"Smoke");
            this.cM.cEva = 0;
         }
         else
         {
            this.iCtn.doEffect(this,"");
         }
      }
      
      private function newevt(e:Event) : void
      {
         var vol_temp:Number = NaN;
         this.isAdding = true;
         if(this.cM.cState == 4)
         {
            if(this.iCtn.cDv.cMt.cGetWater() != null)
            {
               vol_temp = Number(this.iCtn.cDv.cMt.cGetWater().cVol);
            }
            else
            {
               vol_temp = this.cM.cVol;
            }
         }
         else
         {
            vol_temp = this.cM.cVol;
         }
         if(this.realSize < vol_temp)
         {
            this.realSize += (vol_temp + 5 - this.realSize) * 0.3;
         }
         else
         {
            this.realSize = vol_temp;
            this.last_vol = vol_temp;
            this.isAdding = false;
            removeEventListener(Event.ENTER_FRAME,this.newevt);
         }
         this.iRefresh();
      }
      
      private function DoSize() : void
      {
         var vol_temp:* = undefined;
         var vol_temp2:Number = NaN;
         var wd:Number = NaN;
         var max_vol:Number = Number(this.iCtn.cDv.cVol);
         if(this.cM.cState == 4)
         {
            if(this.iCtn.cDv.cMt.cGetWater() != null)
            {
               vol_temp2 = Number(this.iCtn.cDv.cMt.cGetWater().cVol);
            }
            else
            {
               vol_temp2 = this.cM.cVol;
            }
         }
         else
         {
            vol_temp2 = this.cM.cVol;
         }
         if(this.cM.cNew)
         {
            this.isAdding = true;
            addEventListener(Event.ENTER_FRAME,this.newevt);
            this.cM.cNew = false;
         }
         else if(vol_temp2 - this.last_vol > 10 && !this.isAdding)
         {
            this.realSize = this.last_vol;
            this.isAdding = true;
            addEventListener(Event.ENTER_FRAME,this.newevt);
         }
         if(this.isAdding)
         {
            vol_temp = this.realSize;
         }
         else
         {
            if(this.cM.cState == 4)
            {
               if(this.iCtn.cDv.cMt.cGetWater() != null)
               {
                  vol_temp = this.iCtn.cDv.cMt.cGetWater().cVol;
               }
               else
               {
                  vol_temp = this.cM.cVol;
               }
            }
            else
            {
               vol_temp = this.cM.cVol;
            }
            this.last_vol = vol_temp;
         }
         this.Sub.SubMuch.bac1.height = Math.round(vol_temp / max_vol * 85);
         this.Sub.SubMuch.bac1.y = this.Sub.SubMuch.bac3.y - this.Sub.SubMuch.bac3.height;
         this.Sub.SubMuch.bac2.y = this.Sub.SubMuch.bac1.y - this.Sub.SubMuch.bac1.height;
         if(this.iCtn.iD.Device_1.rotation > -60)
         {
            wd = this.iWdth / Math.cos(this.iCtn.iD.Device_1.rotation / 180 * Math.PI);
         }
         else
         {
            wd = this.iWdth * 2;
         }
         this.Sub.SubMuch.bac2.width = wd;
         this.Sub.SubMuch.bac3.width = this.Sub.SubMuch.bac2.width;
         this.Sub.SubMuch.bac1.width = this.Sub.SubMuch.bac2.width;
      }
      
      private function DoSurf() : void
      {
         if(this.cM.cIsSurf)
         {
            this.Sub.SubSurface.visible = true;
            this.Sub.SubSurface.y = -this.Sub.SubMuch.bac1.height;
            if(this.iCtn.iType != "TT")
            {
               this.Sub.SubSurface.scaleX = 1;
               this.Sub.SubSurface.scaleY = 1;
               this.Sub.SubSurface.width = this.Sub.SubMuch.bac2.width;
            }
            else
            {
               this.Sub.SubSurface.scaleX = 0.3;
               this.Sub.SubSurface.scaleY = 0.3;
               this.Sub.SubSurface.y = -this.Sub.SubMuch.bac1.height - 14;
            }
         }
         else
         {
            this.Sub.SubSurface.visible = false;
         }
      }
      
      private function DoSurf2() : void
      {
         this.Sub.SubSurface.visible = true;
         this.Sub.SubSurface.y = -this.Sub.SubMuch.bac1.height;
         if(this.iCtn.iType != "TT")
         {
            this.Sub.SubSurface.scaleX = 1;
            this.Sub.SubSurface.scaleY = 1;
            this.Sub.SubSurface.width = this.Sub.SubMuch.bac2.width;
         }
         else
         {
            this.Sub.SubSurface.scaleX = 0.3;
            this.Sub.SubSurface.scaleY = 0.3;
            this.Sub.SubSurface.y = -this.Sub.SubMuch.bac1.height - 14;
         }
      }
      
      private function DoBubble() : void
      {
         if(this.cM.cMix)
         {
            this.Sub.Bubble.gotoAndStop(2);
            this.Sub.Bubble.visible = true;
            this.Sub.Bubble.alpha = 1;
            this.cM.cMix = false;
         }
         else if(this.cM.cBubbleD)
         {
            this.Sub.Bubble.gotoAndStop(1);
            this.Sub.Bubble.visible = true;
            this.Sub.Bubble.alpha = 1;
            this.cM.cBubbleD = false;
         }
         else
         {
            this.Sub.Bubble.gotoAndStop(1);
            this.Sub.Bubble.visible = false;
         }
         if(this.Sub.Bubble.alpha <= 0 && Boolean(this.Sub.Bubble.visible))
         {
            this.Sub.Bubble.visible = false;
         }
         else
         {
            this.Sub.Bubble.alpha -= 0.01;
         }
      }
      
      private function DoPrec() : void
      {
         var ct_temp5:ColorTransform = null;
         if(this.cM.cPrec)
         {
            this.Sub.movPre.gotoAndStop(2);
            this.Sub.movPre.visible = true;
            this.cM.cPrec = false;
            ct_temp5 = new ColorTransform();
            ct_temp5.color = this.cM.cPrecColor;
            this.Sub.movPre.transform.colorTransform = ct_temp5;
         }
      }
      
      private function DoMist() : void
      {
         var ct_temp5:ColorTransform = null;
         if(this.cM.cMist)
         {
            trace("Mist");
            this.Sub.movMist.gotoAndPlay(2);
            this.Sub.movMist.visible = true;
            this.cM.cMist = false;
            ct_temp5 = new ColorTransform();
            ct_temp5.color = this.cM.cMistColor;
            this.Sub.movMist.transform.colorTransform = ct_temp5;
         }
      }
      
      private function DoIf() : void
      {
         var ifct_temp2:ColorTransform = null;
         if(this.cM.cIsIgn && this.cM.cLife)
         {
            if(this.iCtn.iLabs.cDm.sIgn)
            {
               this.iIsIgn = true;
               this.iF = new iFire();
               this.iCtn.doEffect(this,"Glow");
               ifct_temp2 = new ColorTransform();
               ifct_temp2.color = this.cM.cIgnCol;
               this.iF.transform.colorTransform = ifct_temp2;
               if(this.cM.cIgnAlp < 1)
               {
                  this.iF.alpha = this.cM.cIgnAlp;
               }
               else
               {
                  this.iF.alpha = 1;
               }
               this.iF.scaleY = 0.5;
               addChild(this.iF);
               this.cM.cIsIgn = false;
            }
         }
         else if(this.iF != null)
         {
            if(this.contains(this.iF))
            {
               this.iCtn.doEffect(this,"");
               this.iIsIgn = false;
               removeChild(this.iF);
            }
         }
      }
      
      private function Colorchange(e:*) : void
      {
         if(this.Sub == null)
         {
            removeEventListener(Event.ENTER_FRAME,this.Colorchange);
         }
         else if(this.Sub.alpha < 1)
         {
            if(this.cM.cMix)
            {
               this.Sub.alpha += 0.03;
            }
            else if(this.cM.cState == 4)
            {
               this.Sub.alpha += 0.006;
            }
            else
            {
               this.Sub.alpha += 0.04;
            }
         }
         else
         {
            this.Sub.alpha = 1;
            removeEventListener(Event.ENTER_FRAME,this.Colorchange);
         }
      }
      
      public function iShow() : *
      {
         var _color:Number = NaN;
         var ct_temp:ColorTransform = null;
         var ct_temp2:ColorTransform = null;
         var ct_temp5:ColorTransform = null;
         var ct_temp3:ColorTransform = null;
         if(this.iLife)
         {
            _color = this.cM.cColor;
            if(this.cM.cState == 2)
            {
               if(this.currentFrame != 3)
               {
                  this.gotoAndStop(3);
                  this.Sub.Bubble.alpha = 0;
                  this.Sub.SubPtn.gotoAndStop(this.cM.cPtn2);
                  this.Sub.SubPtn.alpha = this.cM.cAlp2;
               }
               ct_temp = new ColorTransform();
               ct_temp.color = _color;
               this.Sub.SubColor.transform.colorTransform = ct_temp;
               if(this.cM.cAlp2 != 1)
               {
                  this.Sub.SubColor.alpha = this.cM.cAlp2;
               }
               else
               {
                  this.Sub.SubColor.alpha = this.cM.cAlp;
               }
            }
            else if(this.cM.cState == 1)
            {
               if(this.currentFrame != 2)
               {
                  this.gotoAndStop(2);
                  if(!this.cM.cNew)
                  {
                     this.Sub.alpha = 0;
                     addEventListener(Event.ENTER_FRAME,this.Colorchange);
                  }
                  this.Sub.SubPt.gotoAndStop(this.cM.cPtn1);
               }
               ct_temp2 = new ColorTransform();
               ct_temp2.color = _color;
               this.Sub.SubColor.transform.colorTransform = ct_temp2;
               this.Sub.SubColor.alpha = this.cM.cAlp;
            }
            else if(this.cM.cState == 3)
            {
               if(this.currentFrame != 4)
               {
                  this.gotoAndStop(4);
                  addEventListener(Event.ENTER_FRAME,this.Colorchange);
                  this.Sub.alpha = 0;
               }
               if(_color != 16777215)
               {
                  ct_temp5 = new ColorTransform();
                  ct_temp5.color = this.cM.cColor;
                  this.Sub.SubColor.transform.colorTransform = ct_temp5;
                  this.Sub.SubColor.alpha = 0.2;
               }
               else
               {
                  this.Sub.SubColor.alpha = 0;
               }
            }
            else if(this.cM.cState == 4)
            {
               if(this.currentFrame != 3)
               {
                  this.gotoAndStop(3);
                  this.Sub.Bubble.alpha = 0;
                  addEventListener(Event.ENTER_FRAME,this.Colorchange);
                  this.Sub.alpha = 0;
               }
               ct_temp3 = new ColorTransform();
               ct_temp3.color = this.cM.cSoluColor;
               this.Sub.SubColor.transform.colorTransform = ct_temp3;
            }
         }
         else if(this.currentFrame != 1)
         {
            this.gotoAndStop(1);
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

