package
{
   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   import flash.sensors.*;
   import flash.utils.*;
   
   public class iLab extends Sprite
   {
      
      public var iBox:Object = new Object();
      
      public var iDrag:Boolean = false;
      
      public var iDsk:iDesk = new iDesk();
      
      public var iDeviceBox:MovieClip = new MovieClip();
      
      public var LabSo:SharedObject = SharedObject.getLocal("Chemist_Lab50");
      
      public var cDm:cDomain;
      
      public var iFmls:iFml = new iFml();
      
      public var iTap:Boolean = false;
      
      public var iShowHelp:Boolean = false;
      
      public var iShowDevice:Boolean = true;
      
      public var iShowDesktop:Boolean = true;
      
      public var iShowEdge:Boolean = true;
      
      public var iSelect:*;
      
      public var iObject:*;
      
      public var num:Number = 1;
      
      public var iIsIgn:Boolean = false;
      
      public var iPreIgn:Boolean = false;
      
      public var iIsFrz:Boolean = false;
      
      public var ipH:Boolean = false;
      
      public var iGr:Boolean = false;
      
      public var iDt:Boolean = false;
      
      public var iDr:Boolean = false;
      
      public var iExt:Boolean = false;
      
      public var iDoLink:Number = 0;
      
      public var iDoLink1:*;
      
      public var iDoLink2:iDevice;
      
      public var iTheLink:iTube;
      
      public var iIsTube:Boolean = false;
      
      public var iIsLid:Boolean = false;
      
      public var iRsObj:String;
      
      public var iCtrl:iControl = new iControl();
      
      public var iPdNum:int = 0;
      
      public var shineObj:*;
      
      public var iPhase:Number = 1;
      
      public var iDvNum:Number = 0;
      
      public var rollingX:Number = 0;
      
      public var rollingY:Number = 0;
      
      public var rollingZ:Number = 0;
      
      private const FACTOR:Number = 0.25;
      
      private var ZaxAcc:Accelerometer = new Accelerometer();
      
      public var mSd:Dictionary = new Dictionary();
      
      public var myReport:iReport;
      
      private var iStoreTime:Number = 0;
      
      private var LoadLoader:URLLoader = new URLLoader();
      
      private var iFmlBox:String = "";
      
      private var iFmlA:Number = 1;
      
      private var iFmlN:Number = -1;
      
      private var iFmlPool:Object = new Object();
      
      public function iLab(inDm:*)
      {
         super();
         this.cDm = inDm;
         this.iDsk.x = 512;
         this.iDsk.y = 384;
         this.iDsk.stop();
         this.iFmls.x = 512;
         this.iFmls.y = 220;
         this.iDeviceBox.mouseEnabled = false;
         addChild(this.iDsk);
         addChild(this.iDeviceBox);
         addChild(this.iCtrl);
         addChild(this.iFmls);
         this.myReport = new iReport(this.cDm,this);
         this.iCtrl.visible = false;
         this.iDsk.addEventListener(MouseEvent.CLICK,this.d_cancelAll);
         this.mSd.inmLeak = new mLeak();
         this.mSd.inmSLeak = new mSLeak();
         this.mSd.inmWater = new mWater();
         this.mSd.inmTap = new mDrip();
         this.mSd.inmTap2 = new mDrip2();
         this.mSd.inmLight = new mLight();
         this.mSd.inmDrop = new mDrop();
         this.mSd.inmDropHeater = new mDropHeater();
         this.mSd.inmIgn = new mIgn();
         this.mSd.inmIr = new mIr();
         this.mSd.inmRing = new mRing();
         this.mSd.inmPreIgn = new mPreIgn();
         this.mSd.inmFrz = new mFrz();
         this.mSd.inmFrzed = new mFrzed();
         this.mSd.inmClear = new mClear();
         this.mSd.inmDelete = new mDelete();
         this.mSd.inmFlame = new mFlame();
         this.mSd.inmFlame2 = new mFlame2();
         this.mSd.inmFreeze = new mFreeze();
         this.mSd.inmReset = new mReset();
         this.mSd.inmAch = new mAch();
      }
      
      private function Zax() : void
      {
         this.iDsk.Bmp.x = -this.rollingX * 30;
         this.iDsk.Bmp.y = this.rollingY * 20;
      }
      
      internal function accelRollingAvg(event:AccelerometerEvent) : void
      {
         this.Zax();
      }
      
      private function hides() : void
      {
      }
      
      public function iDvNumSet(n:Number) : void
      {
         this.iDvNum += n;
         if(this.iDvNum == 0)
         {
            root["pPan"].bset.pRefresh.visible = false;
         }
         else
         {
            root["pPan"].bset.pRefresh.visible = true;
         }
      }
      
      private function d_cancelAll(e:*) : *
      {
         this.cancelAll2();
      }
      
      public function cancelAll() : *
      {
         if(this.iSelected != null)
         {
            this.iSelected = null;
         }
      }
      
      public function cancelAll2() : *
      {
         if(this.iSelected != null)
         {
            this.iSelected = null;
         }
         else if(root["pPan"].iCreator.currentFrame != 4)
         {
         }
      }
      
      public function iInitLink() : void
      {
         trace(this.iTheLink,this.iDoLink1);
         this.iTheLink.iLinkTo1(this.iDoLink1);
      }
      
      public function iCreateLink() : void
      {
         this.iTheLink.iLinkTo2(this.iDoLink2);
         this.myReport.NewAction(ActionType.LINKTUBE,this.iDoLink1.iUID,this.iDoLink2.iUID);
      }
      
      public function get iSelected() : *
      {
         return this.iSelect;
      }
      
      public function set iSelected(obj:*) : void
      {
         this.iSelect = obj;
         if(obj != null)
         {
            this.iObject = obj;
         }
         this.iCtrl.iSet(obj);
      }
      
      public function get iIgn() : Boolean
      {
         return this.iIsIgn;
      }
      
      public function set iIgn(obj:Boolean) : void
      {
         this.iIsIgn = obj;
         if(obj)
         {
            this.iFrz = false;
         }
      }
      
      public function get iFrz() : Boolean
      {
         return this.iIsFrz;
      }
      
      public function set iFrz(obj:Boolean) : void
      {
         this.iIsFrz = obj;
         if(obj)
         {
            this.iIgn = false;
         }
      }
      
      public function iClear(n:*) : *
      {
         var i:* = undefined;
         var sc:Boolean = false;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(Boolean(this.iBox[i].iIsExp) || Boolean(n == 2) && Boolean(this.iBox[i].iLife))
               {
                  this.iBox[i].iDelete(true);
                  sc = true;
               }
            }
         }
         if(sc)
         {
            if(n == 2)
            {
               this.mSd.inmReset.play();
            }
            else
            {
               this.mSd.inmClear.play();
            }
         }
         this.iSelected = null;
         if(n == 1)
         {
            this.myReport.NewAction(ActionType.CLEAN);
         }
         else
         {
            root["pPan"].iRollingClear();
            this.myReport.NewReport();
         }
      }
      
      public function iHitDsk(inS1:*) : *
      {
         return this.iDsk.hitObj.hitTestPoint(inS1.x,inS1.y,true);
      }
      
      public function iHitCm(inS1:*) : Boolean
      {
         if(inS1.iType == "Beaker1" || inS1.iType == "Beaker2" || inS1.iType == "Awl" || inS1.iType == "Awl2" || inS1.iType == "Boiler" || inS1.iType == "Boiler2" || inS1.iType == "GasBottle")
         {
            return root["pPan"].iCreator.currentFrame == 4 && inS1.y < 240;
         }
         return false;
      }
      
      public function iHitTap(inS1:*) : *
      {
         var i:* = undefined;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(this.iBox[i].iLife)
               {
                  if(this.iBox[i].iGenr == "Container")
                  {
                     if(this.iBox[i].iHitObj2.hitTestPoint(mouseX,mouseY,false))
                     {
                        return this.iBox[i];
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function iHitTool(o:*) : *
      {
         var i:* = undefined;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(this.iBox[i].iLife)
               {
                  if(this.iBox[i].iGenr == "Container")
                  {
                     if(this.iBox[i].iHitObj2.hitTestPoint(o.x,o.y,false))
                     {
                        return this.iBox[i];
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function iCleanMove(x1:Number) : void
      {
         var i:* = undefined;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(this.iBox[i].iIsExp)
               {
                  this.iBox[i].x += x1;
               }
            }
         }
      }
      
      public function iHitToolPoint(x1:Number, y1:Number) : *
      {
         var i:* = undefined;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(this.iBox[i].iLife)
               {
                  if(this.iBox[i].iGenr == "Container")
                  {
                     if(!this.iBox[i].iPouring)
                     {
                        if(this.iBox[i].iHitObj2.hitTestPoint(x1,y1,false))
                        {
                           return this.iBox[i];
                        }
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function iHitToolPointDr(x1:Number, y1:Number) : *
      {
         var i:* = undefined;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(this.iBox[i].iLife)
               {
                  if(this.iBox[i].iGenr == "Container")
                  {
                     if(!this.iBox[i].iPouring)
                     {
                        if(this.iBox[i].iHitObj.hitTestPoint(x1,y1,false))
                        {
                           return this.iBox[i];
                        }
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function iHitToolPointHeat(x1:Number, y1:Number) : *
      {
         var i:* = undefined;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(this.iBox[i].iLife)
               {
                  if(this.iBox[i].iGenr == "Container")
                  {
                     if(this.iBox[i].iHitObj2.hitTestPoint(x1,y1,false))
                     {
                        return this.iBox[i];
                     }
                  }
                  else if(this.iBox[i].iGenr == "Heater")
                  {
                     if(this.iBox[i].iHitObj.hitTestPoint(x1,y1,false))
                     {
                        return this.iBox[i];
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function iHitDev(inS1:*) : *
      {
         var i:* = undefined;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(Boolean(this.iBox[i].iLife) && this.iBox[i] != inS1)
               {
                  if(this.iBox[i].iGenr == "Container")
                  {
                     if(this.iBox[i].iHitObj2.hitTestPoint(inS1.x,inS1.y,false))
                     {
                        if(!this.iBox[i].iIsLid && !inS1.iIsTube)
                        {
                           return this.iBox[i];
                        }
                     }
                  }
                  else if(this.iBox[i].iGenr == "Structure")
                  {
                     if(this.iBox[i].iHitObj2.hitTestObject(inS1.iHitObj))
                     {
                        if(this.iBox[i].iScanLink(inS1,0))
                        {
                           return null;
                        }
                        if(this.iBox[i].iType == "Tripod")
                        {
                           return null;
                        }
                        return this.iBox[i];
                     }
                     if(this.iBox[i].iSr.hitTestObject(inS1.iHitObj))
                     {
                        if(this.iBox[i].iScanLink(inS1,1))
                        {
                           return null;
                        }
                        if(this.iBox[i].iType == "Tripod" && inS1.iType == "Funnel" || this.iBox[i].iType == "Tripod" && inS1.iType == "TT")
                        {
                           return null;
                        }
                        return this.iBox[i].iSr;
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function iHitForHeater(inS1:*) : *
      {
         var i:* = undefined;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(Boolean(this.iBox[i].iLife) && this.iBox[i] != inS1)
               {
                  if(this.iBox[i].iType == "SteelStand")
                  {
                     if(this.iBox[i].iHitObj2.hitTestObject(inS1.iHitObj2))
                     {
                        if(this.iBox[i].iScanLink(inS1,0))
                        {
                           return null;
                        }
                        return this.iBox[i];
                     }
                  }
                  else if(this.iBox[i].iType == "Tripod")
                  {
                     if(this.iBox[i].iHitObj.hitTestObject(inS1.iHitObj2))
                     {
                        if(this.iBox[i].iScanLink(inS1,0))
                        {
                           return null;
                        }
                        return this.iBox[i];
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function iHitTripod(inS1:*) : Object
      {
         var i:* = undefined;
         var obj_temp:* = undefined;
         var ay:Number = NaN;
         var f_temp:* = 0;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(this.iBox[i].iGenr == "Heater" && Boolean(this.iBox[i].iLife))
               {
                  if(inS1.iType == "Tripod")
                  {
                     ay = 0;
                  }
                  if(Boolean(inS1.iHitObj.hitTestObject(this.iBox[i].iHitObj2)) && this.iBox[i] != inS1)
                  {
                     if(this.iBox[i].iLinked == "")
                     {
                        f_temp = 2;
                        break;
                     }
                  }
               }
            }
         }
         obj_temp = new Object();
         obj_temp.isHit = f_temp;
         obj_temp.byObj = this.iBox[i];
         return obj_temp;
      }
      
      public function iHitHeater(inS1:*) : Boolean
      {
         var i:* = undefined;
         var f_temp:* = 0;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(this.iBox[i].iType == "Heater" && Boolean(this.iBox[i].iIsIgn))
               {
                  if(Boolean(this.iBox[i].hitTestObject(inS1)) || Boolean(inS1.hitTestObject(this.iBox[i])))
                  {
                     this.iBox[i].iDoIgn(false);
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function iLink(inS1:*, inS2:*, types:*) : *
      {
         inS1.iLinkTo(inS2,types);
         inS2.iLink = inS1;
         this.myReport.NewAction(ActionType.PUT,inS1.iUID,inS2.iUID);
         if(inS1.iType == "Tripod" && inS2.iType == "Heater")
         {
            inS2.iIsLink = false;
         }
         else
         {
            inS2.iIsLink = true;
         }
         inS1.iIsLink = true;
         this.iSortDepth();
      }
      
      public function iCreate(inNm:*, inType:*, inLink:*) : *
      {
         switch(inType)
         {
            case "iDevice":
               this.iBox[inNm] = new iDevice(inLink,this,inNm);
               this.iDeviceBox.addChild(this.iBox[inNm]);
               break;
            case "iHeater1":
               this.iBox[inNm] = new iHeater(inLink,this,inNm,1);
               this.iDeviceBox.addChild(this.iBox[inNm]);
               break;
            case "iHeater2":
               this.iBox[inNm] = new iHeater(inLink,this,inNm,2);
               this.iDeviceBox.addChild(this.iBox[inNm]);
               break;
            case "iTube":
               this.iBox[inNm] = new iTube(inLink,this,inNm);
               this.iDeviceBox.addChild(this.iBox[inNm]);
               break;
            case "iHeaterCap":
               this.iBox[inNm] = new iHeaterCap(inLink,this,inNm);
               this.iBox[inNm].x = inLink.x + 80;
               this.iBox[inNm].y = inLink.y + 20;
               this.iDeviceBox.addChild(this.iBox[inNm]);
               break;
            case "iStructure":
               this.iBox[inNm] = new iStructure(inLink,this,inNm);
               this.iDeviceBox.addChild(this.iBox[inNm]);
               break;
            case "iTripod":
               this.iBox[inNm] = new iTripod(inLink,this,inNm);
               this.iDeviceBox.addChild(this.iBox[inNm]);
               break;
            case "iDropper":
               this.iBox[inNm] = new iDropper(inLink,this,inNm);
               this.iDeviceBox.addChild(this.iBox[inNm]);
               break;
            case "iSpoon":
               this.iBox[inNm] = new iSpoon(inLink,this,inNm);
               this.iDeviceBox.addChild(this.iBox[inNm]);
               break;
            case "iAddOns":
         }
         this.iBox[inNm].iKind = inType;
      }
      
      public function iProg() : *
      {
         this.iProgDevice();
         this.iFmlShow();
         ++this.iStoreTime;
         if(this.iStoreTime > 30)
         {
            this.iStore();
            this.iStoreTime = 0;
         }
      }
      
      public function iStore() : void
      {
         this.LabSo.data.main = this.iCode();
         this.LabSo.data.Num = root["pPan"].num;
         this.LabSo.data.report = this.myReport.MainTxt;
         this.LabSo.data.back = this.iDsk.Bmp.deskColor.x;
         this.LabSo.flush();
      }
      
      public function iCode() : String
      {
         var i:* = undefined;
         var j:* = undefined;
         var dt:String = "";
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(this.iBox[i].iLife)
               {
                  if(this.iBox[i].iKind == "iTube")
                  {
                     if(this.iBox[i].iDv2 == null)
                     {
                        continue;
                     }
                  }
                  dt += this.iBox[i].iName + "_";
                  dt += this.iBox[i].x + "_";
                  dt += this.iBox[i].y + "_";
                  dt += this.iBox[i].iKind + "_";
                  dt += this.iBox[i].cDv.cType + "_";
                  dt += this.iBox[i].cDv.cKind + "_";
                  if(this.iBox[i].iGenr == "Container")
                  {
                     dt += this.iBox[i].iIsCap + "_";
                     for(j in this.iBox[i].cDv.cMt.cStack)
                     {
                        dt += this.iBox[i].cDv.cMt.cStack[j].cName + "~";
                        dt += this.iRound(this.iBox[i].cDv.cMt.cStack[j].cMass) + "~";
                        dt += this.iRound(this.iBox[i].cDv.cMt.cStack[j].cTemp) + "~";
                        dt += this.iBox[i].cDv.cMt.cStack[j].cDepth + "^";
                     }
                  }
                  if(this.iBox[i].iKind == "iTube")
                  {
                     if(this.iBox[i].iDv2 != null)
                     {
                        dt += this.iBox[i].iDv1.iName + "_";
                        dt += this.iBox[i].iDv2.iName + "_";
                     }
                  }
                  if(this.iBox[i].iGenr == "Heater")
                  {
                     dt += this.iBox[i].iIsIgn + "_";
                  }
                  dt += "_" + this.iBox[i].iUID;
                  dt += "*";
               }
            }
         }
         trace("store",dt);
         dt += "$";
         dt += this.iFmls.iGetFml();
         dt += "$";
         dt += String(this.iFmls.iGetFmlN());
         dt += "$";
         dt += String(this.cDm.sTemp);
         dt += "$";
         dt += String(this.cDm.sAtmN);
         dt += "$";
         dt += String(this.cDm.cSpeed);
         dt += "$";
         if(this.cDm.sExp)
         {
            dt += "1";
         }
         else
         {
            dt += "0";
         }
         return dt;
      }
      
      public function iRound(n:Number) : Number
      {
         var _rn:Number = Math.round(n * 100) / 100;
         if(_rn == 0)
         {
            return n;
         }
         return _rn;
      }
      
      public function iLoadViewer(t:String) : void
      {
         var LoadRequest:* = new URLRequest("http://www.thixlab.com/CloudLab/Lab/" + t + ".txt");
         this.LoadLoader.load(LoadRequest);
         this.LoadLoader.addEventListener(Event.COMPLETE,this.loadcmp);
      }
      
      private function loadcmp(e:*) : void
      {
         this.iLoadMain(this.LoadLoader.data);
      }
      
      public function iLoad() : void
      {
         var _num:Number = NaN;
         if(this.LabSo.data.main != null)
         {
            _num = Number(this.LabSo.data.Num);
            root["pPan"].num = _num;
            if(this.LabSo.data.back)
            {
               this.iDsk.Bmp.deskColor.x = this.LabSo.data.back;
            }
            this.iLoadMain(this.LabSo.data.main);
         }
      }
      
      public function iLoadMain(t:String) : void
      {
         var i:* = undefined;
         var d:* = undefined;
         var article:Array = null;
         var _name:String = null;
         var _x:Number = NaN;
         var _y:Number = NaN;
         var _kind:String = null;
         var _ctype:String = null;
         var _ckind:String = null;
         var _uid:* = undefined;
         var _lid:Boolean = false;
         var mattersgroup:Array = null;
         var j:* = undefined;
         var matters:Array = null;
         var mat_temp:* = undefined;
         var dt1:Array = t.split("$");
         if(dt1[1] != null)
         {
            this.iFmls.iLoad(dt1[1],dt1[2]);
         }
         this.cDm.sTemp = Number(dt1[3]);
         this.cDm.sAtmN = Number(dt1[4]);
         this.cDm.cSpeed = Number(dt1[5]);
         if(dt1[6] == "1")
         {
            this.cDm.sExp = true;
         }
         else
         {
            this.cDm.sExp = false;
         }
         var dt:Array = dt1[0].split("*");
         for(i in dt)
         {
            if(dt[i] != "")
            {
               article = dt[i].split("_");
               _name = article[0];
               _x = Number(article[1]);
               _y = Number(article[2]);
               _kind = article[3];
               _ctype = article[4];
               _ckind = article[5];
               _uid = article[8];
               if(_kind == "iDevice")
               {
                  if(article[6] == "true")
                  {
                     _lid = true;
                  }
                  else
                  {
                     _lid = false;
                  }
                  mattersgroup = article[7].split("^");
                  this.cDm.cCreate("G" + _name,"cGroup","","");
                  for(j in mattersgroup)
                  {
                     if(mattersgroup[j] != "")
                     {
                        matters = mattersgroup[j].split("~");
                        mat_temp = this.cDm.cCreatMatter(matters[0],matters[1],matters[2]);
                        this.cDm.cBox["G" + _name].cAddSub(this.cDm.cCore[mat_temp],matters[3]);
                     }
                  }
               }
               this.cDm.cCreate("D" + _name,_ckind,this.cDm.cBox["G" + _name],_ctype);
               this.iCreate(_name,_kind,this.cDm.cBox["D" + _name]);
               if(_kind == "iDevice")
               {
                  if(_lid)
                  {
                     this.iBox[_name].iLidUp();
                  }
               }
               else if(_kind == "iTube")
               {
                  this.iBox[_name].iDvNm1 = article[6];
                  if(article[7] != null)
                  {
                     this.iBox[_name].iDvNm2 = article[7];
                  }
               }
               else if(_ckind == "cHeater")
               {
                  if(article[6] == "true")
                  {
                     this.iBox[_name].iDoIgn2();
                  }
               }
               this.iBox[_name].x = _x;
               this.iBox[_name].y = _y;
            }
         }
         for(d in this.iBox)
         {
            if(this.iBox[d] != null)
            {
               if(this.iBox[d].iKind == "iTube")
               {
                  this.iBox[d].iLinkUp();
               }
               else
               {
                  this.iBox[d].iTestHit();
                  this.iBox[d].iSetDown();
               }
            }
         }
      }
      
      private function iProgDevice() : *
      {
         var i:* = undefined;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               this.iBox[i].iProg();
            }
         }
      }
      
      public function iSortDepth() : *
      {
         var i:* = undefined;
         var ary_temp3:Array = null;
         var j:* = undefined;
         var ary_temp:Array = new Array();
         var ary_temp2:Array = new Array();
         var ct_temp:Number = 0;
         for(i in this.iBox)
         {
            if(this.iBox[i] != null)
            {
               if(this.iBox[i].iLink != null)
               {
                  if(this.iBox[i].iLinked != "Tripod")
                  {
                     ary_temp2.push({
                        "tDv":this.iBox[i],
                        "tY":this.iBox[i].y
                     });
                     ct_temp++;
                  }
                  else
                  {
                     ary_temp.push({
                        "tDv":this.iBox[i],
                        "tY":this.iBox[i].y
                     });
                     ct_temp++;
                  }
               }
               else if(this.iBox[i].iType != "Dropper")
               {
                  ary_temp.push({
                     "tDv":this.iBox[i],
                     "tY":this.iBox[i].y
                  });
                  ct_temp++;
               }
               else
               {
                  ary_temp2.push({
                     "tDv":this.iBox[i],
                     "tY":this.iBox[i].y
                  });
                  ++t_temp;
               }
            }
         }
         if(ct_temp > 0)
         {
            ary_temp.sortOn("tY",Array.NUMERIC);
            ary_temp2.sortOn("tY",Array.NUMERIC);
            ary_temp3 = new Array();
            ary_temp3 = ary_temp.concat(ary_temp2);
            for(j in ary_temp3)
            {
               if(ary_temp3[j].tDv != null && Boolean(ary_temp3[j].tDv.iLife))
               {
                  this.iDeviceBox.setChildIndex(ary_temp3[j].tDv,this.iDeviceBox.numChildren - 1);
               }
            }
         }
      }
      
      public function iRemove(inS1:*) : *
      {
         this.iSelected = null;
         this.iDeviceBox.removeChild(inS1);
         inS1.iLife = false;
         if(inS1.cDv != null)
         {
            inS1.cDv.cLife = false;
         }
         inS1 = null;
      }
      
      public function iFmlShow() : *
      {
         if(this.cDm.sFml)
         {
            if(this.iFmls.alpha != 1)
            {
               this.iFmls.alpha = 1;
            }
            if(this.cDm.cFmlBoxId != "")
            {
               if(this.cDm.cFmlBoxId != this.iFmlBox)
               {
                  this.iFmlBox = this.cDm.cFmlBoxId;
                  this.mSd.inmAch.play();
                  this.iFmls.iShowFml(this.cDm.cFmlBoxId,this.cDm.cFmlBoxIdD);
                  this.cDm.cFmlBoxId = "";
                  this.cDm.cFmlBoxIdD = null;
                  if(root["pPan"].iCreator.currentFrame == 3)
                  {
                     root["pPan"].doblack2(0);
                  }
               }
            }
         }
         else
         {
            this.iFmls.alpha = 0;
         }
      }
      
      public function iDoPhase(n:Number) : void
      {
         this.iPhase = n;
      }
   }
}

