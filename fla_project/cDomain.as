package
{
   import flash.utils.*;
   
   public class cDomain
   {
      
      public var cCore:Dictionary = new Dictionary(true);
      
      public var cCoreN:int = 0;
      
      public var cBox:Dictionary = new Dictionary(true);
      
      public var cFmlBox:*;
      
      public var cFmlBoxId:String = "";
      
      public var cFmlBoxIdD:*;
      
      public var cDbs:cDb;
      
      public var cCL:cCloudLab = new cCloudLab();
      
      public var cSpeed:Number = 1;
      
      public var sTemp:Number = 25;
      
      public var sAtmN:Number = 1;
      
      public var sAtm:Array = new Array();
      
      public var sAtmPct:Array = new Array();
      
      public var sCircle:Number = 20;
      
      public var sExp:Boolean = true;
      
      public var sKid:Boolean = true;
      
      public var sLeak:Boolean = true;
      
      public var sGlow:Boolean = true;
      
      public var sIgn:Boolean = true;
      
      public var sLb1:* = 0;
      
      public var sLb2:* = 3;
      
      public var sLbAry:* = ["","cMass","cVol","cMolar","cTemp","cMol"];
      
      public var sCol1:* = 16777215;
      
      public var sCol2:* = 5943039;
      
      public var sCol3:* = 10066329;
      
      public var sCol4:* = 15628799;
      
      public var sFml:Boolean = true;
      
      public var sMgn:* = true;
      
      public var sAch:* = true;
      
      public var sSound:* = true;
      
      public var sColDesk:* = 1986948;
      
      public var sColPen:* = 0;
      
      public var sColBack:* = 0;
      
      public var sLeakSpd:* = 1;
      
      public var sFilter:* = 0.00001;
      
      public var sIgnTemp:* = 900;
      
      public var sFrzTemp:* = -100;
      
      public var sAuto:* = false;
      
      public var sS:*;
      
      public var LabType:Number = 0;
      
      public function cDomain(s:*, t:*)
      {
         super();
         this.LabType = t;
         this.sS = s;
         this.sAtmN = 1;
         this.sAtm = ["O2"];
         this.sAtmPct = [Number(1)];
      }
      
      public function cFocus(b:Boolean) : void
      {
         if(b)
         {
            this.sCircle = 20;
         }
         else
         {
            this.sCircle = 20;
         }
      }
      
      public function cRemove(inName:String) : *
      {
         this.cCore[inName].cLife = false;
         this.cCore[inName] = null;
      }
      
      public function cRemove2(inName:String) : *
      {
         trace(inName);
         this.cBox[inName].cLife = false;
         this.cBox[inName] = null;
      }
      
      public function cCreatMatter(inName:String, inMass:Number, inTemp:Number) : String
      {
         var nm_temp:* = inName + "_" + String(this.cCoreN);
         this.cCore[nm_temp] = new cMatter(inName,inMass,inTemp,this);
         this.cCore[nm_temp].cSign = this.cCoreN;
         ++this.cCoreN;
         return nm_temp;
      }
      
      public function cCreate(inNm:*, inType:*, inLink:*, inType2:*) : *
      {
         switch(inType)
         {
            case "cDevice":
               this.cBox[inNm] = new cDevice(inLink,inType2,this);
               this.cBox[inNm].cKind = inType;
               this.cBox[inNm].cName = inNm;
               break;
            case "cHeater":
               this.cBox[inNm] = new cHeater(inType2,this);
               this.cBox[inNm].cKind = inType;
               this.cBox[inNm].cName = inNm;
               break;
            case "cTube":
               this.cBox[inNm] = new cTube(inType2,this);
               this.cBox[inNm].cKind = inType;
               this.cBox[inNm].cName = inNm;
               break;
            case "cStructure":
               this.cBox[inNm] = new cStructure(inType2,this);
               this.cBox[inNm].cKind = inType;
               this.cBox[inNm].cName = inNm;
               break;
            case "cTripod":
               this.cBox[inNm] = new cStructure(inType2,this);
               this.cBox[inNm].cKind = inType;
               this.cBox[inNm].cName = inNm;
               break;
            case "cGroup":
               this.cBox[inNm] = new cGroup(this);
               this.cBox[inNm].cName = inNm;
         }
      }
      
      public function cExist() : *
      {
         var i:* = undefined;
         for(i in this.cBox)
         {
            if(this.cBox[i] != null)
            {
               this.cBox[i].cExist();
            }
         }
      }
      
      public function cData(inS:*, conf:*) : *
      {
         return this.cDbs.cData[inS.cType][conf];
      }
      
      public function cNoteFml(inID:String, inIDD:*) : *
      {
         this.cFmlBoxIdD = inIDD;
         this.cFmlBoxId = inID;
      }
   }
}

