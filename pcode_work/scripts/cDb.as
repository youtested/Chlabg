package
{
   import flash.net.*;
   import flash.utils.*;
   
   public class cDb
   {
      
      public var SDb:Dictionary = new Dictionary(true);
      
      public var RDb:Dictionary = new Dictionary(true);
      
      public var MDb:Object = new Object();
      
      public var cData:Dictionary = new Dictionary(true);
      
      public var cCloudVersion:String;
      
      public var MSo:SharedObject = SharedObject.getLocal("Chemix_mdbt11");
      
      public var StarSo:SharedObject = SharedObject.getLocal("Chemix_star");
      
      public var CSo:SharedObject = SharedObject.getLocal("Chemix_Cloudx17");
      
      public var CSor:SharedObject = SharedObject.getLocal("Chemix_CloudReactionx30");
      
      public var CSv:SharedObject = SharedObject.getLocal("Chemix_CloudVersionx31");
      
      public var cDm:cDomain;
      
      private var sbList:Dictionary = new Dictionary();
      
      private var sbLists:Dictionary = new Dictionary();
      
      public var MDbN:Number = 0;
      
      public function cDb(inDm:cDomain)
      {
         super();
         Database.init(this);
         this.initSb();
         this.cDm = inDm;
         this.cDm.cDbs = this;
         this.cData.Beaker1 = new Dictionary();
         this.cData.Beaker1.Vol = 250;
         this.cData.Beaker1.MaxTemp = 900;
         this.cData.TT = new Dictionary();
         this.cData.TT.Vol = 50;
         this.cData.TT.MaxTemp = 900;
         this.cData.Beaker2 = new Dictionary();
         this.cData.Beaker2.Vol = 100;
         this.cData.Beaker2.MaxTemp = 900;
         this.cData.Awl = new Dictionary();
         this.cData.Awl.Vol = 250;
         this.cData.Awl.MaxTemp = 900;
         this.cData.Awl2 = new Dictionary();
         this.cData.Awl2.Vol = 100;
         this.cData.Awl2.MaxTemp = 900;
         this.cData.Boiler = new Dictionary();
         this.cData.Boiler.Vol = 250;
         this.cData.Boiler.MaxTemp = 1600;
         this.cData.Boiler2 = new Dictionary();
         this.cData.Boiler2.Vol = 100;
         this.cData.Boiler2.MaxTemp = 1600;
         this.cData.GasBottle = new Dictionary();
         this.cData.GasBottle.Vol = 250;
         this.cData.GasBottle.MaxTemp = 900;
         this.cData.Watch = new Dictionary();
         this.cData.Watch.Vol = 12;
         this.cData.Watch.MaxTemp = 900;
         this.cData.Bowl = new Dictionary();
         this.cData.Bowl.Vol = 50;
         this.cData.Bowl.MaxTemp = 199900;
         this.cData.Mc = new Dictionary();
         this.cData.Mc.Vol = 100;
         this.cData.Mc.MaxTemp = 400;
         this.cData.Funnel = new Dictionary();
         this.cData.Funnel.Vol = 100;
         this.cData.Funnel.MaxTemp = 400;
         this.cData.Dropper = new Dictionary();
         this.cData.Dropper.Vol = 5;
         this.cData.Dropper.MaxTemp = 999990;
         this.cData.Saver = new Dictionary();
         this.cData.Saver.Vol = 200;
         this.cData.Saver.MaxTemp = 900;
         this.cData.WSaver = new Dictionary();
         this.cData.WSaver.Vol = 200;
         this.cData.WSaver.MaxTemp = 900;
         this.cData.Spoon = new Dictionary();
         this.cData.Spoon.Vol = 5;
         this.cData.Spoon.MaxTemp = 900;
      }
      
      private function initSb() : void
      {
         this.sbList.C6H6 = "⏣";
         this.sbList.C6H5Br = "⏤";
         this.sbList.C6H5Cl = "⏨";
         this.sbList.C6H6O3S = "⏥";
         this.sbList.C6H5NO2 = "⏦";
         this.sbList.C6H12 = "⏧";
         this.sbList.C6H5OH = "⏴";
         this.sbList.C6H5ONa = "⏵";
         this.sbList.C7H8 = "⏶";
         this.sbList.C6H3Br3O = "⏷";
         this.sbList.C6H3N3O7 = "⏸";
         this.sbList.C7H5N3O6 = "⏹";
         this.sbLists.C6H6 = Number(1);
         this.sbLists.C6H5Br = Number(1.8);
         this.sbLists.C6H5Cl = Number(1.8);
         this.sbLists.C6H6O3S = Number(2);
         this.sbLists.C6H5NO2 = Number(2);
         this.sbLists.C6H5OH = Number(2);
         this.sbLists.C6H5ONa = Number(2);
         this.sbLists.C7H8 = Number(2);
         this.sbLists.C6H3Br3O = Number(2);
         this.sbLists.C6H3N3O7 = Number(2);
         this.sbLists.C7H5N3O6 = Number(2);
      }
      
      public function iSb(st:String) : String
      {
         return this.sbList[st];
      }
      
      public function iSbs(st:String) : Number
      {
         if(this.sbLists[st])
         {
            return this.sbLists[st];
         }
         return 1;
      }
      
      public function MSave() : void
      {
         var i:* = undefined;
         var j:* = undefined;
         this.MSo.data.MDb = new Object();
         for(i in this.MDb)
         {
            if(this.MDb[i] != null)
            {
               if(this.MDb[i].nm != null && this.MDb[i].id != null)
               {
                  this.MSo.data.MDb[i] = new Object();
                  this.MSo.data.MDb[i].nm = this.MDb[i].nm;
                  this.MSo.data.MDb[i].nm2 = this.MDb[i].nm2;
                  this.MSo.data.MDb[i].id = this.MDb[i].id;
                  this.MSo.data.MDb[i].mix = new Array();
                  for(j = 0; j < this.MDb[i].mix.length; j++)
                  {
                     this.MSo.data.MDb[i].mix[j] = new Array();
                     this.MSo.data.MDb[i].mix[j][0] = this.MDb[i].mix[j].cName;
                     this.MSo.data.MDb[i].mix[j][1] = this.MDb[i].mix[j].cMass;
                     this.MSo.data.MDb[i].mix[j][2] = this.MDb[i].mix[j].cTemp;
                  }
                  this.MSo.data.MDb[i].ctn = this.MDb[i].ctn;
               }
            }
         }
         this.MSo.flush();
      }
      
      public function cAddChem(inq:Array, rank:Number = 0) : void
      {
         var nm:String = inq[0];
         this.SDb[nm] = new Dictionary();
         this.SDb[nm].nm = nm;
         this.SDb[nm].fnm = inq[5];
         this.SDb[nm].access = inq[3];
         this.SDb[nm].htmlnm = inq[6];
         this.SDb[nm].tag = inq[2];
         this.SDb[nm].h_c = Number(inq[14]);
         this.SDb[nm].h_d = Number(inq[29]);
         if(inq[7] != "")
         {
            this.SDb[nm].ds1 = Number(inq[7]);
         }
         if(inq[8] != "")
         {
            this.SDb[nm].ds2 = Number(inq[8]);
         }
         if(inq[9] != "")
         {
            this.SDb[nm].ds3 = Number(inq[9]);
         }
         if(inq[7] != "")
         {
            this.SDb[nm].ds4 = 1 - Math.random() * 0.1;
         }
         this.SDb[nm].mp = Number(inq[12]);
         this.SDb[nm].bp = Number(inq[13]);
         this.SDb[nm].mm = Number(inq[10]);
         this.SDb[nm].solu = Number(inq[11]);
         this.SDb[nm].tp = inq[1];
         if(inq[1] == "Organic")
         {
            this.SDb[nm].rank = rank;
         }
         if(inq[12] != "")
         {
            this.SDb[nm].col1 = Number(inq[15]);
         }
         if(inq[13] != "")
         {
            this.SDb[nm].col2 = Number(inq[17]);
         }
         if(inq[14] != "")
         {
            this.SDb[nm].col3 = Number(inq[19]);
         }
         if(inq[15] != "")
         {
            this.SDb[nm].col4 = Number(inq[21]);
         }
         if(inq[16] != "")
         {
            this.SDb[nm].col0 = Number(inq[15]);
         }
         if(inq[17] != "")
         {
            this.SDb[nm].alp = Number(inq[16]);
         }
         if(inq[18] != "")
         {
            this.SDb[nm].alp1 = Number(inq[16]);
         }
         if(inq[19] != "")
         {
            this.SDb[nm].alp2 = Number(inq[18]);
         }
         if(inq[20] != "")
         {
            this.SDb[nm].alp3 = Number(inq[20]);
         }
         if(inq[21] != "")
         {
            this.SDb[nm].alp4 = Number(inq[22]);
         }
         if(inq[23] != "")
         {
            this.SDb[nm].KOH = Number(inq[31]);
         }
         if(inq[24] != "")
         {
            this.SDb[nm].KH = Number(inq[33]);
         }
         if(inq[25] != "")
         {
            this.SDb[nm].MOH = Number(inq[30]);
         }
         if(inq[26] != "")
         {
            this.SDb[nm].MH = Number(inq[32]);
         }
         if(inq[34] != "")
         {
            this.SDb[nm].ptn1 = inq[34];
         }
         this.SDb[nm].aname = inq[4];
      }
      
      public function cAddReq(inq:Array) : void
      {
         var nm:String = inq[0];
         this.SDb[nm] = new Dictionary();
         this.SDb[nm].nm = nm;
         this.SDb[nm].htmlnm = inq[1];
         this.SDb[nm].h_c = Number(inq[2]);
         this.SDb[nm].h_d = Number(inq[3]);
         if(inq[4] != "")
         {
            this.SDb[nm].ds1 = Number(inq[4]);
         }
         if(inq[5] != "")
         {
            this.SDb[nm].ds2 = Number(inq[5]);
         }
         if(inq[6] != "")
         {
            this.SDb[nm].ds3 = Number(inq[6]);
         }
         if(inq[7] != "")
         {
            this.SDb[nm].ds4 = Number(inq[7]);
         }
         this.SDb[nm].mp = Number(inq[8]);
         this.SDb[nm].bp = Number(inq[9]);
         this.SDb[nm].mm = Number(inq[10]);
         this.SDb[nm].solu = Number(inq[11]);
         if(inq[12] != "")
         {
            this.SDb[nm].col1 = Number(inq[12]);
         }
         if(inq[13] != "")
         {
            this.SDb[nm].col2 = Number(inq[13]);
         }
         if(inq[14] != "")
         {
            this.SDb[nm].col3 = Number(inq[14]);
         }
         if(inq[15] != "")
         {
            this.SDb[nm].col4 = Number(inq[15]);
         }
         if(inq[16] != "")
         {
            this.SDb[nm].col0 = Number(inq[16]);
         }
         if(inq[17] != "")
         {
            this.SDb[nm].alp = Number(inq[17]);
         }
         if(inq[18] != "")
         {
            this.SDb[nm].alp1 = Number(inq[18]);
         }
         if(inq[19] != "")
         {
            this.SDb[nm].alp2 = Number(inq[19]);
         }
         if(inq[20] != "")
         {
            this.SDb[nm].alp3 = Number(inq[20]);
         }
         if(inq[21] != "")
         {
            this.SDb[nm].alp4 = Number(inq[21]);
         }
         this.SDb[nm].tp = inq[3];
         if(inq[23] != "")
         {
            this.SDb[nm].KOH = Number(inq[23]);
         }
         if(inq[24] != "")
         {
            this.SDb[nm].KH = Number(inq[24]);
         }
         if(inq[25] != "")
         {
            this.SDb[nm].MOH = Number(inq[25]);
         }
         if(inq[26] != "")
         {
            this.SDb[nm].MH = Number(inq[26]);
         }
         if(inq[27] != "")
         {
            this.SDb[nm].ptn1 = inq[27];
         }
         if(inq[28] != "")
         {
            this.SDb[nm].ptn2 = inq[28];
         }
         if(inq[29] != "")
         {
            this.SDb[nm].ptn3 = inq[29];
         }
         if(inq[30] != "")
         {
            this.SDb[nm].aname = inq[30];
         }
         this.cCloudSave(nm,this.SDb[nm]);
      }
      
      public function cAddReaction(inq:Array) : void
      {
         var i:* = undefined;
         var j:* = undefined;
         var nm:String = inq[0];
         this.RDb[nm] = new Dictionary();
         this.RDb[nm].nm = nm;
         this.RDb[nm].cA = inq[2].split("-");
         for(i in this.RDb[nm].cA)
         {
            this.RDb[nm][this.RDb[nm].cA[i]] = Number(inq[4].split("-")[i]);
         }
         this.RDb[nm].cS = inq[6].split("-");
         this.RDb[nm].cP = inq[3].split("-");
         for(j in this.RDb[nm].cP)
         {
            this.RDb[nm][this.RDb[nm].cP[j]] = Number(inq[4].split("-")[j + i + 1]);
         }
         if(inq[5] == "Ignite")
         {
            this.RDb[nm].Temp = "Ignite";
         }
         else if(inq[5] == "Shock")
         {
            this.RDb[nm].Temp = "Shock";
         }
         else
         {
            this.RDb[nm].Temp = [Number(inq[5].split("-")[0]),Number(inq[5].split("-")[1])];
         }
         this.RDb[nm].cHR = Number(inq[8]);
         this.RDb[nm].cSpeed = Number(inq[1]);
         this.RDb[nm].Type = "";
         if(inq[7] != "")
         {
            this.RDb[nm].cEff = inq[7];
            this.RDb[nm].cIgnCol = Number(inq[9]);
            this.RDb[nm].cIgnAlp = Number(0.9);
         }
         if(inq[10] != "")
         {
            this.RDb[nm].cata = inq[10];
            if(inq[4].split("-")[j + i + 2] != null)
            {
               this.RDb[nm].cataN = Number(inq[4].split("-")[j + i + 2]);
            }
         }
      }
      
      public function cAddReqR(inq:Array) : void
      {
         var i:* = undefined;
         var j:* = undefined;
         var nm:String = inq[0];
         this.RDb[nm] = new Dictionary();
         this.RDb[nm].nm = nm;
         this.RDb[nm].cA = inq[1].split("_");
         for(i in this.RDb[nm].cA)
         {
            this.RDb[nm][this.RDb[nm].cA[i]] = Number(inq[2].split("_")[i]);
         }
         this.RDb[nm].cS = inq[3].split("_");
         this.RDb[nm].cP = inq[4].split("_");
         for(j in this.RDb[nm].cP)
         {
            this.RDb[nm][this.RDb[nm].cP[j]] = Number(inq[5].split("_")[j]);
         }
         this.RDb[nm].Temp = [Number(inq[6].split("_")[0]),Number(inq[6].split("_")[1])];
         this.RDb[nm].cHR = Number(inq[7]);
         this.RDb[nm].cSpeed = Number(inq[8]);
         this.RDb[nm].Type = inq[9];
         if(inq[10] != "")
         {
            this.RDb[nm].cIgn = true;
            this.RDb[nm].cIgnCol = Number(inq[10]);
            this.RDb[nm].cIgnAlp = Number(inq[11]);
         }
         if(inq[12] != "")
         {
            this.RDb[nm].cDet = true;
         }
         if(inq[13] == "1")
         {
            this.RDb[nm].cExp = true;
         }
         else if(inq[13] == "2")
         {
            this.RDb[nm].cExp = true;
            this.RDb[nm].cGExp = true;
         }
         if(inq[14] != "")
         {
            this.RDb[nm].cEff = Number(inq[14]);
         }
         if(inq[15] != "")
         {
            this.RDb[nm].multi = Number(inq[15]);
         }
         this.cCloudSaver(nm,this.RDb[nm]);
      }
      
      public function cSaveVersion(v:String) : void
      {
         this.CSv.data.versions = v;
         this.CSv.flush();
      }
      
      public function cLoadVersion() : void
      {
         this.cCloudVersion = this.CSv.data.versions;
      }
      
      private function cCloudSave(nm:String, o:Object) : void
      {
         var i:* = undefined;
         this.CSo.data[nm] = new Object();
         for(i in o)
         {
            this.CSo.data[nm][i] = o[i];
         }
         this.CSo.flush();
      }
      
      private function cCloudSaver(nm:String, o:Object) : void
      {
         var i:* = undefined;
         this.CSor.data[nm] = new Object();
         for(i in o)
         {
            this.CSor.data[nm][i] = o[i];
         }
         this.CSor.flush();
      }
      
      private function cCloudLoad() : void
      {
         var i:* = undefined;
         var nm:* = undefined;
         var j:* = undefined;
         for(i in this.CSo.data)
         {
            nm = this.CSo.data[i]["nm"];
            this.SDb[nm] = new Dictionary();
            for(j in this.CSo.data[i])
            {
               this.SDb[nm][j] = this.CSo.data[i][j];
            }
         }
      }
      
      private function cCloudLoadr() : void
      {
         var i:* = undefined;
         var nm:* = undefined;
         var j:* = undefined;
         for(i in this.CSor.data)
         {
            nm = this.CSor.data[i]["nm"];
            this.RDb[nm] = new Dictionary();
            for(j in this.CSor.data[i])
            {
               this.RDb[nm][j] = this.CSor.data[i][j];
            }
         }
      }
      
      public function iLoad() : void
      {
         this.cDm.sS.myLab.iLoad();
      }
      
      public function iGetFml(t:String, note:Boolean = false) : String
      {
         var i:* = undefined;
         var j:* = undefined;
         var r:String = null;
         var n:String = null;
         var cnm:String = null;
         var r2:String = null;
         var cnm2:String = null;
         var n2:String = null;
         var s:String = "";
         if(t.split("_")[0] == t.split("_")[1])
         {
            t = t.split("_")[0];
         }
         if(this.RDb[t] != null)
         {
            for(i in this.RDb[t].cA)
            {
               r = this.RDb[t].cA[i];
               if(this.RDb[t].cA[i] != 0 && this.RDb[t][r] != 0)
               {
                  if(i != 0)
                  {
                     s += " + ";
                  }
                  n = "";
                  if(this.RDb[t][r] != 1)
                  {
                     n = String(this.RDb[t][r]);
                  }
                  cnm = this.SDb[r].htmlnm;
                  if(this.sbList[r] == null)
                  {
                     s += n + iSubscriptor.iSub(cnm);
                  }
                  else if(!note)
                  {
                     s += n + "<font size=\'" + String(60 * this.iSbs(cnm)) + "\'>" + this.iSb(cnm) + "</font>";
                  }
                  else
                  {
                     s += n + "<font size=\'" + String(11 * this.iSbs(cnm)) + "\'>" + this.iSb(cnm) + "</font>";
                  }
               }
            }
            if(this.RDb[t].cata != null)
            {
               if(this.RDb[t].cataN)
               {
                  s += " + ";
                  if(this.RDb[t].cataN > 1)
                  {
                     s += String(this.RDb[t].cataN);
                  }
                  s += iSubscriptor.iSub("H2O");
               }
            }
            s += " = ";
            for(j in this.RDb[t].cP)
            {
               if(j != 0)
               {
                  s += " + ";
               }
               r2 = this.RDb[t].cP[j];
               cnm2 = this.SDb[r2].htmlnm;
               n2 = "";
               if(this.RDb[t][r2] != 1)
               {
                  n2 = String(this.RDb[t][r2]);
               }
               if(this.sbList[r2] == null)
               {
                  s += n2 + iSubscriptor.iSub(this.SDb[r2].htmlnm);
               }
               else if(!note)
               {
                  s += n2 + "<font size=\'" + String(60 * this.iSbs(cnm2)) + "\'>" + this.iSb(cnm2) + "</font>";
               }
               else
               {
                  s += n2 + "<font size=\'" + String(11 * this.iSbs(cnm2)) + "\'>" + this.iSb(cnm2) + "</font>";
               }
            }
         }
         return s;
      }
      
      public function cSaveStar(n:String, i:Boolean) : void
      {
         this.StarSo.data[n] = i;
         this.StarSo.flush();
      }
      
      public function cLoadStar() : void
      {
         var i:* = undefined;
         for(i in this.StarSo.data)
         {
            if(this.StarSo.data[i])
            {
               this.SDb[i].star = true;
            }
         }
      }
      
      private function cReadSave() : void
      {
         var i:* = undefined;
         var names:* = undefined;
         var j:* = undefined;
         var cm:* = undefined;
         if(this.MSo.data.MDb != null)
         {
            for(i in this.MSo.data.MDb)
            {
               if(this.MSo.data.MDb[i] != null)
               {
                  ++this.MDbN;
                  names = i;
                  this.MDb[names] = new Object();
                  this.MDb[names].nm = this.MSo.data.MDb[i].nm;
                  this.MDb[names].nm2 = this.MSo.data.MDb[i].nm2;
                  this.MDb[names].ctn = this.MSo.data.MDb[i].ctn;
                  this.MDb[names].id = this.MSo.data.MDb[i].id;
                  this.MDb[names].mix = new Array();
                  for(j = 0; j < this.MSo.data.MDb[i].mix.length; j++)
                  {
                     cm = this.cDm.cCreatMatter(this.MSo.data.MDb[i].mix[j][0],this.MSo.data.MDb[i].mix[j][1],this.MSo.data.MDb[i].mix[j][2]);
                     this.MDb[names].mix.push(this.cDm.cCore[cm]);
                  }
               }
            }
         }
      }
      
      public function cScan(n:*) : String
      {
         var j:* = undefined;
         var i:* = undefined;
         var k:* = undefined;
         var t1:* = undefined;
         var t2:* = undefined;
         var txt:String = "";
         var counter:Number = 0;
         var po:Array = new Array();
         if(n == 1)
         {
            for(i in this.RDb)
            {
               for(k = 0; k < this.RDb[i].cA.length; k++)
               {
                  t1 = this.RDb[i].cA[k];
                  txt += this.RDb[i][t1] + t1;
                  if(k + 1 == this.RDb[i].cA.length)
                  {
                     break;
                  }
                  txt += "+";
               }
               txt += "→";
               for(j = 0; j < this.RDb[i].cP.length; j++)
               {
                  t2 = this.RDb[i].cP[j];
                  txt += this.RDb[i][t2] + t2;
                  if(j + 1 == this.RDb[i].cP.length)
                  {
                     break;
                  }
                  txt += "+";
               }
               txt += ", (" + this.RDb[i].cS + "), (" + this.RDb[i].Temp + "), " + this.RDb[i].cSpeed + ", " + this.RDb[i].cHR + ", " + this.RDb[i].Type + "\n";
               counter++;
            }
         }
         else
         {
            for(i in this.SDb)
            {
               po.push(this.SDb[i].nm);
               counter++;
            }
         }
         po = po.sort(Array.CASEINSENSITIVE);
         for(j in po)
         {
            txt += po[j] + "\n";
         }
         return txt + ("total: " + counter);
      }
      
      public function cRead(inS:cMatter, n:Number) : Boolean
      {
         var dState:* = undefined;
         var dName:* = inS.cName;
         if(this.SDb[dName] != undefined)
         {
            if(n == 1)
            {
               inS.cBp = this.SDb[dName].bp;
               inS.cMp = this.SDb[dName].mp;
               inS.cMm = this.SDb[dName].mm;
               inS.cRName = this.SDb[dName].htmlnm;
               if(this.SDb[dName].MOH != null)
               {
                  inS.cMOH = this.SDb[dName].MOH;
               }
               else if(this.SDb[dName].MH != null)
               {
                  inS.cMH = this.SDb[dName].MH;
               }
               else if(this.SDb[dName].KOH != null)
               {
                  inS.cKOH = this.SDb[dName].KOH;
               }
               else if(this.SDb[dName].KH != null)
               {
                  inS.cKH = this.SDb[dName].KH;
               }
               inS.cH_C = this.SDb[dName].h_c;
               inS.cSolu = this.SDb[dName].solu;
               if(this.SDb[dName].ptn1 != undefined)
               {
                  inS.cPtn1 = this.SDb[dName].ptn1;
               }
               if(this.SDb[dName].ptn2 != undefined)
               {
                  inS.cPtn2 = this.SDb[dName].ptn2;
               }
               inS.cAlp = this.SDb[dName].alp;
               if(this.SDb[dName].alp2 != null)
               {
                  inS.cAlp2 = this.SDb[dName].alp2;
               }
               inS.cDisHeat = 0;
               if(inS.cSolu > 0)
               {
                  if(this.SDb[dName].h_d != undefined)
                  {
                     inS.cDisHeat = this.SDb[dName].h_d;
                  }
                  else
                  {
                     inS.cDisHeat = 0;
                  }
                  inS.cSoluColor = this.SDb[dName].col4;
                  inS.cAlp4 = this.SDb[dName].alp4;
               }
               return true;
            }
            if(n == 2)
            {
               dState = inS.cState;
               if(this.SDb[dName]["ds" + dState] != null)
               {
                  inS.cDensity = this.SDb[dName]["ds" + dState];
               }
               else if(dState == 1)
               {
                  inS.cDensity = 1.5;
               }
               else if(dState == 2 || dState == 4)
               {
                  inS.cDensity = 1.1;
               }
               else if(dState == 3)
               {
                  inS.cDensity = 0.001;
               }
               if(this.SDb[dName]["col" + dState] != undefined)
               {
                  inS.cColor = this.SDb[dName]["col" + dState];
               }
               else
               {
                  inS.cColor = this.SDb[dName].col0;
               }
               return true;
            }
         }
         return false;
      }
      
      public function cLoad(inS:String, inN:String) : *
      {
         var cTemp:* = undefined;
         var cState:* = undefined;
         var cBp:* = undefined;
         var cMp:* = undefined;
         var sp:* = undefined;
         var dName:* = inS;
         if(this.SDb[dName] != null)
         {
            if(inN == "cState")
            {
               cTemp = this.cDm.sTemp;
               cState = 0;
               cBp = this.cLoad(dName,"bp");
               cMp = this.cLoad(dName,"mp");
               if(cTemp > cBp)
               {
                  cState = 3;
               }
               else if(cTemp > cMp && cTemp < cBp)
               {
                  cState = 2;
               }
               else if(cTemp < cMp)
               {
                  cState = 1;
               }
               return cState;
            }
            if(inN == "cDensity")
            {
               cTemp = this.cDm.sTemp;
               cState = 0;
               cBp = this.cLoad(dName,"bp");
               cMp = this.cLoad(dName,"mp");
               if(cTemp > cBp)
               {
                  cState = 3;
               }
               else if(cTemp > cMp && cTemp < cBp)
               {
                  cState = 2;
               }
               else if(cTemp < cMp)
               {
                  cState = 1;
               }
               if(this.cLoad(dName,"ds" + cState) != null)
               {
                  return this.cLoad(dName,"ds" + cState);
               }
               if(cState == 1)
               {
                  return 1.5;
               }
               if(cState == 2 || cState == 4)
               {
                  return 1.1;
               }
               return 0.001;
            }
            if(inN == "Alp")
            {
               cState = this.cLoad(dName,"cState");
               sp = this.SDb[dName]["alp" + cState];
               if(sp != null)
               {
                  return sp;
               }
               return this.SDb[dName]["alp"];
            }
            if(inN == "Col")
            {
               cState = this.cLoad(dName,"cState");
               sp = this.SDb[dName]["col" + cState];
               if(sp != null)
               {
                  return sp;
               }
               return this.SDb[dName]["col0"];
            }
            return this.SDb[dName][inN];
         }
         return 0;
      }
      
      public function cTry(inS1:cMatter, inS2:*, multi:uint = 0, cataGroup:cGroup = null, fire:Boolean = false, shock:Boolean = false) : cReaction
      {
         var rct_temp:* = undefined;
         var ary_tempS:* = undefined;
         var ary_temp0:* = undefined;
         var ary_temp:* = undefined;
         var id:String = null;
         var pass1:Boolean = false;
         var pass2:Boolean = false;
         var allgas_temp:* = undefined;
         var rct_temp2:cReaction = null;
         var rct_temp4:cReaction = null;
         var rct_temp3:cReaction = null;
         if(inS2 != null)
         {
            ary_temp0 = [inS1,inS2];
            if(ary_temp0[0].cState == 1 && ary_temp0[1].cState == 1)
            {
               ary_temp = ary_temp0.sortOn("cName");
            }
            else if(ary_temp0[0].cState == 2 && ary_temp0[1].cState == 2)
            {
               ary_temp = ary_temp0.sortOn("cName");
            }
            else if(ary_temp0[0].cState == 1 && ary_temp0[1].cState == 2)
            {
               ary_temp = ary_temp0;
            }
            else if(ary_temp0[0].cState == 2 && ary_temp0[1].cState == 1)
            {
               ary_temp = [ary_temp0[1],ary_temp0[0]];
            }
            else if(ary_temp0[0].cState == 1 && ary_temp0[1].cState == 3)
            {
               ary_temp = ary_temp0;
            }
            else if(ary_temp0[0].cState == 3 && ary_temp0[1].cState == 1)
            {
               ary_temp = [ary_temp0[1],ary_temp0[0]];
            }
            else if(ary_temp0[0].cState == 2 && ary_temp0[1].cState == 3)
            {
               ary_temp = [ary_temp0[0],ary_temp0[1]];
            }
            else if(ary_temp0[0].cState == 3 && ary_temp0[1].cState == 2)
            {
               ary_temp = [ary_temp0[1],ary_temp0[0]];
            }
            else if(ary_temp0[0].cState == 3 && ary_temp0[1].cState == 4)
            {
               ary_temp = [ary_temp0[1],ary_temp0[0]];
            }
            else if(ary_temp0[0].cState == 4 && ary_temp0[1].cState == 3)
            {
               ary_temp = [ary_temp0[0],ary_temp0[1]];
            }
            else if(ary_temp0[0].cState == 2 && ary_temp0[1].cState == 4)
            {
               ary_temp = [ary_temp0[0],ary_temp0[1]];
            }
            else if(ary_temp0[0].cState == 4 && ary_temp0[1].cState == 2)
            {
               ary_temp = [ary_temp0[1],ary_temp0[0]];
            }
            else if(ary_temp0[0].cState == 1 && ary_temp0[1].cState == 4)
            {
               ary_temp = [ary_temp0[0],ary_temp0[1]];
            }
            else if(ary_temp0[0].cState == 4 && ary_temp0[1].cState == 1)
            {
               ary_temp = [ary_temp0[1],ary_temp0[0]];
            }
            else
            {
               ary_temp = ary_temp0.sortOn("cName");
            }
            if(multi > 0)
            {
               id = ary_temp[0].cName + "_" + ary_temp[1].cName + "_" + String(2);
               rct_temp = this.RDb[id];
            }
            else
            {
               id = ary_temp[0].cName + "_" + ary_temp[1].cName;
               rct_temp = this.RDb[id];
            }
         }
         else
         {
            ary_temp = [inS1];
            if(multi > 0)
            {
               id = inS1.cName + "_" + String(2);
               rct_temp = this.RDb[id];
            }
            else
            {
               id = inS1.cName;
               rct_temp = this.RDb[id];
            }
         }
         if(rct_temp != undefined)
         {
            if(inS2 != null)
            {
               pass1 = false;
               pass2 = false;
               if(Math.abs(rct_temp.cS[0] - ary_temp[0].cState) < 1)
               {
                  pass1 = true;
               }
               if(Math.abs(rct_temp.cS[1] - ary_temp[1].cState) < 1)
               {
                  pass2 = true;
               }
               if(rct_temp.cS[0] == 2 && ary_temp[0].cState == 4)
               {
                  pass1 = true;
               }
               if(rct_temp.cS[1] == 2 && ary_temp[1].cState == 4)
               {
                  pass2 = true;
               }
               if(!pass1 || !pass2)
               {
                  return;
               }
               allgas_temp = true;
               if(inS1.cState == 3 && inS2.cState == 3)
               {
                   allgas_temp = false;
                }
                if(rct_temp.cata != null)
                {
                   // Catalyst check disabled - always allow reactions
                   // if(!cataGroup.cHasSub(rct_temp.cata))
                   // {
                   //    return null;
                   // }
                }
                 if(rct_temp.Temp == "Ignite")
                {
                   // Ignite check disabled - always allow reactions
                   rct_temp2 = new cReaction(inS1,inS2,rct_temp,id);
                   if(rct_temp.Type != undefined)
                   {
                      rct_temp2.cTp = rct_temp.Type;
                   }
                   return rct_temp2;
                }
                if(rct_temp.Temp == "Shock")
                {
                   // Shock check disabled - always allow reactions
                   rct_temp2 = new cReaction(inS1,inS2,rct_temp,id);
                   if(rct_temp.Type != undefined)
                   {
                      rct_temp2.cTp = rct_temp.Type;
                   }
                   return rct_temp2;
                }
                // Temperature range check disabled - always allow reactions
                rct_temp2 = new cReaction(inS1,inS2,rct_temp,id);
                if(rct_temp.Type != undefined)
                {
                   rct_temp2.cTp = rct_temp.Type;
                }
                return rct_temp2;
            }
            else
            {
                // Catalyst check disabled - reactions work without catalysts
                // if(rct_temp.cata != null)
                // {
                //    if(!cataGroup.cHasSub(rct_temp.cata))
                //    {
                //       return null;
                //    }
                // }
               if(Math.abs(rct_temp.cS[0] - ary_temp[0].cState) < 1 || rct_temp.cS[0] == 2 && ary_temp[0].cState == 4)
               {
                  if(rct_temp.Temp == "Ignite")
                  {
                     if(fire)
                     {
                        rct_temp4 = new cReaction(inS1,inS1,rct_temp,id);
                        if(rct_temp.Type != undefined)
                        {
                           rct_temp4.cTp = rct_temp.Type;
                        }
                        return rct_temp4;
                     }
                     return undefined;
                  }
                  if(rct_temp.Temp == "Shock")
                  {
                     if(shock)
                     {
                        rct_temp3 = new cReaction(inS1,inS1,rct_temp,id);
                        if(rct_temp.Type != undefined)
                        {
                           rct_temp3.cTp = rct_temp.Type;
                        }
                        return rct_temp3;
                     }
                     return undefined;
                  }
                  if(inS1.cTemp > rct_temp.Temp[0] && inS1.cTemp < rct_temp.Temp[1])
                  {
                     rct_temp3 = new cReaction(inS1,inS1,rct_temp,id);
                     if(rct_temp.Type != undefined)
                     {
                        rct_temp3.cTp = rct_temp.Type;
                     }
                     return rct_temp3;
                  }
               }
               else if(rct_temp.multi == 2)
               {
                  return this.cTry(inS1,null,1);
               }
            }
         }
         return undefined;
      }
   }
}

