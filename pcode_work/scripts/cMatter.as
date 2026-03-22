package
{
   import flash.media.SoundChannel;
   import flash.utils.Dictionary;
   
   public class cMatter extends Dictionary
   {
      
      private static var cDatabase:cDb;
      
      public var cLife:Boolean;
      
      public var cNew:Boolean = false;
      
      public var cG:cGroup;
      
      public var cEff:Number = 0;
      
      public var cIsSurf:Boolean;
      
      public var cFather:cDomain;
      
      public var cRName:String = new String();
      
      public var cName:String = new String();
      
      public var cNumber:Number = new Number();
      
      public var cSign:String = new String();
      
      public var cMm:Number = new Number();
      
      public var cMol:Number = 0;
      
      public var cKH:Number = 0;
      
      public var cKOH:Number = 0;
      
      public var cMH:Number = 0;
      
      public var cMOH:Number = 0;
      
      public var cMolar:Number = 0;
      
      public var cPower:Number = new Number();
      
      public var cEva:Number = 0;
      
      public var cMass:Number = new Number();
      
      public var cVol:Number = new Number();
      
      public var cBp:Number = new Number();
      
      public var cMp:Number = new Number();
      
      public var cDensity:Number = new Number();
      
      public var cSolu:Number = new Number();
      
      public var cIsSolu:Boolean = new Boolean(false);
      
      public var cTemp:Number = new Number();
      
      public var cDisHeat:Number = new Number();
      
      public var cH_R:Number = new Number(0.001);
      
      public var cH_C:Number = new Number();
      
      public var cState:Number = new Number();
      
      public var cStateInit:Number = new Number();
      
      public var cColor:Number = new Number();
      
      public var cSoluColor:Number = new Number();
      
      public var cPtn1:Number = 1;
      
      public var cPtn2:Number = 1;
      
      public var cAlp:Number = new Number();
      
      public var cAlp2:Number = 1;
      
      public var cAlp4:Number = new Number();
      
      public var cDepth:Number = new Number();
      
      public var cAppx:Number = 1e-7;
      
      public var cBubbleT:Number;
      
      public var cPrec:Boolean;
      
      public var cPrecColor:Number;
      
      public var cMist:Boolean;
      
      public var cMistColor:Number;
      
      public var cBubbleD:Boolean;
      
      public var cSmokeD:Boolean;
      
      public var cIsMix:Boolean;
      
      public var cIsIgn:Boolean;
      
      public var cIgnAlp:Number;
      
      public var cIgnCol:Number;
      
      private var inBoil1K:SoundChannel;
      
      public var cMix:Boolean = false;
      
      public function cMatter(inName:String, inMass:Number, inTemp:Number, inDm:cDomain)
      {
         super();
         cDatabase = inDm.cDbs;
         this.cInit(inName,inMass,inTemp);
         this.cFather = inDm;
      }
      
      public function Dispose() : void
      {
         this.cG.cFather.cRemove(this.cName + "_" + this.cSign);
      }
      
      public function cInit(inName:String, inMass:Number, inTemp:Number) : void
      {
         this.cIsMix = false;
         this.cState = 0;
         this.cBubbleT = 0;
         this.cBubbleD = false;
         this.cPrec = false;
         this.cIsIgn = false;
         this.cIgnAlp = 0;
         this.cIgnCol = 0;
         this.cStateInit = 0;
         this.cName = inName;
         this.cMass = inMass;
         this.cTemp = inTemp;
         this.cLife = true;
         this.cIsSurf = false;
         cDatabase.cRead(this,1);
         this.cInitState();
         cDatabase.cRead(this,2);
         this.cVol = this.cMass / this.cDensity;
      }
      
      public function cAllReturn() : String
      {
         return this.cName + "_" + this.cState;
      }
      
      public function cSignReturn() : String
      {
         return this.cSign;
      }
      
      public function cDoPrec(iN:Boolean, color:Number) : void
      {
         this.cPrec = iN;
         this.cPrecColor = color;
      }
      
      public function cDoMist(iN:Boolean, color:Number) : void
      {
         this.cMist = iN;
         this.cMistColor = color;
      }
      
      public function cBeBubble(iN:Number) : void
      {
         if(iN * 1000 <= 1)
         {
            this.cBubbleT = iN * 1000;
         }
         else
         {
            this.cBubbleT = 1;
         }
      }
      
      public function cDoBubble(iN:Boolean) : void
      {
         this.cBubbleD = iN;
      }
      
      public function cDie() : void
      {
         this.cMass = 0;
         this.cLife = false;
      }
      
      public function cPreFlow(m:*, inObj:*, inS2:*) : void
      {
         var mass:Number = NaN;
         var rd_temp:* = undefined;
         var rd_temp2:* = undefined;
         var op_eng:* = undefined;
         var rd_temp3:* = undefined;
         var inM2:* = undefined;
         var inM:* = m * this.cFather.cSpeed;
         this.cEva = inM * this.cFather.cSpeed;
         if(inObj == "cEng")
         {
            mass = this.cMass;
            if(this.cMass < 0.1)
            {
               mass = 0.1;
            }
            rd_temp = 1000 * inM / (mass * this.cH_C);
            rd_temp2 = 1000 * inM / (inS2.cMass * inS2.cH_C);
            if(inM > 0)
            {
               if(this.cTemp + rd_temp > inS2.cTemp + rd_temp2)
               {
                  op_eng = (inS2.cTemp - this.cTemp) / 1000 * (mass * this.cH_C * inS2.cMass * inS2.cH_C) / (mass * this.cH_C + inS2.cMass * inS2.cH_C);
               }
               else
               {
                  op_eng = inM;
               }
            }
            else if(this.cTemp + rd_temp < inS2.cTemp + rd_temp2)
            {
               op_eng = (inS2.cTemp - this.cTemp) / 1000 * (mass * this.cH_C * inS2.cMass * inS2.cH_C) / (mass * this.cH_C + inS2.cMass * inS2.cH_C);
            }
            else
            {
               op_eng = inM;
            }
            this.cFlow(op_eng,"cEng");
         }
         if(inObj == "cHeat")
         {
            if(this.cMass < 1)
            {
               mass = 1;
            }
            if(this.cState == 3)
            {
               inM2 = inM * 10;
               rd_temp3 = 1000 * inM2 / (mass * this.cH_C);
            }
            else
            {
               inM2 = inM;
               rd_temp3 = 1000 * inM / (mass * this.cH_C);
            }
            this.cEva = inM2;
            if(inM > 0)
            {
               if(this.cTemp + rd_temp3 > inS2)
               {
                  this.cTemp = inS2;
               }
               else
               {
                  this.cFlow(inM2,"cEng");
               }
            }
            else if(this.cTemp + rd_temp3 < inS2)
            {
               this.cTemp = inS2;
            }
            else
            {
               this.cFlow(inM2,"cEng");
            }
         }
      }
      
      public function cFlow(inM:*, inObj:*) : void
      {
         var rd_temp:* = undefined;
         var mass:Number = NaN;
         if(this.cLife)
         {
            if(inObj == "cMass")
            {
               rd_temp = inM * this.cMm / 1000;
               this.cMass += rd_temp;
            }
            else if(inObj == "cVol")
            {
               rd_temp = inM * this.cDensity;
               if(this.cMass - rd_temp >= 0)
               {
                  this.cMass -= rd_temp;
               }
               else
               {
                  this.cMass = 0;
               }
            }
            else if(inObj == "cVoltoMass")
            {
               rd_temp = inM * this.cDensity;
               this.cMass = rd_temp;
            }
            else if(inObj == "cEng")
            {
               mass = this.cMass;
               if(this.cMass < 1)
               {
                  mass = 1;
               }
               this.cPower = inM;
               rd_temp = 1000 * inM / (mass * this.cH_C);
               if(this.cState == 2)
               {
                  if(this.cPower > 0.1)
                  {
                     this.cEvp(this.cPower / 1000);
                  }
               }
               this.cTemp += rd_temp;
            }
            else
            {
               this[inObj] = inM;
               this.cInitState();
            }
         }
         this.cReAtt();
      }
      
      public function cExist(inG:cGroup) : void
      {
         this.cG = inG;
         this.cScanLife();
         this.cSetState();
         this.cReAtt();
         this.cAppx = this.cFather.sFilter;
         this.cMix = inG.cIsMix;
         if(this.cState == 4)
         {
            this.cMol = this.cMass / this.cMm / (this.cG.cGetSolVol() / 1000);
         }
         this.cMolar = this.cMass / this.cMm;
         if(this.cTemp < -273)
         {
            this.cTemp = -273;
         }
      }
      
      private function cReAtt() : void
      {
         cDatabase.cRead(this,2);
         this.cVol = this.cMass / this.cDensity;
      }
      
      public function cInitState() : void
      {
         if(this.cTemp > this.cBp)
         {
            this.cState = 3;
            this.cStateInit = 3;
         }
         else if(this.cTemp > this.cMp && this.cTemp < this.cBp)
         {
            this.cState = 2;
            this.cStateInit = 2;
         }
         else if(this.cTemp < this.cMp)
         {
            this.cState = 1;
            this.cStateInit = 1;
         }
         if(this.cIsSolu)
         {
            this.cState = 4;
         }
      }
      
      public function cSetState() : void
      {
         if(!this.cIsSolu && this.cLife)
         {
            if(this.cTemp > this.cBp)
            {
               if(this.cStateInit != 3)
               {
                  this.cTransform(false,3);
                  if(this.cMass > 5)
                  {
                  }
                  this.cTemp = this.cBp;
               }
            }
            else if(this.cTemp > this.cMp && this.cTemp < this.cBp)
            {
               if(this.cStateInit == 3)
               {
                  this.cTransform(true,2);
                  this.cSmokeD = true;
                  this.cTemp = this.cBp;
               }
               else if(this.cStateInit == 1)
               {
                  this.cTransform(false,2);
                  this.cTemp = this.cMp;
               }
            }
            else if(this.cTemp < this.cMp)
            {
               if(this.cStateInit != 1)
               {
                  this.cTransform(false,1);
                  this.cTemp = this.cMp;
               }
            }
         }
      }
      
      private function cTransform(n:*, s:*) : void
      {
         var i:* = undefined;
         var mt_temp:* = undefined;
         var transv_temp:Number = Math.abs(this.cPower) * 0.02 * this.cFather.cSpeed;
         this.cMass -= transv_temp * this.cFather.cSpeed;
         for(i in this.cG.cStack)
         {
            if(this.cG.cStack[i].cName == this.cName && this.cG.cStack[i].cState == s)
            {
               this.cG.cStack[i].cMass += transv_temp;
               return;
            }
         }
         mt_temp = this.cFather.cCreatMatter(this.cName,transv_temp,this.cTemp);
         if(n)
         {
            this.cG.cAddSub(this.cFather.cCore[mt_temp],this.cNumber);
         }
         else
         {
            this.cG.cAddSub(this.cFather.cCore[mt_temp],this.cNumber - 1);
         }
         this.cPower = 0;
      }
      
      private function cEvp(n:*) : void
      {
         var transv_temp:Number = NaN;
         var i:* = undefined;
         var mt_temp:* = undefined;
         if(this.cG != null)
         {
            transv_temp = this.cFather.cSpeed * n;
            this.cMass -= transv_temp;
            for(i in this.cG.cStack)
            {
               if(this.cG.cStack[i].cName == this.cName && this.cG.cStack[i].cState == 3)
               {
                  this.cG.cStack[i].cMass += transv_temp;
                  return;
               }
            }
            mt_temp = this.cFather.cCreatMatter(this.cName,transv_temp,this.cBp + 1);
            if(n)
            {
               this.cG.cAddSub(this.cFather.cCore[mt_temp],this.cNumber);
            }
            else
            {
               this.cG.cAddSub(this.cFather.cCore[mt_temp],this.cNumber - 1);
            }
         }
      }
      
      private function cScanLife() : void
      {
         if(this.cLife)
         {
            if(this.cMass <= this.cAppx && this.cState != 3)
            {
               this.cLife = false;
               this.cMass = 0;
               this.cG.Dispose(this.cName + "_" + this.cSign);
            }
            else if(this.cMass <= 0 && this.cState == 3)
            {
               this.cLife = false;
               this.cMass = 0;
               this.cG.Dispose(this.cName + "_" + this.cSign);
            }
         }
      }
   }
}

