package
{
   public class cDevice
   {
      
      public var cName:String = new String();
      
      public var cNumber:Number = new Number();
      
      public var cType:String = new String();
      
      public var cTemp:Number = new Number();
      
      public var cVol:Number = new Number();
      
      public var cMaxTemp:Number = new Number();
      
      public var cAppx:Number = new Number(10);
      
      public var cBadHeat:Number;
      
      public var cAvgHeat:Boolean;
      
      public var cAtm:Array;
      
      public var cAtmPct:Array;
      
      public var cMt:cGroup;
      
      public var cLife:Boolean;
      
      public var cLid:Boolean;
      
      public var cIsLeak:Boolean;
      
      public var iDv:iDevice;
      
      public var cKind:String;
      
      private var cLinkTo:Array = new Array();
      
      public function cDevice(inG:cGroup, inType:*, inDm:*)
      {
         super();
         this.cLife = true;
         this.cTemp = inDm.sTemp;
         this.cMt = inG;
         this.cMt.cDv = this;
         this.cType = inType;
         this.cAvgHeat = false;
         this.cLid = false;
         this.cIsLeak = false;
         this.cBadHeat = 0;
         this.cMaxTemp = inDm.cData(this,"MaxTemp");
         this.cVol = inDm.cData(this,"Vol");
         if(inDm.LabType == 1)
         {
            this.cMaxTemp = 9999999;
            if(this.cType != "Saver" && this.cType != "WSaver")
            {
               this.cVol = 9999999;
            }
         }
         this.cAtm = this.cMt.cFather.sAtm.concat();
         this.cAtmPct = this.cMt.cFather.sAtmPct.concat();
         this.cPushAtm(this.cMt);
      }
      
      public function cExist() : *
      {
         this.cMt.cLife = this.cLife;
         if(this.cLife)
         {
            this.cAtm = this.cMt.cFather.sAtm.concat();
            this.cAtmPct = this.cMt.cFather.sAtmPct.concat();
            this.cInterProg(this.cMt);
            this.cCool();
            if(this.cMt.cMaxTemp > this.cMaxTemp)
            {
               this.cMt.cIsExp = true;
            }
            if(this.cMt.cGetTotalVol() > this.cVol * 20 && this.cLid)
            {
            }
         }
      }
      
      public function cGetTemp() : Number
      {
         return this.cMt.cGetTemp();
      }
      
      private function cInterProg(cG:cGroup) : *
      {
         var overAdd:Number = 0;
         if(this.cType == "Watch" || this.cType == "Bowl")
         {
            overAdd = 20;
         }
         if(cG.cGetTotalVol() > this.cVol + this.cAppx + overAdd)
         {
            if(!this.cLid && this.cType != "Dropper")
            {
               if(this.cLinkTo.length == 0)
               {
                  if(!this.cIsLeak)
                  {
                     this.cOverFlow(cG);
                  }
               }
            }
            if(this.cLinkTo.length > 0)
            {
               this.cOverTrans(cG);
            }
         }
         else if(cG.cGetTotalVol() < this.cVol - this.cAppx)
         {
            if(!this.cLid && this.cType != "Dropper")
            {
               if(this.cLinkTo.length == 0)
               {
                  if(!this.cIsLeak)
                  {
                     this.cPushAtm(cG);
                  }
               }
            }
         }
         else if(this.cType == "Watch" || this.cType == "Bowl")
         {
            if(!this.cLid && cG.cGetTotalVol() < this.cVol + 20)
            {
               if(this.cLinkTo.length == 0)
               {
                  if(!this.cIsLeak)
                  {
                     this.cPushAtm(cG);
                  }
               }
            }
         }
      }
      
      private function cPushAtm(cG:cGroup) : *
      {
         var i:* = undefined;
         var nm_temp:* = undefined;
         var mat_temp:* = undefined;
         var cAVol:Number = this.cVol;
         if(this.cType == "Watch" || this.cType == "Bowl")
         {
            cAVol += 20;
         }
         var v_temp:* = cAVol - cG.cGetTotalVol();
         for(i in this.cAtm)
         {
            nm_temp = this.cAtm[i];
            mat_temp = this.cMt.cFather.cCreatMatter(nm_temp,0,this.cTemp);
            cG.cFather.cCore[mat_temp].cFlow(v_temp * this.cAtmPct[i],"cVoltoMass");
            cG.cAddSub(this.cMt.cFather.cCore[mat_temp],0);
         }
      }
      
      public function cGetpH() : Number
      {
         return this.cMt.cGetpH();
      }
      
      public function cLink(obj:cDevice) : Number
      {
         this.cLinkTo.push(obj);
         return this.cLinkTo.length - 1;
      }
      
      public function cHasLink(obj:iDevice) : Boolean
      {
         var i:* = undefined;
         for(i in this.cLinkTo)
         {
            if(this.cLinkTo[i] == obj.cDv)
            {
               return true;
            }
         }
         return false;
      }
      
      public function cDisLink(id:Number) : void
      {
         for(var i:* = id; i < this.cLinkTo.length; i++)
         {
            this.cLinkTo[i] = this.cLinkTo[i + 1];
         }
         this.cLinkTo.pop();
      }
      
      private function cOverFlow(cG:cGroup) : *
      {
         var j:* = undefined;
         var vol_temp:* = undefined;
         var o2:* = undefined;
         var ary_temp3:* = cG.cGetSubAt(0);
         var tt_temp:* = 0;
         for(j in ary_temp3)
         {
            tt_temp += ary_temp3[j].cVol;
         }
         vol_temp = (cG.cGetTotalVol() - this.cVol) / tt_temp;
         if(vol_temp < 1)
         {
            cG.cPopSubAtPct(0,vol_temp);
         }
         else
         {
            o2 = cG.cPopSubAtPct(0,1);
         }
      }
      
      private function cOverTrans(cG:cGroup) : *
      {
         var m:* = undefined;
         var i:* = undefined;
         var vol_temp:* = undefined;
         var tvol:Number = 0;
         for(m in this.cLinkTo)
         {
            tvol += this.cLinkTo[m].cMt.cGetTotalVol();
         }
         tvol += cG.cGetTotalVol();
         tvol = tvol / (this.cLinkTo.length + 1) - this.cVol;
         for(i in this.cLinkTo)
         {
            if(cG.cGetTotalVol() > this.cLinkTo[i].cMt.cGetTotalVol() + 20)
            {
               trace(cG.cGetTotalVol(),this.cLinkTo[i].cMt.cGetTotalVol());
               vol_temp = 1 - tvol / (cG.cGetTotalVol() - this.cVol);
               trace("v ",vol_temp);
               if(vol_temp < 1)
               {
                  this.cTrans(cG.cPopSubAtPct(0,vol_temp));
               }
               else
               {
                  this.cTrans(cG.cPopSubAtPct(0,1));
               }
            }
         }
      }
      
      private function cTrans(m:Array) : void
      {
         var j:* = undefined;
         var h:* = undefined;
         var iSsc:Boolean = false;
         var matter:* = undefined;
         var vol:* = undefined;
         var tp:* = undefined;
         var mass:* = undefined;
         var i:* = undefined;
         var t1:* = undefined;
         var t2:* = undefined;
         var mm1:* = undefined;
         var mm2:* = undefined;
         var mat_temp:* = undefined;
         for(j in this.cLinkTo)
         {
            if(this.cLinkTo[j] != null && m != null)
            {
               for(h in m)
               {
                  iSsc = false;
                  matter = m[h][0];
                  vol = m[h][1];
                  tp = m[h][2];
                  mass = m[h][3];
                  if(matter.cState == 3)
                  {
                     trace(matter.cName,matter.cVol);
                     for(i = 0; i < this.cLinkTo[j].cMt.cStack.length; i++)
                     {
                        if(this.cLinkTo[j].cMt.cStack[i] != null)
                        {
                           if(this.cLinkTo[j].cMt.cStack[i].cName == matter.cName)
                           {
                              t1 = this.cLinkTo[j].cMt.cStack[i].cTemp;
                              t2 = tp;
                              mm1 = this.cLinkTo[j].cMt.cStack[i].cMass;
                              mm2 = mass;
                              this.cLinkTo[j].cMt.cStack[i].cTemp = t1 + Math.abs((t1 - t2) / (mm1 / mm2 + 1));
                              this.cLinkTo[j].cMt.cStack[i].cFlow(-vol,"cVol");
                              iSsc = true;
                              break;
                           }
                        }
                     }
                     if(!iSsc)
                     {
                        mat_temp = this.cMt.cFather.cCreatMatter(matter.cName,mass,tp);
                        this.cLinkTo[j].cMt.cAddSub(this.cMt.cFather.cCore[mat_temp],1);
                     }
                  }
               }
            }
         }
      }
      
      public function cContain(inGp:cGroup) : *
      {
         this.cMt = inGp;
      }
      
      private function iRemove() : *
      {
      }
      
      public function cClear() : void
      {
         this.cMt.cClear();
      }
      
      public function cMix(inP:Boolean) : *
      {
         this.cMt.cMix(inP);
      }
      
      public function cHeat(inT:Number) : *
      {
         this.cMt.cHeat(inT,this.cMt.cGetMaxDepth());
         this.cMt.cHeat(inT * 0.8,this.cMt.cGetMaxDepth() - 1);
         this.cMt.cHeat(inT * 0.4,this.cMt.cGetMaxDepth() - 2);
         this.cMt.cHeat(inT * 0.2,this.cMt.cGetMaxDepth() - 3);
      }
      
      public function cCool() : *
      {
         for(var i:* = 0; i < this.cMt.cGetMaxDepth(); i++)
         {
            this.cMt.cHeat(this.cTemp,i);
         }
      }
      
      private function iCopy() : *
      {
      }
   }
}

