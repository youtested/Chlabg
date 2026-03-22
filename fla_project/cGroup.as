package
{
   public class cGroup
   {
      
      private static var cDatabase:cDb;
      
      private const cMassMin:Number = 0.1;
      
      public var cStack:Array;
      
      public var cStackShow:Array;
      
      public var cFather:cDomain;
      
      public var cDv:cDevice;
      
      public var cAppx:Number = 0.001;
      
      public var cAddSubList:Array;
      
      public var cTotalVol:Number;
      
      public var cTotalMVol:Number;
      
      public var cTotalSVol:Number;
      
      public var cTotalLVol:Number;
      
      public var cIsMix:Boolean;
      
      public var cIsExp:Boolean;
      
      public var cIsGExp:Boolean;
      
      public var cIsEle:Boolean;
      
      public var cIsBB:Boolean;
      
      public var cIsE1:Boolean;
      
      public var cIsDet:Boolean;
      
      public var cIsLDet:Boolean;
      
      public var cBurnEng:Number = 0;
      
      public var cHaveSol:*;
      
      public var cIsPour:Boolean;
      
      public var cMaxTemp:Number = 0;
      
      public var cLife:Boolean = true;
      
      public var cMixSpeed:Number = 1;
      
      public var cFire:Boolean = false;
      
      public var cName:String;
      
      private var cTime:Number = 0;
      
      private var cFmlBox:Object = new Object();
      
      public function cGroup(inDm:cDomain)
      {
         super();
         this.cIsMix = false;
         this.cIsExp = false;
         this.cIsDet = false;
         this.cIsPour = false;
         this.cHaveSol = false;
         this.cIsEle = false;
         cDatabase = inDm.cDbs;
         this.cStack = new Array();
         this.cStackShow = new Array();
         this.cAddSubList = new Array();
         this.cFather = inDm;
         this.cTotalVol = 0;
         this.cTotalSVol = 0;
      }
      
      public function Dispose(inN:String) : *
      {
         this.cFather.cRemove(inN);
      }
      
      public function cShow(i:Number, Att:String) : *
      {
         var po_temp:* = 0;
         var ms_temp:* = 0;
         if(typeof this.cG()[i][Att] == "number")
         {
            if(this.cG()[i][Att] > 0)
            {
               if(Att == "cMass")
               {
                  if(this.cG()[i][Att] < 0.1)
                  {
                     ms_temp = "<0.1";
                  }
                  else
                  {
                     ms_temp = Math.round(this.cG()[i][Att] * 10) / 10;
                  }
               }
               else if(Att == "cMol" || Att == "cMolar")
               {
                  if(this.cG()[i][Att] < 0.1)
                  {
                     ms_temp = "≈0";
                  }
                  else
                  {
                     ms_temp = Math.round(this.cG()[i][Att] * 100) / 100;
                  }
               }
               else if(this.cG()[i][Att] < 0.1)
               {
                  ms_temp = "≈0";
               }
               else
               {
                  ms_temp = Math.round(this.cG()[i][Att] * 10) / 10;
               }
            }
            else if(Att == "cMol" && this.cG()[i].cState != 4)
            {
               ms_temp = "-";
            }
            else
            {
               ms_temp = Math.round(this.cG()[i][Att] * 10) / 10;
            }
            po_temp = ms_temp;
         }
         else
         {
            po_temp = this.cG()[i][Att];
         }
         return po_temp;
      }
      
      public function cExist() : *
      {
         if(this.cLife)
         {
            ++this.cTime;
            this.cScan();
            this.cAddSubAll();
            this.cQueue();
            this.cMerge();
            this.cProgMatter();
            this.cStackShow = this.cStack;
         }
      }
      
      public function cG() : Array
      {
         return this.cStackShow;
      }
      
      public function cGetpH() : Number
      {
         var i:* = undefined;
         var totalpH:Number = 0;
         var count:Number = 0;
         for(i in this.cStack)
         {
            if(this.cStack[i].cState == 4)
            {
               count++;
               if(this.cStack[i].cKOH != 0)
               {
                  totalpH += 14 + Math.log(Math.sqrt(this.cStack[i].cMol * this.cStack[i].cKOH));
               }
               else if(this.cStack[i].cKH != 0)
               {
                  totalpH += -Math.log(Math.sqrt(this.cStack[i].cMol * this.cStack[i].cKH));
               }
               else if(this.cStack[i].cMOH != 0)
               {
                  totalpH += 14 + Math.log(this.cStack[i].cMol * this.cStack[i].cMOH);
               }
               else if(this.cStack[i].cMH != 0)
               {
                  totalpH += -Math.log(this.cStack[i].cMol * this.cStack[i].cMH);
               }
               else
               {
                  count--;
               }
            }
         }
         if(count > 0)
         {
            return totalpH;
         }
         return 7;
      }
      
      public function cAddSub(inSub:cMatter, inDps:Number, m:Boolean = false) : *
      {
         inSub.cNew = m;
         this.cAddSubList.push(new Array(inDps,inSub));
      }
      
      public function cHeat(inT:Number, inDps:Number) : *
      {
         this.cRunDepthAt(inDps,"cHeatSub",inT);
      }
      
      public function cPopSubAt(inDps:Number, inV:Number) : *
      {
         this.cRunDepthAt(inDps,"cFlowSubVol",inV);
      }
      
      public function cPopLiquid(inV:Number) : *
      {
         this.cRunDepthAt(-1,"cFlowLiquidVol",inV);
      }
      
      public function cPopSubAtPct(inDps:Number, inV:Number) : *
      {
         return this.cRunDepthAt2(inDps,"cFlowSubVolPct",inV);
      }
      
      public function cGetNumberDepth(inDps:Number) : Number
      {
         var i:* = undefined;
         var cnt_temp:Number = 0;
         for(i in this.cStack)
         {
            if(this.cStack[i].cDepth == inDps)
            {
               cnt_temp++;
            }
         }
         return cnt_temp;
      }
      
      public function cGetMaxDepth() : Number
      {
         var i:* = undefined;
         var dps_temp:Number = 0;
         for(i in this.cStack)
         {
            if(this.cStack[i].cDepth > dps_temp)
            {
               dps_temp = Number(this.cStack[i].cDepth);
            }
         }
         return dps_temp;
      }
      
      public function cGetTotalVol() : Number
      {
         return this.cTotalVol;
      }
      
      public function cGetTotalMVol() : Number
      {
         return this.cTotalMVol;
      }
      
      public function cGetTotalLVol() : Number
      {
         return this.cTotalLVol;
      }
      
      public function cGetSubAt(inDps:Number) : Array
      {
         var i:* = undefined;
         var ary_temp:Array = new Array();
         for(i in this.cStack)
         {
            if(this.cStack[i].cDepth == inDps)
            {
               ary_temp.push(this.cStack[i]);
            }
         }
         return ary_temp;
      }
      
      private function cProgMatter() : *
      {
         var i:* = undefined;
         var vol_temp:* = Number(0);
         var volm_temp:* = Number(0);
         var vols_temp:* = Number(0);
         var voll_temp:* = Number(0);
         var hs_temp:* = false;
         for(i in this.cStack)
         {
            this.cStack[i].cNumber = i;
            this.cStack[i].cIsMix = this.cIsMix;
            this.cStack[i].cExist(this);
            if(this.cMaxTemp < this.cStack[i].cTemp)
            {
               this.cMaxTemp = this.cStack[i].cTemp;
            }
            if(this.cStack[i].cState != 3)
            {
               volm_temp += this.cStack[i].cVol;
            }
            if(this.cStack[i].cState == 2 || this.cStack[i].cState == 4)
            {
               voll_temp += this.cStack[i].cVol;
            }
            if(this.cStack[i].cState == 4 && this.cStack[i].cStateInit == 2)
            {
               hs_temp = true;
               vols_temp += this.cStack[i].cVol;
            }
            else
            {
               vol_temp += this.cStack[i].cVol;
            }
         }
         this.cHaveSol = hs_temp;
         this.cTotalSVol = vols_temp;
         this.cTotalVol = vol_temp;
         this.cTotalMVol = volm_temp;
         this.cTotalLVol = voll_temp;
      }
      
      private function cMerge() : *
      {
         this.cCombine();
         this.cSweep();
      }
      
      private function cCombine() : *
      {
         var t1:* = undefined;
         var t2:* = undefined;
         var m1:* = undefined;
         var m2:* = undefined;
         for(var i:* = 0; i < this.cStack.length - 1; i++)
         {
            if(this.cStack[i].cAllReturn() == this.cStack[i + 1].cAllReturn())
            {
               t1 = this.cStack[i].cTemp;
               t2 = this.cStack[i + 1].cTemp;
               m1 = this.cStack[i].cMass;
               m2 = this.cStack[i + 1].cMass;
               if(this.cStack[i].cSign < this.cStack[i + 1].cSign)
               {
                  this.cStack[i].cMass += this.cStack[i + 1].cMass;
                  this.cStack[i].cTemp = (this.cStack[i].cTemp + this.cStack[i + 1].cTemp) / 2;
                  this.cRemove(i + 1);
                  i--;
               }
               else
               {
                  this.cStack[i + 1].cMass += this.cStack[i].cMass;
                  this.cStack[i + 1].cTemp = (this.cStack[i].cTemp + this.cStack[i + 1].cTemp) / 2;
                  this.cRemove(i);
                  i--;
               }
            }
         }
      }
      
      public function cStopMix() : void
      {
         this.cIsMix = false;
      }
      
      public function cMix(inP:Boolean) : *
      {
         this.cIsMix = inP;
         if(this.cIsMix)
         {
            this.cMixSpeed = 1.5;
         }
         else
         {
            this.cMixSpeed = 1;
         }
      }
      
      public function cGetTemp() : Number
      {
         var i:* = undefined;
         var j:* = undefined;
         var TotalMass:Number = 0;
         var Temp:Number = 0;
         for(i in this.cStack)
         {
            TotalMass += this.cStack[i].cMass;
         }
         for(j in this.cStack)
         {
            Temp += this.cStack[j].cMass / TotalMass * this.cStack[j].cTemp;
         }
         return Temp;
      }
      
      private function cSetDepth() : *
      {
         var stt_temp:Number = NaN;
         var i:* = undefined;
         var dp_temp:Number = -1;
         var winner_temp:Number = 0;
         for(i in this.cStack)
         {
            if(!this.cStack[i].cIsMix)
            {
               if(this.cStack[i].cState != 4)
               {
                  if(this.cStack[i].cState == 2 || stt_temp != this.cStack[i].cState)
                  {
                     dp_temp++;
                  }
                  this.cStack[i].cDepth = dp_temp;
                  stt_temp = Number(this.cStack[i].cState);
                  if(this.cStack[i].cState == 2)
                  {
                     if(winner_temp == 0)
                     {
                        winner_temp = i;
                     }
                  }
               }
               else if(this.cGetWater() != null)
               {
                  this.cStack[i].cDepth = this.cGetWater().cDepth;
               }
               this.cStack[i].cIsSurf = false;
            }
            else
            {
               this.cStack[i].cDepth = 1;
            }
         }
         if(this.cStack.length > 0)
         {
            this.cStack[winner_temp].cIsSurf = true;
         }
      }
      
      private function cQueue() : *
      {
         var j:* = undefined;
         var stk_temp:* = undefined;
         var flag:Boolean = true;
         flag = false;
         for(var i:* = 0; i < this.cStack.length - 1; i++)
         {
            for(j = i + 1; j < this.cStack.length; j++)
            {
               if(this.cStack[i].cDensity > this.cStack[j].cDensity)
               {
                  stk_temp = this.cStack[i];
                  this.cStack[i] = this.cStack[j];
                  this.cStack[j] = stk_temp;
                  this.cTryPB(this.cStack[j],this.cStack[i],true);
                  flag = true;
                  if(this.cStack[j].cState != 4)
                  {
                     break;
                  }
               }
               else
               {
                  this.cTryPB(this.cStack[i],this.cStack[j],false);
               }
            }
         }
      }
      
      private function cTryPB(inS1:cMatter, inS2:cMatter, inDir:Boolean) : *
      {
         if(inDir)
         {
            if(inS2.cState == 3 && inS1.cState == 2 || inS1.cState == 4 && inS2.cState == 3)
            {
               inS1.cDoBubble(true);
               inS1.cBeBubble(inS1.cMass);
            }
         }
         else if(inS2.cState == 2 && inS1.cState == 3)
         {
         }
      }
      
      private function cRemove(i:Number) : *
      {
         this.cStack[i].cDie();
         for(var j:* = i; j < this.cStack.length - 1; j++)
         {
            this.cStack[j] = this.cStack[j + 1];
         }
         this.cStack.pop();
      }
      
      public function cClear() : void
      {
         while(this.cStack.length > 0)
         {
            this.cStack.pop().cDie();
         }
      }
      
      private function cSweep() : *
      {
         var i:* = undefined;
         for(i in this.cStack)
         {
            if(this.cStack[i].cMass <= 0 || this.cStack[i] == undefined)
            {
               this.cRemove(i);
               i--;
            }
         }
      }
      
      public function cAddSubAll() : *
      {
         this.cScanSubList();
         this.cMerge();
         this.cSetDepth();
      }
      
      private function cScanSubList() : *
      {
         var i:* = undefined;
         var inDps:* = undefined;
         var inSub:* = undefined;
         var inNew:* = undefined;
         var stk_temp:Array = null;
         for(i in this.cAddSubList)
         {
            inDps = this.cAddSubList[i][0];
            inSub = this.cAddSubList[i][1];
            inNew = this.cAddSubList[i][2];
            if(inDps >= 0)
            {
               stk_temp = new Array();
               stk_temp = this.cStack.slice(0,inDps);
               stk_temp.push(inSub);
               this.cStack = stk_temp.concat(this.cStack.slice(inDps,this.cStack.length));
            }
         }
         this.cAddSubList = new Array();
      }
      
      private function cScan() : *
      {
         var j:* = undefined;
         for(var i:* = 0; i < this.cStack.length; i++)
         {
            this.cTryDil(this.cStack[i]);
            this.cTryDic(this.cStack[i]);
            if(i < this.cStack.length)
            {
               for(j = i + 1; j < this.cStack.length; j++)
               {
                  if(Math.abs(this.cStack[j].cDepth - this.cStack[i].cDepth) <= 1)
                  {
                     if(this.cStack[i].cMass > 0 && this.cStack[j].cMass > 0)
                     {
                        if(!this.cIsPour)
                        {
                           this.cTryDis(this.cStack[i],this.cStack[j]);
                        }
                        this.cTryReact(this.cStack[i],this.cStack[j]);
                        this.cTryHeat(this.cStack[i],this.cStack[j]);
                     }
                  }
               }
            }
         }
         this.cFire = false;
      }
      
      private function cTryReact(inS1:cMatter, inS2:cMatter) : Boolean
      {
         var rct_temp:* = cDatabase.cTry(inS1,inS2,0,this,this.cFire,this.cIsMix);
         if(rct_temp != undefined)
         {
            this.cReact(rct_temp);
            return true;
         }
         return false;
      }
      
      private function cTryDic(inS1:cMatter) : Boolean
      {
         var rct_temp:* = cDatabase.cTry(inS1,null,0,this,this.cFire,this.cIsMix);
         if(rct_temp != undefined)
         {
            this.cReact(rct_temp);
            return true;
         }
         return false;
      }
      
      private function cReact(inR:cReaction) : *
      {
         var _ToPrec:* = undefined;
         var _ToBubble:cMatter = null;
         var i:* = undefined;
         var cnmn:Number = NaN;
         var j:* = undefined;
         var t1:* = undefined;
         var c1:* = undefined;
         var t2:* = undefined;
         var c2:* = undefined;
         var m2:* = undefined;
         var m1:* = undefined;
         var terminal2:* = undefined;
         var iSc:Boolean = false;
         var mm1:* = undefined;
         var mm2:* = undefined;
         var mt_temp:* = undefined;
         var min_temp:* = undefined;
         var cZ:* = inR.cSpeed * this.cFather.cSpeed * this.cMixSpeed;
         var q3:* = inR.cHR * this.cFather.cSpeed * this.cMixSpeed;
         if(inR.cIgn)
         {
            this.cBurnEng = q3;
         }
         if(inR.cExp)
         {
            if(!this.cIsExp)
            {
               this.cIsExp = true;
            }
         }
         if(inR.cGExp)
         {
            if(!this.cIsGExp)
            {
               this.cIsGExp = true;
            }
         }
         if(inR.cEle)
         {
            if(!this.cIsEle)
            {
               this.cIsEle = true;
            }
         }
         if(inR.cBB)
         {
            if(!this.cIsBB)
            {
               this.cIsBB = true;
            }
         }
         if(inR.cE1)
         {
            if(!this.cIsE1)
            {
               this.cIsE1 = true;
            }
         }
         if(inR.cDet)
         {
            if(!this.cIsDet)
            {
               this.cIsDet = true;
            }
         }
         else if(this.cIsDet)
         {
            this.cIsDet = false;
         }
         if(inR.cLDet)
         {
            if(!this.cIsLDet)
            {
               this.cIsLDet = true;
            }
         }
         else if(this.cIsLDet)
         {
            this.cIsLDet = false;
         }
         for(i in inR.cS)
         {
            if(inR.cS[i] != null)
            {
               if(inR.cS[i].cState == 4)
               {
                  _ToPrec = inR.cS[i];
               }
               if(inR.cS[i].cState == 4 || inR.cS[i].cState == 2)
               {
                  _ToBubble = inR.cS[i];
               }
               if(inR.cIgn)
               {
                  inR.cS[i].cIsIgn = true;
                  inR.cS[i].cIgnCol = inR.cIgnCol;
                  inR.cS[i].cIgnAlp = inR.cIgnAlp;
                  if(inR.cEff != null)
                  {
                     inR.cS[i].cEff = inR.cEff;
                  }
               }
               inR.cS[i].cFlow(-inR.cN[i] * cZ,"cMass");
               inR.cS[i].cFlow(q3,"cEng");
            }
         }
         cnmn = 0;
         for(j in inR.cSP)
         {
            t1 = inR.cS[0].cTemp;
            c1 = inR.cS[0].cH_C;
            if(inR.cS[1] != null)
            {
               t2 = inR.cS[1].cTemp;
               c2 = inR.cS[1].cH_C;
               m2 = inR.cS[1].cMass;
            }
            else
            {
               t2 = 0;
               c2 = 0;
               m2 = 0;
            }
            m1 = inR.cS[0].cMass;
            terminal2 = t1;
            if(m1 > 0)
            {
               iSc = false;
               for(i = 0; i < this.cStack.length; i++)
               {
                  if(this.cStack[i] != null)
                  {
                     if(this.cStack[i].cName == inR.cSP[j])
                     {
                        t1 = this.cStack[i].cTemp;
                        t2 = terminal2;
                        mm1 = this.cStack[i].cMass;
                        mm2 = inR.cNP[j] * cZ / 1000;
                        this.cStack[i].cFlow(inR.cNP[j] * cZ,"cMass");
                        this.cStack[i].cFlow(q3,"cEng");
                        if(_ToBubble != null)
                        {
                           if(this.cStack[i].cState == 3)
                           {
                              _ToBubble.cDoBubble(true);
                              _ToBubble.cBeBubble(inR.cNP[j] * cZ / 1000);
                           }
                        }
                        iSc = true;
                        break;
                     }
                  }
               }
               if(!iSc)
               {
                  mt_temp = this.cFather.cCreatMatter(inR.cSP[j],0,terminal2);
                  this.cFather.cCore[mt_temp].cFlow(inR.cNP[j] * cZ,"cMass");
                  if(inR.cS[1] != null)
                  {
                     min_temp = Math.max(inR.cS[0].cNumber,inR.cS[1].cNumber);
                  }
                  else
                  {
                     min_temp = inR.cS[0].cNumber;
                  }
                  this.cAddSub(this.cFather.cCore[mt_temp],min_temp);
                  if(_ToPrec != null)
                  {
                     if(this.cFather.cCore[mt_temp].cState == 1 && this.cFather.cCore[mt_temp].cSolu <= 1)
                     {
                        _ToPrec.cDoPrec(true,this.cFather.cCore[mt_temp].cColor);
                     }
                  }
                  if(inR.cS[0].cState == 3 && inR.cS[1].cState == 3)
                  {
                     if(this.cFather.cCore[mt_temp].cState == 1)
                     {
                        this.cFather.cCore[mt_temp].cDoMist(true,this.cFather.cCore[mt_temp].cColor);
                     }
                  }
               }
            }
         }
         if(!this.cPreFml(inR.cId))
         {
            this.cFather.cNoteFml(inR.cId,this.cDv.iDv.iUID);
         }
         this.cPreFmlAdd(inR.cId);
      }
      
      private function cPreFmlAdd(n:String) : void
      {
         this.cFmlBox[n] = this.cTime;
      }
      
      private function cPreFml(n:String) : Boolean
      {
         if(this.cTime - this.cFmlBox[n] <= 30)
         {
            return true;
         }
         return false;
      }
      
      private function cTryDis(inS1:cMatter, inS2:cMatter) : *
      {
         if(inS2.cName == "H2O" && inS2.cState == 2)
         {
            if(inS1.cState != 4 && inS1.cSolu > 0)
            {
               this.cDis(inS1);
            }
         }
         else if(inS1.cName == "H2O" && inS1.cState == 2)
         {
            if(inS2.cState != 4 && inS2.cSolu > 0)
            {
               this.cDis(inS2);
            }
         }
      }
      
      private function cTryDil(inS1:cMatter) : Boolean
      {
         if(inS1.cState == 4)
         {
            this.cDil(inS1);
            return true;
         }
         return false;
      }
      
      private function cDis(inS:cMatter) : *
      {
         var mt_temp:* = undefined;
         var disv_temp:Number = this.cGetWater().cMass / 100 * inS.cSolu;
         var mass_temp:Number = 0;
         if(this.cSoluMass(inS) < disv_temp - this.cAppx)
         {
            if(inS.cMass >= disv_temp - this.cAppx - this.cSoluMass(inS))
            {
               inS.cMass -= disv_temp - this.cAppx - this.cSoluMass(inS);
               mass_temp = disv_temp - this.cAppx - this.cSoluMass(inS);
            }
            else
            {
               mass_temp = inS.cMass;
               inS.cMass = 0;
            }
            mt_temp = this.cFather.cCreatMatter(inS.cName,mass_temp,inS.cTemp);
            this.cGetWater().cFlow(inS.cDisHeat,"cEng");
            this.cFather.cCore[mt_temp].cFlow(inS.cDisHeat,"cEng");
            this.cFather.cCore[mt_temp].cFlow(true,"cIsSolu");
            this.cAddSub(this.cFather.cCore[mt_temp],this.cGetWater().cNumber);
         }
      }
      
      private function cDil(inS:cMatter) : *
      {
         var disv_temp:Number = NaN;
         var lvl_temp:Number = NaN;
         var mass_temp:Number = NaN;
         var mt_temp:* = undefined;
         if(this.cGetWater() != null)
         {
            disv_temp = this.cGetWater().cMass / 100 * inS.cSolu;
            lvl_temp = Number(this.cGetWater().cNumber);
            mass_temp = 0;
            if(inS.cMass > disv_temp + this.cAppx)
            {
               mass_temp = inS.cMass - disv_temp;
               inS.cMass = disv_temp;
               mt_temp = this.cFather.cCreatMatter(inS.cName,mass_temp,inS.cTemp);
               this.cFather.cCore[mt_temp].cFlow(false,"cIsSolu");
               this.cAddSub(this.cFather.cCore[mt_temp],lvl_temp);
            }
         }
         else
         {
            mt_temp = this.cFather.cCreatMatter(inS.cName,inS.cMass,inS.cTemp);
            this.cFather.cCore[mt_temp].cFlow(false,"cIsSolu");
            inS.cMass = 0;
            this.cAddSub(this.cFather.cCore[mt_temp],lvl_temp);
         }
      }
      
      private function cTryHeat(inS1:cMatter, inS2:cMatter) : *
      {
         if(inS1.cTemp != inS2.cTemp && inS1.cMass * inS2.cMass > 0)
         {
            this.cTransHeat(inS1,inS2);
         }
      }
      
      private function cTransHeat(inS1:cMatter, inS2:cMatter) : *
      {
         var _r1:* = inS1.cH_R;
         var _dt1:* = inS1.cTemp - inS2.cTemp;
         var _r2:* = inS2.cH_R;
         var _dt2:* = inS2.cTemp - inS1.cTemp;
         var inST1:* = _r1 * _dt1 * this.cFather.cSpeed * this.cMixSpeed;
         var inST2:* = _r2 * _dt2 * this.cFather.cSpeed * this.cMixSpeed;
         inS1.cPreFlow(inST2,"cEng",inS2);
         inS2.cPreFlow(inST1,"cEng",inS1);
      }
      
      private function cHeatSub(inS1:cMatter, inV:Number) : *
      {
         var _r1:* = 0.1;
         var _dt1:* = inV - inS1.cTemp;
         var inST1:* = _r1 * _dt1;
         inS1.cPreFlow(inST1,"cHeat",inV);
      }
      
      private function cFlowSubVol(inS:cMatter, inV:Number) : *
      {
         inS.cFlow(inV,"cVol");
      }
      
      private function cFlowLiquidVol(inS:cMatter, inV:Number) : *
      {
         inS.cFlow(inV,"cVol");
      }
      
      private function cFlowSubVolPct(inS:cMatter, inV:Number) : *
      {
         var a:* = [inS,inV * inS.cVol,inS.cTemp,inS.cMass * inV];
         inS.cFlow(inV * inS.cVol,"cVol");
         return a;
      }
      
      public function cGetWater() : *
      {
         var i:* = undefined;
         for(i in this.cStack)
         {
            if(this.cStack[i].cName == "H2O" && this.cStack[i].cState == 2)
            {
               return this.cStack[i];
            }
         }
         return null;
      }
      
      public function cHasSub(cnm:String) : Boolean
      {
         var i:* = undefined;
         for(i in this.cStack)
         {
            if(this.cStack[i].cName == cnm)
            {
               return true;
            }
         }
         return false;
      }
      
      public function cGetWaterMass() : Number
      {
         if(this.cGetWater() != null)
         {
            return this.cGetWater().cMass;
         }
         return 0;
      }
      
      public function cGetSolVol() : Number
      {
         var i:* = undefined;
         var v:Number = 0;
         for(i in this.cStack)
         {
            if(this.cStack[i].cState == 4 || this.cStack[i].cState == 2 && this.cStack[i].cName == "H2O")
            {
               v += this.cStack[i].cVol;
            }
         }
         return v;
      }
      
      private function cRunDepthAt(inDp:Number, inFunc:String, inVal:*) : *
      {
         var i:* = undefined;
         for(i in this.cStack)
         {
            if(this.cStack[i].cDepth == inDp)
            {
               if(inDp != -1)
               {
                  return this[inFunc](this.cStack[i],inVal);
               }
               if(this.cStack[i].cState == 2)
               {
                  return this[inFunc](this.cStack[i],inVal);
               }
            }
         }
      }
      
      private function cRunDepthAt2(inDp:Number, inFunc:String, inVal:*) : *
      {
         var i:* = undefined;
         var a:Array = new Array();
         for(i in this.cStack)
         {
            if(this.cStack[i].cDepth == inDp)
            {
               if(inDp != -1)
               {
                  a.push(this[inFunc](this.cStack[i],inVal));
               }
               else if(this.cStack[i].cState == 2)
               {
                  a.push(this[inFunc](this.cStack[i],inVal));
               }
            }
         }
         return a;
      }
      
      private function cSoluMass(inS:cMatter) : Number
      {
         var i:* = undefined;
         var mass_temp:Number = 0;
         for(i in this.cStack)
         {
            if(this.cStack[i].cName == inS.cName && this.cStack[i].cState == 4)
            {
               mass_temp += this.cStack[i].cMass;
            }
         }
         return mass_temp;
      }
   }
}

