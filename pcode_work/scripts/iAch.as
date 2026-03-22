package
{
   import flash.net.*;
   import flash.utils.*;
   
   public class iAch
   {
      
      public var ConfigSo:SharedObject;
      
      public var iAchChart:Dictionary = new Dictionary();
      
      public var iAchUn:Dictionary = new Dictionary();
      
      public var iAchUnf:Number = 0;
      
      public var iAchUnc:Number = 0;
      
      public var iAchNum:Number = 0;
      
      public var iAchCnt:Number = 0;
      
      public var total:Number = 0;
      
      public var pP:iPan;
      
      public function iAch(p:*)
      {
         super();
         this.ConfigSo = SharedObject.getLocal("Chemix_ach");
         this.pP = p;
         this.iAchInit();
         this.iAchLoad();
         this.iAchUn.f = new Object();
         this.iAchUn.c = new Object();
      }
      
      public function iAchLoad() : void
      {
         if(this.ConfigSo.data.iAchSaved != null)
         {
         }
      }
      
      public function iAchSave() : void
      {
         this.ConfigSo.data.iAchNum = this.iAchNum;
         this.ConfigSo.data.iAchCnt = this.iAchCnt;
         this.ConfigSo.data.iAchChart = this.iAchChart;
         this.ConfigSo.data.iAchUnf = this.iAchUnf;
         this.ConfigSo.data.iAchUnc = this.iAchUnc;
         this.ConfigSo.data.iAchUn = this.iAchUn;
         this.ConfigSo.data.iAchSaved = true;
         this.ConfigSo.flush();
      }
      
      private function iAchAdd(nm:String, inst:String, pt:Number) : void
      {
         this.iAchChart[nm] = new Object();
         this.iAchChart[nm].inst = inst;
         this.iAchChart[nm].pt = pt;
         this.iAchChart[nm].nm = nm;
         this.iAchChart[nm].cmp = 2;
         ++this.total;
      }
      
      public function iGetAch(nm:*) : *
      {
         if(this.pP.iStage.myDomain.LabType == 0)
         {
            this.iAchChart[nm].cmp = 1;
            this.iAchNum += this.iAchChart[nm].pt;
            ++this.iAchCnt;
            if(this.pP.iStage.myDomain.sAch)
            {
               this.pP.pAchPlay(nm);
            }
         }
      }
      
      public function iUnAch(nm:*, tp:*) : *
      {
         if(this.pP.iStage.myDomain.LabType == 0)
         {
            if(tp == "p")
            {
               this.iTryAch("p" + nm);
            }
            else if(tp == "s")
            {
               this.iTryAch("s" + nm);
            }
            else if(this.iAchUn[tp][nm] == undefined)
            {
               this.iAchUn[tp][nm] = 1;
               ++this["iAchUn" + tp];
            }
            if(this.iAchUnf == 1)
            {
               this.iTryAch("ef1");
            }
            else if(this.iAchUnf == 5)
            {
               this.iTryAch("ef5");
            }
            else if(this.iAchUnf == 10)
            {
               this.iTryAch("ef10");
            }
            else if(this.iAchUnf == 20)
            {
               this.iTryAch("ef20");
            }
            else if(this.iAchUnf == 30)
            {
               this.iTryAch("ef30");
            }
            else if(this.iAchUnf == 40)
            {
               this.iTryAch("ef40");
            }
            else if(this.iAchUnf == 50)
            {
               this.iTryAch("ef50");
            }
            else if(this.iAchUnf == 60)
            {
               this.iTryAch("ef60");
            }
            if(this.iAchUnc == 5)
            {
               this.iTryAch("ec5");
            }
            else if(this.iAchUnc == 10)
            {
               this.iTryAch("ec10");
            }
            else if(this.iAchUnc == 20)
            {
               this.iTryAch("ec20");
            }
            else if(this.iAchUnc == 30)
            {
               this.iTryAch("ec30");
            }
            else if(this.iAchUnc == 40)
            {
               this.iTryAch("ec40");
            }
            else if(this.iAchUnc == 50)
            {
               this.iTryAch("ec50");
            }
            else if(this.iAchUnc == 60)
            {
               this.iTryAch("ec60");
            }
            this.iAchSave();
         }
      }
      
      public function iTryAch(nm:*) : *
      {
         if(this.iAchChart[nm] != undefined)
         {
            if(this.iAchChart[nm].cmp == 2)
            {
               this.iGetAch(nm);
               this.iAchSave();
            }
         }
      }
      
      public function iAchInit() : *
      {
         this.iAchAdd("ef1","Discover a new formula",10);
         this.iAchAdd("ef5","Discover 5 formulas",10);
         this.iAchAdd("ef10","Discover 10 formulas",10);
         this.iAchAdd("ef20","Discover 20 formulas",10);
         this.iAchAdd("ef30","Discover 30 formulas",10);
         this.iAchAdd("ef40","Discover 40 formulas",10);
         this.iAchAdd("ef50","Discover 50 formulas",10);
         this.iAchAdd("ef60","Discover 60 formulas",10);
         this.iAchAdd("ec5","Discover 5 chemicals",5);
         this.iAchAdd("ec10","Discover 10 chemicals",5);
         this.iAchAdd("ec20","Discover 20 chemicals",5);
         this.iAchAdd("ec30","Discover 30 chemicals",5);
         this.iAchAdd("ec40","Discover 40 chemicals",5);
         this.iAchAdd("ec50","Discover 50 chemicals",5);
         this.iAchAdd("ec60","Discover 60 chemicals",5);
         this.iAchAdd("pO2","Produce Oxygen(O2)",10);
         this.iAchAdd("pH2","Produce Hydrogen(H2)",10);
         this.iAchAdd("pCO2","Produce Carbon dioxide(CO2)",10);
         this.iAchAdd("pH2O","Produce Water(H2O)",10);
         this.iAchAdd("sd","Decomposition reaction",10);
         this.iAchAdd("sdr","Double replacement reaction",10);
         this.iAchAdd("ss","Synthesis reaction",10);
         this.iAchAdd("ssr","Single replacement reaction",10);
      }
   }
}

