package
{
   import fl.transitions.*;
   import fl.transitions.easing.*;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1516")]
   public class iPan extends MovieClip
   {
      
      public var bset:MovieClip;
      
      public var btnSet:MovieClip;
      
      public var btnUpgrade:SimpleButton;
      
      public var iBlack:MovieClip;
      
      public var iCreator:MovieClip;
      
      public var iMenu:MovieClip;
      
      public var mClean:MovieClip;
      
      public var pAchGet:MovieClip;
      
      public var starts:MovieClip;
      
      public var addedChem:String = "";
      
      public var iRolling:Object = new Object();
      
      public var iStage:*;
      
      private var iEle:Dictionary = new Dictionary();
      
      public var ConfigSo:SharedObject;
      
      public var num:Number = 0;
      
      public var iRankTp:Number = 2;
      
      public var iShowLabel:Boolean = false;
      
      public var isFree:Boolean = false;
      
      public var iNote:Boolean = false;
      
      public var iTap:Boolean = false;
      
      public var msdPickUp:mPickUp = new mPickUp();
      
      public var msdPickUp2:mPickUp2 = new mPickUp2();
      
      public var msdNote:mNote = new mNote();
      
      public var msdPickUpSolid:mPickUpSolid = new mPickUpSolid();
      
      public var msdPickUpLiquid:mPickUpLiquid = new mPickUpLiquid();
      
      public var isInstr:Boolean = false;
      
      public var iZm:iZoomer = new iZoomer();
      
      private var iTube:iDragTube = new iDragTube();
      
      private var iLid:iDragLid = new iDragLid();
      
      private var iFlm:iFlame = new iFlame();
      
      private var iFrz:iFreeze = new iFreeze();
      
      public var iGr:iGlassRod = new iGlassRod();
      
      public var iDt:iDTMeter = new iDTMeter();
      
      public var iDr:iDropper;
      
      public var ipH:ipHPanel = new ipHPanel();
      
      public var Ams:iAms = new iAms();
      
      public var iNowAdding:String = "";
      
      public var iPhase:Number = 1;
      
      public var iDeskColor:Number = 1;
      
      public var iTapper:iDragger = new iDragger();
      
      private var iNewNum:Number = 0;
      
      private var fade_out_time:Number = 0;
      
      public var iActive:Boolean = false;
      
      private var cxsp:Number = 0;
      
      private var crsn:Boolean = false;
      
      public var isSnap:Boolean = false;
      
      public var LabelType:Number = 0;
      
      private var mTip:Boolean = false;
      
      private var eCDN:Number = 1;
      
      private var setpx:*;
      
      private var setpx2:Number;
      
      private var seton:Boolean = false;
      
      public var setmovesp:*;
      
      public var gosetmovesp:Number;
      
      private var iSexPx:Number = -487;
      
      private var iAddNm1:Number = 20;
      
      private var iAddNm2:Number = 0;
      
      public var noteName:*;
      
      public var noteName2:String;
      
      private var chemiName:String;
      
      private var adding:iElement;
      
      private var chemiAddMass:Number;
      
      private var mcleanX:Number;
      
      private var minitcleanX:Number;
      
      internal var us:URLShortener = new URLShortener();
      
      internal var updir:String;
      
      internal var id:String;
      
      private var d_labeltime:Number = 0;
      
      private var temp_k:Number = 0;
      
      private var cleaningx:Number = 0;
      
      public var mFlameStream:SoundChannel = new SoundChannel();
      
      public var mFreezeStream:SoundChannel = new SoundChannel();
      
      public var iPHTID:*;
      
      public var iDRTID:*;
      
      public var iDTTID:*;
      
      public var iIGNTID:*;
      
      public var iGRTID:*;
      
      public var iFRZTID:int;
      
      public var iIgnTX:*;
      
      public var iIgnTY:Number;
      
      private var iIgning:Boolean = false;
      
      private var IgnObj:*;
      
      private var pre_rt:Number = 0;
      
      private var iGring:Boolean = false;
      
      private var iGringObj:*;
      
      private var iDting:Boolean = false;
      
      private var iDring:Boolean = false;
      
      private var iPhing:Boolean = false;
      
      private var FrzObj:*;
      
      public var iFrzTX:*;
      
      public var iFrzTY:Number;
      
      private var iFrzing:Boolean = false;
      
      private var tween_Device:Tween;
      
      private var tween_btn:Tween;
      
      private var move_Device_my:Number;
      
      private var myTextField:StageText;
      
      private var eley:Number = 166;
      
      private var prealphabet:String = "";
      
      private var pretag:String = "";
      
      private var iEdit:Boolean = false;
      
      private var leftx:Number = 209;
      
      private var rightx:Number;
      
      private var epx:Number;
      
      private var pIsMove:Boolean = false;
      
      public var movex:*;
      
      public var cmovex:Number;
      
      private var cmovecnt:uint = 0;
      
      public var movesp:*;
      
      public var gomovesp:*;
      
      public var cmovesp:*;
      
      public var cgomovesp:Number;
      
      private var ztotal:Number = 0;
      
      private var alphaTween:Tween;
      
      private var elex:Number = 100;
      
      private var elex2:Number = 141;
      
      private var iChemN:Number = 0;
      
      private var iChemE:iDevice;
      
      public var M_prenm:String = "";
      
      private var M_prenm2:String = "";
      
      private var M_x:Number;
      
      private var iChemnN:Number;
      
      private var iPreSet:String;
      
      private var qObj:DisplayObject;
      
      public function iPan(inStg:*)
      {
         super();
         this.starts.visible = false;
         Credit.Setup(this);
         Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
         this.iStage = inStg;
         this.ConfigSo = SharedObject.getLocal("Chemist_save40");
         this.btnSet.btnEquip.addEventListener(MouseEvent.MOUSE_DOWN,this.add_Device);
         this.btnSet.btnSub.addEventListener(MouseEvent.MOUSE_DOWN,this.add_Sub);
         this.btnSet.btnSave.addEventListener(MouseEvent.MOUSE_DOWN,this.add_Tool);
         this.bset.pMenu.addEventListener(TouchEvent.TOUCH_TAP,this.d_stset);
         this.bset.pRefresh.addEventListener(TouchEvent.TOUCH_TAP,this.d_reset);
         this.bset.pLabel.addEventListener(MouseEvent.MOUSE_DOWN,this.d_label);
         if(this.ConfigSo.data.iDesk != null)
         {
            this.iStage.myLab.iDsk.gotoAndStop(this.ConfigSo.data.iDesk);
            this.iDeskColor = this.ConfigSo.data.iDesk;
         }
         if(this.ConfigSo.data.iShowLabel != null)
         {
            this.iShowLabel = this.ConfigSo.data.iShowLabel;
            this.LabelType = this.ConfigSo.data.LabelType;
            if(this.iShowLabel)
            {
               this.bset.iconLabel.gotoAndStop(this.LabelType + 1);
            }
         }
         this.iFlm.mouseEnabled = false;
         this.iFlm.mouseChildren = false;
         this.iFrz.mouseEnabled = false;
         this.iFrz.mouseChildren = false;
         this.iGr.mouseEnabled = false;
         this.iGr.mouseChildren = false;
         this.iGr.visible = false;
         this.iDt.mouseEnabled = false;
         this.iDt.mouseChildren = false;
         this.iDt.visible = false;
         this.iTube.mouseChildren = false;
         this.iTube.mouseEnabled = false;
         this.iTube.visible = false;
         this.iLid.mouseChildren = false;
         this.iLid.mouseEnabled = false;
         this.iLid.visible = false;
         this.iCreator.mouseEnabled = false;
         this.mouseEnabled = false;
         this.iZm.mouseEnabled = false;
         this.iZm.mouseChildren = false;
         this.iGr.scaleX = this.iGr.scaleY = Window.getRes();
         this.iDt.scaleX = this.iDt.scaleY = Window.getRes();
         this.iTapper.scaleX = this.iTapper.scaleY = Window.getRes();
         this.ipH.scaleX = this.ipH.scaleY = Window.getRes();
         this.iLid.scaleX = this.iLid.scaleY = Window.getRes();
         this.Ams.iClose();
         addChild(this.iGr);
         addChild(this.iTube);
         addChild(this.iFlm);
         addChild(this.iFrz);
         addChild(this.iTapper);
         addChild(this.iDt);
         addChild(this.iLid);
         addChild(this.iZm);
         addChild(this.Ams);
         this.ipH.stop();
         this.iChemnN = this.iStage.myDb.MDbN;
         this.btnUpgrade.visible = this.isFree;
         this.bset.iconLabel.mouseEnabled = false;
         this.iStage.myDomain.cCL.iSetPan(this,this.iStage.myDomain.cDbs);
         this.bset.iconLabel.visible = false;
         this.bset.pLabel.visible = false;
         this.bset.pMenu.visible = false;
         this.bset.pRefresh.alpha = 0;
         alpha = 0;
         this.btnSet.scaleX = this.btnSet.scaleY = Window.getRes();
         this.bset.scaleX = this.bset.scaleY = Window.getRes();
         this.bset.x += (Window.getRes() - 1) * 200;
         this.iMenu.x += (Window.getRes() - 1) * 150;
         this.iMenu.scaleX = this.iMenu.scaleY = Window.getRes();
         this.initSearch();
      }
      
      public function refreshCredit() : void
      {
         if(Credit.organic == 1)
         {
            this.iCreator.iTS.movCredit.visible = false;
            this.iCreator.iTS.movRestore.visible = false;
         }
         else
         {
            this.iCreator.iTS.movCredit.txtPrice.text = "Buy " + Credit.getPrice("chemist.chemicals.organic");
         }
      }
      
      public function iZoomTo(d:*, e:TouchEvent) : void
      {
         this.iZm.iZoomTo(d,e,false);
      }
      
      public function iZoomTo2(d:*, e:TouchEvent) : void
      {
         this.iZm.iZoomTo(d,e,true);
         this.iTapper.iSetAms();
      }
      
      public function iDisZoom() : void
      {
         this.iZm.iDisZoom();
      }
      
      public function iViewer() : void
      {
         this.bset.iconLabel.visible = true;
      }
      
      private function starter(e:*) : void
      {
         if(alpha < 1)
         {
            alpha += 0.2;
         }
         else
         {
            alpha = 1;
            removeEventListener(Event.ENTER_FRAME,this.starter);
         }
      }
      
      public function iStart() : void
      {
         addEventListener(Event.ENTER_FRAME,this.starter);
         this.bset.iconLabel.visible = true;
         this.bset.pMenu.visible = true;
         this.bset.pRefresh.alpha = 1;
         this.bset.pLabel.visible = true;
      }
      
      public function pCreateDropper() : void
      {
         root["myDomain"].cCreate("g" + this.num,"cGroup","","");
         root["myDomain"].cCreate("d" + this.num,"cDevice",this.iStage.myDomain.cBox["g" + this.num],"Dropper");
         this.iDr = new iDropper(root["myDomain"].cBox["d" + this.num],root["myLab"],"id" + this.num);
         this.iDr.mouseEnabled = false;
         this.iDr.mouseChildren = false;
         this.iDr.visible = false;
         addChild(this.iDr);
         ++this.num;
      }
      
      public function iStopByExp() : void
      {
         if(root["myLab"].iDr)
         {
            this.stopDr2();
         }
      }
      
      public function pFade() : void
      {
         addEventListener(Event.ENTER_FRAME,this.fade_out);
      }
      
      public function fade() : void
      {
         if(alpha == 1)
         {
            addEventListener(MouseEvent.MOUSE_MOVE,this.fade_in);
            addEventListener(Event.ENTER_FRAME,this.fade_out);
         }
         else
         {
            alpha = 1;
         }
      }
      
      private function fade_in(e:*) : void
      {
         alpha = 1;
         removeEventListener(MouseEvent.MOUSE_MOVE,this.fade_in);
      }
      
      private function iActivate(b:Boolean) : void
      {
         this.iActive = b;
         if(!b)
         {
            this.fade_out_time = 0;
         }
      }
      
      private function fade_out(e:*) : void
      {
         if(alpha > 0)
         {
            alpha -= 0.1;
         }
         else
         {
            alpha = 0;
            removeEventListener(Event.ENTER_FRAME,this.fade_out);
         }
      }
      
      private function btnSetShow() : void
      {
         this.btnSet.btnSave.visible = true;
         this.btnSet.btnEquip.visible = true;
         this.btnSet.btnSub.visible = true;
      }
      
      private function btnSetHide() : void
      {
         this.btnSet.btnSave.visible = false;
         this.btnSet.btnEquip.visible = false;
         this.btnSet.btnSub.visible = false;
      }
      
      private function createshow(e:*) : *
      {
         if(this.iCreator.y < 110)
         {
            this.iCreator.y += (125 - this.iCreator.y) * 0.6;
         }
         else
         {
            this.iCreator.y = 110;
            if(this.iCreator.currentFrame == 3)
            {
               this.iCreator.Scroll.visible = true;
            }
            if(this.crsn)
            {
               this.eCD(1);
               this.crsn = false;
            }
            if(this.iCreator.currentFrame == 3)
            {
               this.iStage.myLab.iDsk.addEventListener(MouseEvent.CLICK,this.doblack2);
            }
            if(this.iCreator.currentFrame == 2)
            {
               this.iStage.myLab.iDsk.addEventListener(MouseEvent.CLICK,this.doblack1);
            }
            removeEventListener(Event.ENTER_FRAME,this.createshow);
         }
      }
      
      private function createhide(e:*) : *
      {
         if(this.iCreator.y > -200)
         {
            if(this.iCreator.currentFrame == 3)
            {
               this.iCreator.Scroll.visible = false;
            }
            this.iCreator.y -= (this.iCreator.y + 207) * 0.45;
         }
         else
         {
            this.iCreator.y = -200;
            this.btnSetShow();
            this.iCreator.gotoAndStop(1);
            removeEventListener(Event.ENTER_FRAME,this.settraymove);
            removeEventListener(Event.ENTER_FRAME,this.createhide);
         }
      }
      
      private function createmove(e:*) : *
      {
      }
      
      public function saveDesk() : void
      {
         this.ConfigSo.data.iDesk = this.iStage.myLab.iDsk.currentFrame;
         this.iDeskColor = this.iStage.myLab.iDsk.currentFrame;
         this.ConfigSo.flush();
      }
      
      public function saveLabel() : void
      {
         this.ConfigSo.data.iShowLabel = this.iShowLabel;
         this.ConfigSo.data.LabelType = this.LabelType;
         this.ConfigSo.flush();
      }
      
      public function doCreate() : void
      {
         this.closeCreate();
      }
      
      public function doCreatetool() : void
      {
         this.iBlack.gotoAndPlay("EquipClose");
         this.iStage.myLab.iDsk.removeEventListener(MouseEvent.MOUSE_DOWN,this.doblack1);
         this.closeCreate();
         this.msdPickUp.play();
      }
      
      public function doAddChem(e:*) : *
      {
         this.pCD(2);
         this.msdPickUp2.play();
      }
      
      public function localTag(_tag:String) : String
      {
         var _lg:String = iLoc.LG;
         var _t:String = _tag;
         switch(_tag)
         {
            case "Alkynes":
               switch(_lg)
               {
                  case "en":
                     break;
                  case "zh":
                     _t = "炔烃";
                     break;
                  case "tw":
                     _t = "炔烴";
                     break;
                  case "jp":
                     _t = "アルキン";
                     break;
                  case "ko":
                     _t = "알카인";
                     break;
                  case "sp":
                     _t = "Alquino";
                     break;
                  case "fr":
                     _t = "Alcyne";
                     break;
                  case "nl":
                     _t = "Alkyn";
                     break;
                  case "ru":
                     _t = "Алкины";
                     break;
                  case "it":
                     _t = "Alchini";
                     break;
                  case "no":
                     _t = "Alkyner";
                     break;
                  case "po":
                     _t = "Alcino";
                     break;
                  case "ge":
                     _t = "Alkine";
                     break;
                  case "sw":
                     _t = "Alkyn";
                     break;
                  case "th":
                     _t = "แอลไคน์";
               }
               break;
            case "Alkenes":
               switch(_lg)
               {
                  case "en":
                     break;
                  case "zh":
                     _t = "烯烃";
                     break;
                  case "tw":
                     _t = "烯烴";
                     break;
                  case "jp":
                     _t = "アルケン";
                     break;
                  case "ko":
                     _t = "알켄";
                     break;
                  case "sp":
                     _t = "Alqueno";
                     break;
                  case "fr":
                     _t = "Alcène";
                     break;
                  case "nl":
                     _t = "Alkeen";
                     break;
                  case "ru":
                     _t = "Алкены";
                     break;
                  case "it":
                     _t = "Alcheni";
                     break;
                  case "no":
                     _t = "Alkener";
                     break;
                  case "po":
                     _t = "Alceno";
                     break;
                  case "ge":
                     _t = "Alkene";
                     break;
                  case "sw":
                     _t = "Alken";
                     break;
                  case "th":
                     _t = "แอลคีน";
               }
               break;
            case "Alkanes":
               switch(_lg)
               {
                  case "en":
                     break;
                  case "zh":
                     _t = "烷烃";
                     break;
                  case "tw":
                     _t = "烷烴";
                     break;
                  case "jp":
                     _t = "アルカン";
                     break;
                  case "ko":
                     _t = "알케인";
                     break;
                  case "sp":
                     _t = "Alcano";
                     break;
                  case "fr":
                     _t = "Alcane";
                     break;
                  case "nl":
                     _t = "Alkaan";
                     break;
                  case "ru":
                     _t = "Алканы";
                     break;
                  case "it":
                     _t = "Alcani";
                     break;
                  case "no":
                     _t = "Alkaner";
                     break;
                  case "po":
                     _t = "Alcano";
                     break;
                  case "ge":
                     _t = "Alkane";
                     break;
                  case "sw":
                     _t = "Alkan";
                     break;
                  case "th":
                     _t = "แอลเคน";
               }
               break;
            case "Aldehydes":
               switch(_lg)
               {
                  case "en":
                     break;
                  case "zh":
                     _t = "醛";
                     break;
                  case "tw":
                     _t = "醛";
                     break;
                  case "jp":
                     _t = "アルデヒド";
                     break;
                  case "ko":
                     _t = "알데하이드";
                     break;
                  case "sp":
                     _t = "Aldehído";
                     break;
                  case "fr":
                     _t = "Aldéhyde";
                     break;
                  case "nl":
                     _t = "Aldehyde";
                     break;
                  case "ru":
                     _t = "Альдегиды";
                     break;
                  case "it":
                     _t = "Aldeidi";
                     break;
                  case "no":
                     _t = "Aldehyd";
                     break;
                  case "po":
                     _t = "Aldeído";
                     break;
                  case "ge":
                     _t = "Aldehyde";
                     break;
                  case "sw":
                     _t = "Aldehyd";
                     break;
                  case "th":
                     _t = "แอลดีไฮด์";
               }
               break;
            case "Alcohols":
               switch(_lg)
               {
                  case "en":
                     break;
                  case "zh":
                     _t = "醇";
                     break;
                  case "tw":
                     _t = "醇";
                     break;
                  case "jp":
                     _t = "アルコール";
                     break;
                  case "ko":
                     _t = "알코올";
                     break;
                  case "sp":
                     _t = "Alcohol";
                     break;
                  case "fr":
                     _t = "Alcool";
                     break;
                  case "nl":
                     _t = "Alcohol";
                     break;
                  case "ru":
                     _t = "Спирты";
                     break;
                  case "it":
                     _t = "Alcoli";
                     break;
                  case "no":
                     _t = "Alkoholer";
                     break;
                  case "po":
                     _t = "Álcool";
                     break;
                  case "ge":
                     _t = "Alkohole";
                     break;
                  case "sw":
                     _t = "Alkoholer";
                     break;
                  case "th":
                     _t = "แอลกอฮอล์";
               }
               break;
            case "Carboxylic acid":
               switch(_lg)
               {
                  case "en":
                     break;
                  case "zh":
                     _t = "羧酸";
                     break;
                  case "tw":
                     _t = "羧酸";
                     break;
                  case "jp":
                     _t = "カルボン酸";
                     break;
                  case "ko":
                     _t = "카복실산";
                     break;
                  case "sp":
                     _t = "Ácido carboxílico";
                     break;
                  case "fr":
                     _t = "Acide carboxylique";
                     break;
                  case "nl":
                     _t = "Carbonzuur";
                     break;
                  case "ru":
                     _t = "Карбоновые кислоты";
                     break;
                  case "it":
                     _t = "Acidi carbossilici";
                     break;
                  case "no":
                     _t = "Karboksylsyre";
                     break;
                  case "po":
                     _t = "Ácido carboxílico";
                     break;
                  case "ge":
                     _t = "Carbonsäuren";
                     break;
                  case "sw":
                     _t = "Karboxylsyror";
                     break;
                  case "th":
                     _t = "กรดคาร์บอกซิลิก";
               }
               break;
            case "Cyclic compounds":
               switch(_lg)
               {
                  case "en":
                     break;
                  case "zh":
                     _t = "环状化合物";
                     break;
                  case "tw":
                     _t = "環狀化合物";
                     break;
                  case "jp":
                     _t = "環式化合物";
                     break;
                  case "ko":
                     _t = "고리 화합물";
                     break;
                  case "sp":
                     _t = "Compuesto cíclico";
                     break;
                  case "fr":
                     _t = "Composé cyclique";
                     break;
                  case "nl":
                     _t = "Cyclische verbinding";
                     break;
                  case "ru":
                     _t = "Циклические соединения";
                     break;
                  case "it":
                     _t = "Composti ciclici";
                     break;
                  case "po":
                     _t = "Composto cíclico";
                     break;
                  case "ge":
                     _t = "Cyclische Verbindungen";
               }
               break;
            case "Carbohydrate":
               switch(_lg)
               {
                  case "en":
                     break;
                  case "zh":
                     _t = "糖类";
                     break;
                  case "tw":
                     _t = "醣類";
                     break;
                  case "jp":
                     _t = "炭水化物";
                     break;
                  case "ko":
                     _t = "탄수화물";
                     break;
                  case "sp":
                     _t = "Glúcido";
                     break;
                  case "fr":
                     _t = "Glucide";
                     break;
                  case "nl":
                     _t = "Koolhydraat";
                     break;
                  case "ru":
                     _t = "Углеводы";
                     break;
                  case "it":
                     _t = "Glucidi";
                     break;
                  case "po":
                     _t = "Carboidrato";
                     break;
                  case "ge":
                     _t = "Kohlenhydrate";
                     break;
                  case "sw":
                     _t = "Kolhydrat";
                     break;
                  case "th":
                     _t = "คาร์โบไฮเดรต";
               }
         }
         trace("aa",_t);
         return _t;
      }
      
      private function eCD(n:Number) : void
      {
         this.eCDN = n;
         this.gosetmovesp = 0;
         removeEventListener(Event.ENTER_FRAME,this.settraymove);
         if(n == 1)
         {
            this.msdPickUp2.play();
            this.iCreator.iSet.addEventListener(MouseEvent.MOUSE_DOWN,this.setmd);
            this.iCreator.iSet.btnBeaker.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateBeaker1);
            this.iCreator.iSet.btnBeaker2.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateBeaker2);
            this.iCreator.iSet.btnCF.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateAwl);
            this.iCreator.iSet.btnCF2.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateAwl2);
            this.iCreator.iSet.btnGC.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateGasBottle);
            this.iCreator.iSet.btnFlask.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateBoiler);
            this.iCreator.iSet.btnFlask2.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateBoiler2);
            this.iCreator.iSet.btnTesttube.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateTT);
            this.iCreator.iSet.btnWatch.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateWatch);
            this.iCreator.iSet.btnBowl.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateBowl);
            this.iCreator.iSet.btnFunnel.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateFunnel);
            this.iCreator.iSet.btnAl.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateHeater1);
            this.iCreator.iSet.btnTube.addEventListener(TouchEvent.TOUCH_MOVE,this.cDragTube);
            this.iCreator.iSet.btnAb.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateHeater2);
            this.iCreator.iSet.btnTripod.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateTripod);
            this.iCreator.iSet.btnSs.addEventListener(TouchEvent.TOUCH_MOVE,this.cCreateSteelStand);
            this.iCreator.iSet.btnLid.addEventListener(TouchEvent.TOUCH_MOVE,this.cDragLid);
         }
      }
      
      private function setmd(e:*) : void
      {
         this.seton = false;
         removeEventListener(Event.ENTER_FRAME,this.settraymove);
         this.setpx = mouseX;
         setpy = mouseY;
         this.gosetmovesp = 0;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.setmm);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.setmu);
      }
      
      private function setmm(e:*) : void
      {
         this.setmovesp = mouseX - this.setpx2;
         this.setpx2 = mouseX;
         var dx:Number = Math.abs(this.setpx - mouseX);
         var dy:Number = Math.abs(setpy - mouseY);
         this.seton = true;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.setmm);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.setmu);
         this.gosetmovesp = 0;
      }
      
      private function setmu(e:*) : void
      {
         if(!this.seton)
         {
            if(Math.abs(this.setmovesp) > 5)
            {
               if(this.setmovesp > 15)
               {
                  this.gosetmovesp = 15;
               }
               else if(this.movesp < -15)
               {
                  this.gosetmovesp = -15;
               }
               else
               {
                  this.gosetmovesp = this.setmovesp;
               }
            }
            else
            {
               this.gosetmovesp = 0;
               this.setmovesp = 0;
            }
            if(this.iCreator.currentFrame == 2)
            {
               this.iCreator.iSet.stopDrag();
            }
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.setmu);
         }
      }
      
      private function settraymove(e:*) : *
      {
         if(Math.abs(this.gosetmovesp) > 0.3)
         {
            if(this.gosetmovesp > 0)
            {
               this.iCreator.iSet.x += this.gosetmovesp;
               this.gosetmovesp -= (this.gosetmovesp + 1) / 30;
            }
            else if(this.gosetmovesp < 0)
            {
               this.iCreator.iSet.x += this.gosetmovesp;
               this.gosetmovesp -= (this.gosetmovesp - 1) / 30;
            }
         }
         else
         {
            this.gosetmovesp = 0;
            removeEventListener(Event.ENTER_FRAME,this.settraymove);
         }
         if(this.iCreator.iSet.x < -487 - 550)
         {
            this.iCreator.iSet.x = -487 - 550;
         }
         else if(this.iCreator.iSet.x > -487)
         {
            this.iCreator.iSet.x = -487;
         }
      }
      
      public function closeCreate() : void
      {
         if(this.bset.pRefresh.alpha != 1)
         {
            if(root["iWc"].currentFrame == 176)
            {
               root["iWc"].play();
            }
            addEventListener(Event.ENTER_FRAME,this.createhide);
            this.hideSearch();
            this.iStage.myDomain.cFocus(true);
            this.iPhase = 1;
            this.iEdit = false;
            this.fade_out_time = 0;
            eAlpha.iAlpha(this.btnSet,0);
            this.iStage.myLab.iFmls.visible = true;
            removeEventListener(Event.ENTER_FRAME,this.traymove);
            this.bset.iconLabel.visible = true;
            this.bset.pMenu.visible = true;
            this.bset.pRefresh.alpha = 1;
            this.iBlack.gotoAndStop(1);
         }
      }
      
      private function getAmount(nm:String, n1:Number, n2:Number) : Number
      {
         if(n2 == 0)
         {
            return n1;
         }
         if(n2 == 1)
         {
            return n1 * this.iStage.myDomain.cDbs.cLoad(nm,"cDensity");
         }
         if(n2 == 2)
         {
            return n1 * this.iStage.myDomain.cDbs.cLoad(nm,"mm");
         }
         return 0;
      }
      
      public function AddChem(obj:*, M:Number) : void
      {
         var mass_temp:* = undefined;
         var fnm:* = undefined;
         var mat_temp:* = undefined;
         var am:String = null;
         var water_mass:Number = NaN;
         var water:* = undefined;
         var water_temp:* = undefined;
         var cd_temp:Array = null;
         var i:* = undefined;
         var cv_temp:* = undefined;
         var e:iElement = this.iTapper.e;
         if(this.iAddNm2 == 0)
         {
            if(e.iSt == 1)
            {
               this.iAddNm1 = 10;
               this.iAddNm2 = 0;
            }
            else
            {
               this.iAddNm1 = 20;
               this.iAddNm2 = 1;
            }
         }
         if(e.pos == "")
         {
            mass_temp = M;
            fnm = this.iStage.myDomain.cDbs.cLoad(e.iNm,"fnm");
            mat_temp = this.iStage.myDomain.cCreatMatter(fnm,mass_temp,this.iStage.myDomain.sTemp);
            if(this.iStage.myDomain.cCore[mat_temp].cState == 1)
            {
               root["Sounder"].gotoAndPlay("Solid");
               am = M + "g";
            }
            else if(this.iStage.myDomain.cCore[mat_temp].cState == 2)
            {
               root["Sounder"].gotoAndPlay("Liquid");
               am = M / this.iStage.myDomain.cCore[mat_temp].cDensity + "ml";
            }
            else
            {
               am = M + "g";
            }
            if(this.iStage.myDomain.cDbs.cLoad(e.iNm,"tp") == "Solution")
            {
               water_mass = e.iNm == "H2SO4" ? 0.9 : 0.1;
               water = obj.cDv.cMt.cGetWater();
               if(!water)
               {
                  water_temp = this.iStage.myDomain.cCreatMatter("H2O",mass_temp * water_mass,this.iStage.myDomain.sTemp);
                  obj.cDv.cMt.cAddSub(this.iStage.myDomain.cCore[water_temp],1,true);
               }
               else
               {
                  water.cFlow(water_mass,"cVol");
               }
            }
            obj.cDv.cMt.cAddSub(this.iStage.myDomain.cCore[mat_temp],1,true);
            this.ReportSub(am,iSubscriptor.iSub(e.iNm),this.iStage.myDomain.cCore[mat_temp].cState,obj.iUID);
            obj.iSubRefresh();
            this.iAddNm2 = 0;
         }
         else
         {
            this.pCreate(e.pos,"cDevice");
            cd_temp = this.iStage.myDomain.cDbs.cLoad(this.chemiName,"mix");
            for(i = 0; i < cd_temp.length; i++)
            {
               cv_temp = this.iStage.myDomain.cDbs.cLoad(this.chemiName,"mixr")[i];
               mat_temp = this.iStage.myDomain.cCreatMatter(cd_temp[i],cv_temp,this.iStage.myDomain.sTemp);
               this.iStage.myLab.iObject.cDv.cMt.cAddSub(this.iStage.myDomain.cCore[mat_temp],1);
            }
         }
      }
      
      public function showDetail(n:String, e:*, n2:*) : void
      {
         this.noteName = n;
         this.noteName2 = n2;
         this.iCreator.movNote.x = e.x + 35 + this.iCreator.ele.x;
         this.iCreator.movNote.gotoAndPlay(2);
         this.msdNote.play();
      }
      
      public function getFml(n:String) : String
      {
         var i:* = undefined;
         var t:String = "";
         for(i in this.iStage.myDomain.cDbs.RDb)
         {
            if(this.iStage.myDomain.cDbs.RDb[i].cA.indexOf(n) >= 0 || this.iStage.myDomain.cDbs.RDb[i].cP.indexOf(n) >= 0)
            {
               t += this.getCompFml(i) + "\n";
            }
         }
         return t;
      }
      
      public function getFmlNumber(n:String) : Number
      {
         var i:* = undefined;
         var t:Number = 0;
         for(i in this.iStage.myDomain.cDbs.RDb)
         {
            if(this.iStage.myDomain.cDbs.RDb[i].cA.indexOf(n) >= 0 || this.iStage.myDomain.cDbs.RDb[i].cP.indexOf(n) >= 0)
            {
               t++;
            }
         }
         return t;
      }
      
      private function getCompFml(t:String) : String
      {
         var txt:String = "";
         txt += this.iStage.myDomain.cDbs.iGetFml(t,true);
         if(this.iStage.myDomain.cDbs.RDb[t].Temp == "Ignite")
         {
            txt += " (Ignite)";
         }
         else if(this.iStage.myDomain.cDbs.RDb[t].Temp == "Shock")
         {
            txt += " (Shock)";
         }
         else if(this.iStage.myDomain.cDbs.RDb[t].Temp[0] > this.iStage.myDomain.sTemp)
         {
            txt += " (Heat)";
         }
         if(this.iStage.myDomain.cDbs.RDb[t].cata != null)
         {
            txt += " (" + iSubscriptor.iSub(this.iStage.myDomain.cDbs.RDb[t].cata) + ")";
         }
         return txt;
      }
      
      private function doChemAdd(e:*) : *
      {
         var mass_temp:* = undefined;
         var mat_temp:* = undefined;
         if(this.iStage.myDomain.cDbs.cLoad(this.chemiName,"mix") == null)
         {
            mass_temp = this.chemiAddMass;
            mat_temp = this.iStage.myDomain.cCreatMatter(this.chemiName,mass_temp,this.iStage.myDomain.sTemp);
            this.iStage.myLab.iObject.cDv.cMt.cAddSub(this.iStage.myDomain.cCore[mat_temp],1);
            if(this.iStage.myDomain.cCore[mat_temp].cState == 1)
            {
               root["Sounder"].gotoAndPlay("Solid");
            }
            else if(this.iStage.myDomain.cCore[mat_temp].cState == 2)
            {
               root["Sounder"].gotoAndPlay("Liquid");
            }
         }
         this.iCreator.movAlp.visible = true;
         this.iCreator.gotoAndStop(1);
      }
      
      public function d_atmbtn(e:*) : *
      {
         this.d_atmset(0);
      }
      
      public function doExp(obj:*) : void
      {
         this.mClean.visible = true;
         this.mClean.addEventListener(MouseEvent.MOUSE_DOWN,this.cleandown);
         obj.addEventListener(MouseEvent.MOUSE_DOWN,this.cleandown);
      }
      
      private function cleandown(e:MouseEvent) : void
      {
         this.mcleanX = mouseX;
         this.minitcleanX = this.mClean.x;
         this.mClean.startDrag(false,new Rectangle(this.mClean.x,this.mClean.y,1000,0));
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.cleanmove);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.cleanup);
      }
      
      private function cleanmove(e:MouseEvent) : void
      {
         if(this.mClean.x > this.minitcleanX)
         {
            this.iStage.myLab.iCleanMove(mouseX - this.mcleanX);
            this.mcleanX = mouseX;
         }
      }
      
      private function cleanup(e:MouseEvent) : void
      {
         this.mClean.stopDrag();
         if(mouseX > this.mcleanX)
         {
            this.Clean();
         }
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.cleanmove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.cleanup);
      }
      
      public function pAchPlay(nm:*) : *
      {
         this.pAchGet.gotoAndPlay(2);
         if(this.pAchGet.inst != null)
         {
            this.pAchGet.inst.text = parent["myAch"].iAchChart[nm].inst;
            this.pAchGet.pt.text = String(parent["myAch"].iAchChart[nm].pt);
         }
      }
      
      public function Acted() : Boolean
      {
         if(this.ConfigSo.data.sAct != null)
         {
            return true;
         }
         return false;
      }
      
      private function SetSound() : void
      {
         if(this.iStage.myDomain.sSound)
         {
            SoundMixer.soundTransform = new SoundTransform(1);
         }
         else
         {
            SoundMixer.soundTransform = new SoundTransform(0);
         }
      }
      
      public function d_saveConfif() : *
      {
         this.SetSound();
         var data:Object = this.ConfigSo.data;
         data.sExp = this.iStage.myDomain.sExp;
         data.sFml = this.iStage.myDomain.sFml;
         data.sAch = this.iStage.myDomain.sAch;
         data.sKid = this.iStage.myDomain.sKid;
         data.sSound = this.iStage.myDomain.sSound;
         this.ConfigSo.flush();
      }
      
      public function d_saveAct() : *
      {
         this.ConfigSo.data.sAct = true;
         this.ConfigSo.flush();
      }
      
      public function d_loadConfig() : *
      {
         var data:Object = this.ConfigSo.data;
         if(data.sExp != null)
         {
            this.iStage.myDomain.sExp = data.sExp;
            this.iStage.myDomain.sFml = data.sFml;
            this.iStage.myDomain.sAch = data.sAch;
            this.iStage.myDomain.sSound = data.sSound;
            this.iStage.myDomain.sKid = false;
         }
         this.SetSound();
      }
      
      public function d_loadAtm() : *
      {
         var i:* = undefined;
         if(this.ConfigSo.data.sHasAtm)
         {
            this.iStage.myDomain.sAtm = new Array();
            this.iStage.myDomain.sAtmPct = new Array();
            this.iStage.myDomain.sAtmN = this.ConfigSo.data.sAtmN;
            for(i in this.ConfigSo.data.sAtm)
            {
               this.iStage.myDomain.sAtm[i] = this.ConfigSo.data.sAtm[i];
               this.iStage.myDomain.sAtmPct[i] = this.ConfigSo.data.sAtmPct[i];
            }
            this.iStage.myDomain.sTemp = this.ConfigSo.data.sTemp;
            if(this.ConfigSo.data.cSpeed != null)
            {
               this.iStage.myDomain.cSpeed = this.ConfigSo.data.cSpeed;
               if(this.iStage.myDomain.cSpeed == 0)
               {
               }
            }
            else
            {
               this.iStage.myDomain.cSpeed = 1;
            }
         }
      }
      
      public function d_saveAtm() : *
      {
         this.ConfigSo.data.sAtmPct = this.iStage.myDomain.sAtmPct;
         this.ConfigSo.data.sAtmN = this.iStage.myDomain.sAtmN;
         this.ConfigSo.data.cSpeed = this.iStage.myDomain.cSpeed;
         this.ConfigSo.data.sAtm = this.iStage.myDomain.sAtm;
         this.ConfigSo.data.sTemp = this.iStage.myDomain.sTemp;
         this.ConfigSo.data.sHasAtm = true;
         this.ConfigSo.flush();
         this.iStage.myLab.myReport.NewAction(ActionType.SETLAB,String(this.iStage.myDomain.sTemp),String(this.iStage.myDomain.sAtmN),String(this.iStage.myDomain.cSpeed));
      }
      
      public function d_store(e:*) : *
      {
         this.iStage.myLab.iStore();
         this.iMenu.gotoAndStop(1);
      }
      
      public function d_load(e:*) : *
      {
         this.iStage.myLab.iLoad();
         this.iMenu.gotoAndStop(1);
      }
      
      public function d_stset(e:*) : *
      {
         this.iMenu.gotoAndStop("StSet1");
         this.iMenu.pClose.addEventListener(MouseEvent.MOUSE_DOWN,this.d_quit);
         this.temp_k = 0;
      }
      
      public function d_reset(e:*) : *
      {
         if(root["iWc"].currentFrame == 454)
         {
            root["iWc"].play();
         }
         this.iMenu.gotoAndStop("Reset");
         this.iMenu.pClose.addEventListener(MouseEvent.MOUSE_DOWN,this.d_quit);
      }
      
      public function d_share(e:*) : *
      {
         this.iMenu.gotoAndStop("Share");
      }
      
      private function d_fb(e:*) : void
      {
         this.updir = "fb";
         this.UpSend();
         this.d_quit(0);
      }
      
      private function d_tt(e:*) : void
      {
         this.updir = "tt";
         this.UpSend();
         this.d_quit(0);
      }
      
      private function d_email(e:*) : void
      {
         this.updir = "em";
         this.UpSend();
         this.d_quit(0);
      }
      
      private function upsendcomp(event:Event) : void
      {
         var request:URLRequest = null;
         Uploader.evts.removeEventListener(Event.COMPLETE,this.upsendcomp);
         var shortUrl:String = "http://thixlab.com/Chemistviewer.swf?id=" + this.id;
         if(this.updir == "fb")
         {
            this.openPage("http://www.facebook.com/sharer/sharer.php?t=My Experiment&u=" + escape(shortUrl),"_popup");
         }
         else if(this.updir == "tt")
         {
            this.openPage("https://twitter.com/intent/tweet?source=webclient&text=My+Experiment+by+THIX+Chemist+" + escape(shortUrl),"_popup");
         }
         else if(this.updir == "em")
         {
            request = new URLRequest("mailto:?subject=My Experiment&body=\nMy Experiment by Chemist\nLink: " + shortUrl);
            navigateToURL(request,"_self");
         }
      }
      
      private function onShortenComplete(event:Event) : void
      {
         var request:URLRequest = null;
         var shortUrl:String = this.us.url;
         if(this.updir == "fb")
         {
            this.openPage("http://www.facebook.com/sharer/sharer.php?t=My Experiment&u=" + escape(shortUrl),"_popup");
         }
         else if(this.updir == "tt")
         {
            this.openPage("https://twitter.com/intent/tweet?source=webclient&text=My+Experiment+by+THIX+Chemist+" + escape(shortUrl),"_popup");
         }
         else if(this.updir == "em")
         {
            request = new URLRequest("mailto:?subject=My Experiment&body=\nMy Experiment by Chemist\nLink: " + shortUrl);
            navigateToURL(request,"_self");
         }
         this.us.removeEventListener(Event.COMPLETE,this.onShortenComplete);
      }
      
      private function UpSend() : void
      {
         this.id = UIDUtil.createUID();
         Uploader.iSend(this.iStage.myLab.iCode(),this.id);
         Uploader.evts.addEventListener(Event.COMPLETE,this.upsendcomp);
      }
      
      private function openPage(url:String, linkWindow:String = "_blank", popUpDimensions:Array = null) : void
      {
         var dimensions:Array = null;
         var window:String = null;
         if(linkWindow == "_popup" && Boolean(ExternalInterface.available))
         {
            dimensions = [800,600];
            ExternalInterface.call("window.open(\'" + url + "\',\'PopUpWindow\',\'width=" + dimensions[0] + ",height=" + dimensions[1] + ",toolbar=yes,scrollbars=yes\')");
         }
         else
         {
            window = linkWindow == "_popup" ? "_blank" : linkWindow;
            if(ExternalInterface.available)
            {
               ExternalInterface.call("window.open(\"" + url + "\",\"" + window + "\")");
            }
            else
            {
               navigateToURL(new URLRequest(url),window);
            }
         }
      }
      
      public function d_label(e:*) : *
      {
         addEventListener(Event.ENTER_FRAME,this.d_labelloop);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.d_labelmu);
      }
      
      public function d_labelloop(e:*) : *
      {
         ++this.d_labeltime;
         if(this.d_labeltime >= 30)
         {
            this.dShowLabel();
         }
      }
      
      public function dShowLabel() : void
      {
         this.iMenu.gotoAndStop("Label2");
         this.iShowLabel = true;
         var lt:Number = 1;
         if(this.iMenu.lMass.hitTestPoint(mouseX,mouseY))
         {
            lt = 2;
            this.iMenu.lMass.gotoAndStop(2);
            this.iMenu.lVolume.gotoAndStop(1);
            this.iMenu.lTemp.gotoAndStop(1);
            this.iMenu.lMol.gotoAndStop(1);
            this.iMenu.lMolarity.gotoAndStop(1);
         }
         else if(this.iMenu.lVolume.hitTestPoint(mouseX,mouseY))
         {
            lt = 3;
            this.iMenu.lVolume.gotoAndStop(2);
            this.iMenu.lMass.gotoAndStop(1);
            this.iMenu.lTemp.gotoAndStop(1);
            this.iMenu.lMol.gotoAndStop(1);
            this.iMenu.lMolarity.gotoAndStop(1);
         }
         else if(this.iMenu.lMol.hitTestPoint(mouseX,mouseY))
         {
            lt = 4;
            this.iMenu.lMol.gotoAndStop(2);
            this.iMenu.lVolume.gotoAndStop(1);
            this.iMenu.lMass.gotoAndStop(1);
            this.iMenu.lTemp.gotoAndStop(1);
            this.iMenu.lMolarity.gotoAndStop(1);
         }
         else if(this.iMenu.lTemp.hitTestPoint(mouseX,mouseY))
         {
            lt = 5;
            this.iMenu.lMass.gotoAndStop(1);
            this.iMenu.lVolume.gotoAndStop(1);
            this.iMenu.lTemp.gotoAndStop(2);
            this.iMenu.lMol.gotoAndStop(1);
            this.iMenu.lMolarity.gotoAndStop(1);
         }
         else if(this.iMenu.lMolarity.hitTestPoint(mouseX,mouseY))
         {
            lt = 6;
            this.iMenu.lMolarity.gotoAndStop(2);
            this.iMenu.lVolume.gotoAndStop(1);
            this.iMenu.lMass.gotoAndStop(1);
            this.iMenu.lTemp.gotoAndStop(1);
            this.iMenu.lMol.gotoAndStop(1);
         }
         this.LabelType = lt;
         this.bset.iconLabel.gotoAndStop(lt);
      }
      
      public function d_labelmu(e:*) : *
      {
         removeEventListener(Event.ENTER_FRAME,this.d_labelloop);
         if(this.d_labeltime < 30)
         {
            if(root["iWc"].currentFrame == 427)
            {
               root["iWc"].play();
            }
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.d_labelmu);
            this.iMenu.gotoAndStop("Label");
            this.iMenu.pClose.addEventListener(MouseEvent.MOUSE_DOWN,this.d_quit);
         }
         else
         {
            this.LabelType = 1;
            this.iMenu.gotoAndStop(1);
            this.iShowLabel = false;
            this.bset.iconLabel.gotoAndStop(1);
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.d_labelmu);
         }
         this.d_labeltime = 0;
      }
      
      public function d_upgrade(e:*) : *
      {
         this.btnUpgrade.visible = false;
         this.iMenu.gotoAndStop("upgrade");
         this.iMenu.movUpgrade.x = -380.25 + (Window.getRes() - 1) * 150;
         this.iMenu.btnDo.x = -380.25 + (Window.getRes() - 1) * 150;
         this.iMenu.btnDo.addEventListener(MouseEvent.MOUSE_DOWN,this.d_doupgrade);
         this.iMenu.pClose.addEventListener(MouseEvent.MOUSE_DOWN,this.d_quit);
      }
      
      public function d_doupgrade(e:*) : *
      {
         navigateToURL(new URLRequest("https://itunes.apple.com/app/chemist-by-thix/id440666387"));
      }
      
      public function d_atmset(e:*) : *
      {
         this.iMenu.gotoAndStop("AtmSet");
         this.iMenu.pReturn.addEventListener(MouseEvent.MOUSE_DOWN,this.d_quit);
      }
      
      public function d_stsetsave(e:*) : *
      {
         this.d_saveConfif();
      }
      
      public function d_stsetsave2(e:*) : *
      {
         this.d_saveAtm();
      }
      
      public function iLoadStSet(n:*) : *
      {
         if(n)
         {
            this.iMenu.sExp.selected = this.iStage.myDomain.sExp;
            this.iMenu.sFml.selected = this.iStage.myDomain.sFml;
            this.iMenu.sAch.selected = this.iStage.myDomain.sAch;
            this.iMenu.sSound.selected = this.iStage.myDomain.sSound;
         }
         else
         {
            this.iStage.myDomain.sExp = this.iMenu.sExp.selected;
            this.iStage.myDomain.sFml = this.iMenu.sFml.selected;
            this.iStage.myDomain.sAch = this.iMenu.sAch.selected;
            this.iStage.myDomain.sSound = this.iMenu.sSound.selected;
         }
      }
      
      public function d_dft2(e:*) : *
      {
         var dt_temp:* = new DataProvider();
         dt_temp.addItem({
            "Percentage":78,
            "Gas":"N2"
         });
         dt_temp.addItem({
            "Percentage":21,
            "Gas":"O2"
         });
         dt_temp.addItem({
            "Percentage":0.03,
            "Gas":"CO2"
         });
         dt_temp.addItem({
            "Percentage":0.94,
            "Gas":"He"
         });
         dt_temp.addItem({
            "Percentage":0.02,
            "Gas":"H2O"
         });
         this.iMenu.sAtm.dataProvider = dt_temp;
         this.iMenu.txtTemp.text = 25;
         this.d_stsetsave2(0);
      }
      
      public function d_ss2(e:*) : *
      {
         var dt_temp:* = new DataProvider();
         dt_temp.addItem({
            "Percentage":78,
            "Gas":"N2"
         });
         dt_temp.addItem({
            "Percentage":22,
            "Gas":"O2"
         });
         this.iMenu.sAtm.dataProvider = dt_temp;
         this.iMenu.txtTemp.text = 0;
         this.d_stsetsave2(0);
      }
      
      public function d_po(e:*) : *
      {
         var dt_temp:* = new DataProvider();
         dt_temp.addItem({
            "Percentage":100,
            "Gas":"O2"
         });
         this.iMenu.sAtm.dataProvider = dt_temp;
         this.iMenu.txtTemp.text = 25;
         this.d_stsetsave2(0);
      }
      
      public function d_ideal(e:*) : *
      {
         var dt_temp:* = new DataProvider();
         dt_temp.addItem({
            "Percentage":100,
            "Gas":"N2"
         });
         this.iMenu.sAtm.dataProvider = dt_temp;
         this.iMenu.txtTemp.text = 25;
         this.d_stsetsave2(0);
      }
      
      public function d_ac(e:*) : *
      {
         if(root["iWc"].currentFrame == 463)
         {
            root["iWc"].play();
         }
         this.mClean.visible = false;
         this.mClean.x = 595;
         this.mClean.removeEventListener(MouseEvent.MOUSE_DOWN,this.cleandown);
         this.cleaningx = 0;
         this.iStage.myLab.iFmls.iClear();
         this.iStage.myLab.iClear(2);
         this.iStage.myLab.iDsk.iReset.gotoAndPlay(2);
      }
      
      public function Clean() : void
      {
         this.mClean.removeEventListener(MouseEvent.MOUSE_DOWN,this.cleandown);
         addEventListener(Event.ENTER_FRAME,this.cleanevent);
      }
      
      private function cleanevent(e:*) : void
      {
         var sp:* = (1500 - this.mClean.x) * 0.2;
         var sp2:* = (1500 - this.cleaningx) * 0.2;
         this.cleaningx += sp2;
         this.mClean.x += sp;
         this.iStage.myLab.iCleanMove(sp2);
         if(this.cleaningx > 1200)
         {
            this.iStage.myLab.iClear(1);
            this.cleaningx = 0;
            this.mClean.visible = false;
            this.mClean.x = 595;
            removeEventListener(Event.ENTER_FRAME,this.cleanevent);
         }
      }
      
      public function d_ign(e:*) : *
      {
         this.iActivate(true);
         this.iIgnTX = e.stageX;
         this.iIgnTY = e.stageY;
         this.iStage.myLab.iSelected = null;
         this.doCreatetool();
         this.iStage.myLab.iIgn = !this.iStage.myLab.iIgn;
         if(this.iStage.myLab.iIgn)
         {
            if(this.iMenu.currentFrame == 5)
            {
               this.iMenu.mIgn.visible = true;
            }
            this.iStage.myLab.mSd.inmPreIgn.play();
            this.iFlm.gotoAndStop(2);
            this.iIGNTID = e.touchPointID;
            this.mFlameStream = this.iStage.myLab.mSd.inmFlame.play(0,9999);
            stage.addEventListener(TouchEvent.TOUCH_MOVE,this.moveIgn);
            stage.addEventListener(TouchEvent.TOUCH_END,this.stopIgn);
            addEventListener(Event.ENTER_FRAME,this.moveIgn2);
         }
      }
      
      public function d_ign2(e:*) : *
      {
      }
      
      public function iStopIgn() : *
      {
         this.iStage.myLab.iIgn = false;
         this.iActivate(false);
         this.mFlameStream.stop();
         if(this.iFlm.currentFrame != 3)
         {
            this.iFlm.gotoAndStop(3);
         }
         if(this.iMenu.currentFrame == 5)
         {
            this.iMenu.mIgn.visible = false;
         }
      }
      
      private function moveIgn(e:TouchEvent) : *
      {
         if(e.touchPointID == this.iIGNTID)
         {
            this.iIgnTX = e.stageX;
            this.iIgnTY = e.stageY;
            this.mFlameStream.soundTransform = new SoundTransform(0.6,(e.stageX - 512) / 512);
         }
      }
      
      private function moveIgn2(e:Event) : void
      {
         var obj:* = this.iStage.myLab.iHitToolPointHeat(this.iIgnTX,this.iIgnTY - 20);
         if(obj != null)
         {
            obj.iDoIgn(true);
            this.IgnObj = obj;
            if(!this.iIgning)
            {
               this.iStage.myLab.myReport.NewAction(ActionType.BURN,obj.iUID);
            }
            this.iIgning = true;
         }
         else if(this.iIgning)
         {
            this.iFlm.gotoAndStop(2);
            this.iIgning = false;
            if(this.IgnObj.iGenr == "Container")
            {
               this.IgnObj.iBlasted = false;
            }
         }
      }
      
      public function iBlastIgn() : *
      {
         if(this.iFlm.currentFrame == 2)
         {
            this.iFlm.gotoAndStop(4);
         }
      }
      
      public function iMoreIgn() : *
      {
         if(this.iFlm.currentFrame == 2)
         {
            this.iFlm.gotoAndStop(5);
            trace("mign");
         }
      }
      
      private function stopIgn(e:*) : *
      {
         if(e.touchPointID == this.iIGNTID)
         {
            this.iIGNTID = 0;
            this.iActivate(false);
            this.mFlameStream.stop();
            this.iFlm.gotoAndStop(1);
            trace(this.iMenu.currentFrame);
            if(this.iMenu.currentFrame == 5)
            {
               this.iMenu.mIgn.visible = false;
            }
            this.iStage.myLab.shineObj = null;
            this.iStage.myLab.iIgn = false;
            stage.removeEventListener(TouchEvent.TOUCH_MOVE,this.moveIgn);
            stage.removeEventListener(TouchEvent.TOUCH_END,this.stopIgn);
            removeEventListener(Event.ENTER_FRAME,this.moveIgn2);
         }
      }
      
      public function d_gr(e:*) : *
      {
         this.iActivate(true);
         this.doCreatetool();
         this.iStage.myLab.iSelected = null;
         this.iStage.myLab.shineObj = null;
         this.iStage.myLab.iGr = true;
         if(this.iMenu.currentFrame == 5)
         {
            this.iMenu.mGr.visible = true;
         }
         this.iGr.Rod.rotation = 0;
         this.iGr.Rotation.visible = false;
         this.iGr.GrShadow.rotation = 0;
         this.iGr.x = mouseX;
         this.iGr.y = mouseY;
         this.iGr.startTouchDrag(e.touchPointID,true);
         this.iGRTID = e.touchPointID;
         this.iGr.visible = true;
         stage.addEventListener(TouchEvent.TOUCH_MOVE,this.moveGr);
         stage.addEventListener(TouchEvent.TOUCH_END,this.stopGr);
      }
      
      public function moveGr(e:TouchEvent) : *
      {
         var obj:* = undefined;
         if(this.iGRTID == e.touchPointID)
         {
            obj = this.iStage.myLab.iHitToolPoint(e.stageX,e.stageY + 50);
            if(obj != null)
            {
               if(!this.iGring)
               {
                  this.iStage.myLab.myReport.NewAction(ActionType.STIR,obj.iUID);
                  this.iGring = true;
                  this.iGr.Rotation.visible = true;
                  this.iGr.stopTouchDrag(this.iGRTID);
                  this.iGr.y = obj.y - 150;
                  this.iGr.x = obj.x + obj.iD.x;
               }
               if(this.pre_rt != this.iGr.Rod.rotation)
               {
                  obj.cDv.cMix(true);
                  this.pre_rt = this.iGr.Rod.rotation;
               }
               else
               {
                  obj.cDv.cMix(false);
               }
               this.iGr.Rod.rotation = (e.stageX - obj.x) * 0.25;
               this.iGr.GrShadow.rotation = -this.iGr.Rod.rotation;
               this.iGringObj = obj;
            }
            else if(this.iGring)
            {
               this.iGring = false;
               this.iGr.Rotation.visible = false;
               this.iGr.Rod.rotation = 0;
               this.iGr.startTouchDrag(this.iGRTID,true);
               this.iGringObj.cDv.cMix(false);
            }
         }
      }
      
      public function d_dt(e:*) : *
      {
         this.iActivate(true);
         this.doCreatetool();
         this.iStage.myLab.iSelected = null;
         this.iStage.myLab.shineObj = null;
         this.iStage.myLab.iDt = true;
         if(this.iMenu.currentFrame == 5)
         {
            this.iMenu.mDt.visible = true;
         }
         this.iDt.x = mouseX;
         this.iDt.y = mouseY;
         this.iDt.startTouchDrag(e.touchPointID,true);
         this.iDTTID = e.touchPointID;
         this.iDt.visible = true;
         addEventListener(Event.ENTER_FRAME,this.moveDt);
         stage.addEventListener(TouchEvent.TOUCH_END,this.stopDt);
      }
      
      public function moveDt(e:*) : *
      {
         var obj:* = this.iStage.myLab.iHitTool(this.iDt);
         if(obj != null)
         {
            if(!this.iDting)
            {
               this.iStage.myLab.myReport.NewAction(ActionType.TESTDT,obj.iUID);
            }
            this.iDting = true;
            this.iDt.Value.visible = true;
            this.iDt.Value.txtVal.text = obj.iGetTemp();
         }
         else if(this.iDting)
         {
            this.iDting = false;
            this.iDt.Value.visible = false;
         }
      }
      
      private function stopDt(e:*) : *
      {
         if(this.iDTTID == e.touchPointID)
         {
            this.iDTTID = 0;
            this.iActivate(false);
            this.iDt.stopTouchDrag(e.touchPointID);
            this.iDt.visible = false;
            if(this.iStage.myLab.shineObj != null)
            {
               this.iStage.myLab.shineObj.movLeak.alpha = 1;
               this.iStage.myLab.shineObj = null;
            }
            if(this.iMenu.currentFrame == 5)
            {
               this.iMenu.mDt.visible = false;
            }
            this.iStage.myLab.iDt = false;
            removeEventListener(Event.ENTER_FRAME,this.moveDt);
            stage.removeEventListener(TouchEvent.TOUCH_END,this.stopDt);
         }
      }
      
      public function d_dr(e:*) : *
      {
         this.iActivate(true);
         this.doCreatetool();
         this.iStage.myLab.iSelected = null;
         this.iStage.myLab.shineObj = null;
         this.iStage.myLab.iDr = true;
         if(this.iMenu.currentFrame == 5)
         {
            this.iMenu.mDr.visible = true;
         }
         this.iDr.startTouchDrag(e.touchPointID,true);
         this.iDRTID = e.touchPointID;
         stage.addEventListener(TouchEvent.TOUCH_MOVE,this.moveDr);
         stage.addEventListener(TouchEvent.TOUCH_END,this.stopDr);
      }
      
      public function moveDr(e:TouchEvent) : *
      {
         var obj:* = undefined;
         if(e.touchPointID == this.iDRTID)
         {
            this.iDr.visible = true;
            obj = this.iStage.myLab.iHitToolPointDr(e.stageX,e.stageY + 100);
            if(obj != null)
            {
               if(!this.iDring)
               {
                  this.iDring = true;
                  this.iDr.stopTouchDrag(this.iDRTID);
                  this.iDr.y = obj.y - 150;
                  this.iDr.x = obj.x + 40;
                  this.iDr.iStart(obj);
               }
            }
            else if(this.iDring)
            {
               this.iDring = false;
               this.iDr.iStop();
               if(this.iDr.isSucked)
               {
                  this.iDr.iAction.gotoAndStop(17);
                  this.iDr.y = e.stageY + 90 + 100;
                  this.iDr.x = e.stageX - 22;
               }
               else
               {
                  this.iDr.iAction.gotoAndStop(1);
                  this.iDr.y = e.stageY + 100;
                  this.iDr.x = e.stageX - 22;
                  this.iDr.iAction.visible = false;
               }
               this.iDr.startTouchDrag(this.iDRTID,true);
            }
         }
      }
      
      public function stopDr(e:TouchEvent) : *
      {
         if(this.iDRTID == e.touchPointID)
         {
            this.iDRTID = 0;
            this.iActivate(false);
            this.iDr.stopTouchDrag(e.touchPointID);
            this.iDr.visible = false;
            if(this.iStage.myLab.shineObj != null)
            {
               this.iStage.myLab.shineObj.movLeak.alpha = 1;
               this.iStage.myLab.shineObj = null;
            }
            if(this.iMenu.currentFrame == 5)
            {
               this.iMenu.mDr.visible = false;
            }
            this.iDr.iStop();
            this.iStage.myLab.iDr = false;
            stage.removeEventListener(TouchEvent.TOUCH_MOVE,this.moveDr);
            stage.removeEventListener(TouchEvent.TOUCH_END,this.stopDr);
         }
      }
      
      public function stopDr2() : void
      {
         this.iDRTID = 0;
         this.iActivate(false);
         this.iDr.stopTouchDrag(e.touchPointID);
         this.iDr.visible = false;
         if(this.iStage.myLab.shineObj != null)
         {
            this.iStage.myLab.shineObj.movLeak.alpha = 1;
            this.iStage.myLab.shineObj = null;
         }
         if(this.iMenu.currentFrame == 5)
         {
            this.iMenu.mDr.visible = false;
         }
         this.iDr.iStop();
         this.iStage.myLab.iDr = false;
         stage.removeEventListener(TouchEvent.TOUCH_MOVE,this.moveDr);
         stage.removeEventListener(TouchEvent.TOUCH_END,this.stopDr);
      }
      
      private function stopGr(e:*) : *
      {
         if(this.iGRTID == e.touchPointID)
         {
            this.iGRTID = 0;
            this.iActivate(false);
            this.iGr.stopTouchDrag(e.touchPointID);
            this.iGr.visible = false;
            this.iStage.myLab.iGr = false;
            if(this.iGring)
            {
               this.iGring = false;
               this.iGringObj.cDv.cMix(false);
            }
            if(this.iStage.myLab.shineObj != null)
            {
               this.iStage.myLab.shineObj.movLeak.alpha = 1;
               this.iStage.myLab.shineObj = null;
            }
            if(this.iMenu.currentFrame == 5)
            {
               this.iMenu.mGr.visible = false;
            }
            this.iStage.myLab.iGr = false;
            stage.removeEventListener(TouchEvent.TOUCH_END,this.stopGr);
         }
      }
      
      public function d_ph(e:TouchEvent) : *
      {
         this.iActivate(true);
         this.iStage.myLab.iSelected = null;
         this.iStage.myLab.shineObj = null;
         this.doCreatetool();
         this.iStage.myLab.ipH = !this.iStage.myLab.ipH;
         if(this.iStage.myLab.ipH)
         {
            if(this.iMenu.currentFrame == 5)
            {
               this.iMenu.mPh.visible = true;
            }
            this.ipH.gotoAndPlay(2);
            this.ipH.x = mouseX;
            this.ipH.y = mouseY;
            this.ipH.startTouchDrag(e.touchPointID,true);
            addChild(this.ipH);
            this.iPHTID = e.touchPointID;
            addEventListener(Event.ENTER_FRAME,this.movepH);
            stage.addEventListener(TouchEvent.TOUCH_END,this.stoppH);
         }
      }
      
      public function d_ph2(e:*) : *
      {
         this.iActivate(true);
      }
      
      private function stoppH(e:TouchEvent) : *
      {
         if(this.iPHTID == e.touchPointID)
         {
            this.iPHTID = 0;
            this.iActivate(false);
            this.iFlm.gotoAndStop(1);
            this.ipH.stopTouchDrag(e.touchPointID);
            this.ipH.gotoAndStop(1);
            this.ipH.x = 0;
            this.ipH.y = 0;
            if(this.iMenu.currentFrame == 5)
            {
               this.iMenu.mPh.visible = false;
            }
            removeChild(this.ipH);
            if(this.iStage.myLab.shineObj != null)
            {
               this.iStage.myLab.shineObj.movLeak.alpha = 1;
               this.iStage.myLab.shineObj = null;
            }
            this.iStage.myLab.ipH = false;
            removeEventListener(Event.ENTER_FRAME,this.movepH);
            stage.removeEventListener(TouchEvent.TOUCH_END,this.stoppH);
         }
      }
      
      private function movepH(e:*) : *
      {
         var ph:Number = NaN;
         var tpc:ColorTransform = null;
         var obj:* = this.iStage.myLab.iHitTool(this.ipH);
         if(obj != null)
         {
            if(!this.iPhing)
            {
               this.iStage.myLab.myReport.NewAction(ActionType.TESTPH,obj.iUID);
            }
            this.iPhing = true;
            if(this.ipH.currentFrame == 7)
            {
               if(obj.cDv.cMt.cGetWater() == null)
               {
                  this.ipH.gotoAndStop("error");
               }
               else
               {
                  this.ipH.gotoAndPlay(8);
               }
            }
            if(this.ipH.currentFrame == 20)
            {
               ph = Number(obj.getpH());
               if(ph < 1)
               {
                  ph = 1;
               }
               if(ph > 14)
               {
                  ph = 14;
               }
               tpc = new ColorTransform();
               tpc.color = this.getpHColor(ph);
               if(this.ipH.movColor.alpha < 0.8)
               {
                  this.ipH.movColor.alpha += 0.1;
                  this.ipH.movPointer.alpha += 0.1;
                  this.ipH.movPointer2.alpha += 0.1;
               }
               this.ipH.movColor.movColor.transform.colorTransform = tpc;
               this.ipH.movPointer.x = ph * 10.7 - 137;
               this.ipH.movPointer2.x = ph * 10.7 - 137;
            }
         }
         else if(this.iPhing)
         {
            this.iPhing = false;
            this.ipH.gotoAndStop(7);
         }
      }
      
      private function getpHColor(ph:Number) : Number
      {
         if(ph >= 1 && ph < 2)
         {
            return 12072192;
         }
         if(ph >= 2 && ph < 3)
         {
            return 14759680;
         }
         if(ph >= 3 && ph < 4)
         {
            return 15947265;
         }
         if(ph >= 4 && ph < 5)
         {
            return 16416258;
         }
         if(ph >= 5 && ph < 6)
         {
            return 16497409;
         }
         if(ph >= 6 && ph < 7)
         {
            return 16572417;
         }
         if(ph >= 7 && ph < 8)
         {
            return 13297408;
         }
         if(ph >= 8 && ph < 9)
         {
            return 8110080;
         }
         if(ph >= 9 && ph < 10)
         {
            return 359946;
         }
         if(ph >= 10 && ph < 11)
         {
            return 1798785;
         }
         if(ph >= 11 && ph < 12)
         {
            return 3171060;
         }
         if(ph >= 12 && ph < 13)
         {
            return 2950288;
         }
         return 524358;
      }
      
      public function d_frz(e:TouchEvent) : *
      {
         this.doCreatetool();
         this.iFrzTX = e.stageX;
         this.iFrzTY = e.stageY;
         this.iActivate(true);
         this.iFRZTID = e.touchPointID;
         this.iStage.myLab.iSelected = null;
         this.iStage.myLab.iFrz = !this.iStage.myLab.iFrz;
         if(this.iStage.myLab.iFrz)
         {
            if(this.iMenu.currentFrame == 5)
            {
               this.iMenu.mFrz.visible = true;
            }
            this.iStage.myLab.mSd.inmFrz.play();
            this.iFrz.gotoAndStop(2);
            this.mFreezeStream = this.iStage.myLab.mSd.inmFreeze.play(0,9999);
            addEventListener(Event.ENTER_FRAME,this.moveFrz2);
            stage.addEventListener(TouchEvent.TOUCH_MOVE,this.moveFrz);
            stage.addEventListener(TouchEvent.TOUCH_END,this.stopFrz);
         }
      }
      
      public function d_frz2(e:*) : *
      {
         this.iActivate(true);
      }
      
      public function moveFrz2(e:*) : void
      {
         var obj:* = this.iStage.myLab.iHitToolPoint(this.iFrzTX,this.iFrzTY);
         if(obj != null)
         {
            obj.iDoFrz(true);
            this.FrzObj = obj;
            if(!this.iFrzing)
            {
               this.iStage.myLab.myReport.NewAction(ActionType.FREEZE,obj.iUID);
            }
            this.iFrzing = true;
         }
         else if(this.iFrzing)
         {
            this.iFrzing = false;
         }
      }
      
      private function moveFrz(e:TouchEvent) : *
      {
         if(e.touchPointID == this.iFRZTID)
         {
            this.iFrzTX = e.stageX;
            this.iFrzTY = e.stageY;
            this.mFreezeStream.soundTransform = new SoundTransform(1,(e.stageX - 512) / 512);
         }
      }
      
      private function stopFrz(e:TouchEvent) : *
      {
         if(e.touchPointID == this.iFRZTID)
         {
            this.iFRZTID = 0;
            this.iActivate(false);
            this.mFreezeStream.stop();
            this.iFrz.gotoAndStop(1);
            this.iStage.myLab.iFrz = false;
            this.iStage.myLab.shineObj = null;
            if(this.iMenu.currentFrame == 5)
            {
               this.iMenu.mFrz.visible = false;
            }
            removeEventListener(Event.ENTER_FRAME,this.moveFrz2);
            stage.removeEventListener(TouchEvent.TOUCH_MOVE,this.moveFrz);
            stage.removeEventListener(TouchEvent.TOUCH_END,this.stopFrz);
         }
      }
      
      public function d_magn(e:*) : *
      {
         this.iStage.myLab.iUseMagn = true;
      }
      
      private function menuquit(e:*) : void
      {
         if(this.iMenu.alpha > 0)
         {
            this.iMenu.alpha -= 0.1;
         }
         else
         {
            this.iMenu.gotoAndStop(1);
            this.iMenu.alpha = 1;
            removeEventListener(Event.ENTER_FRAME,this.menuquit);
         }
      }
      
      public function d_quit(e:*) : *
      {
         addEventListener(Event.ENTER_FRAME,this.menuquit);
         if(root["iWc"].currentFrame == 436)
         {
            root["iWc"].play();
         }
         if(this.iNote)
         {
            this.iCreator.gotoAndStop(1);
            this.iNote = false;
         }
      }
      
      private function move_Device(e:*) : *
      {
         var iy:Number = mouseY - this.move_Device_my - 200;
         var ay:Number = (60 - iy) / 260;
         if(iy > -200)
         {
            this.btnSet.movEquip.y = iy + 200;
         }
         else
         {
            this.btnSet.movEquip.y = 0;
         }
         if(ay <= 1)
         {
            this.btnSet.alpha = ay;
         }
         else
         {
            ay = 1;
         }
         if(iy < 80)
         {
            this.iCreator.y = iy;
         }
         else if(80 + Math.atan((iy - 80) / 80 + 1) / Math.PI * 300 - 75 < 120)
         {
            this.iCreator.y = 80 + Math.atan((iy - 80) / 80 + 1) / Math.PI * 300 - 75;
         }
         else
         {
            this.iCreator.y = 120;
         }
      }
      
      private function up_Device(e:*) : *
      {
         this.btnSet.movEquip.y = 0;
         this.iStage.myLab.iDsk.addEventListener(MouseEvent.MOUSE_DOWN,this.doblack1);
         this.tween_Device = new Tween(this.iCreator,"y",Regular.easeOut,this.iCreator.y,80,0.23,true);
         this.tween_btn = new Tween(this.btnSet,"alpha",Regular.easeOut,this.btnSet.alpha,0,0.2,true);
         this.tween_Device.addEventListener(TweenEvent.MOTION_FINISH,function():*
         {
            btnSetHide();
         });
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.move_Device);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.up_Device);
         if(root["iWc"].currentFrame == 116)
         {
            root["iWc"].play();
         }
         if(this.crsn)
         {
            this.eCD(1);
            this.crsn = false;
         }
      }
      
      public function add_Device(e:*) : *
      {
         this.starts.visible = false;
         this.btnSet.movEquip.gotoAndPlay(2);
         this.move_Device_my = mouseY;
         if(this.tween_Device != null)
         {
            this.tween_Device.stop();
         }
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.move_Device);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.up_Device);
         if(this.btnSet.alpha == 1)
         {
            if(root["iWc"].currentFrame == 100)
            {
               root["iWc"].play();
            }
            this.bset.iconLabel.visible = false;
            this.bset.pMenu.visible = false;
            this.bset.pRefresh.alpha = 0;
            this.iPhase = 2;
            this.crsn = true;
            this.iStage.myLab.iFmls.visible = false;
            this.iCreator.gotoAndStop(2);
            this.iStage.myLab.iSelected = null;
            this.iBlack.gotoAndPlay("Equip");
            removeEventListener(Event.ENTER_FRAME,this.settraymove);
         }
      }
      
      private function move_Sub(e:*) : *
      {
         var iy:Number = mouseY - this.move_Device_my - 150;
         var ay:Number = (60 - iy) / 260;
         if(iy > -150)
         {
            this.btnSet.movSub.y = iy + 150;
            this.btnSet.movSub2.y = iy + 150;
         }
         else
         {
            this.btnSet.movSub.y = 0;
            this.btnSet.movSub2.y = 0;
         }
         if(ay <= 1)
         {
            this.btnSet.alpha = ay;
         }
         else
         {
            ay = 1;
         }
         if(iy < 80)
         {
            this.iCreator.y = iy;
         }
         else if(80 + Math.atan((iy - 80) / 80 + 1) / Math.PI * 300 - 75 < 120)
         {
            this.iCreator.y = 80 + Math.atan((iy - 80) / 80 + 1) / Math.PI * 300 - 75;
         }
         else
         {
            this.iCreator.y = 120;
         }
      }
      
      private function up_Sub(e:*) : *
      {
         this.btnSet.movSub.y = 0;
         this.btnSet.movSub2.y = 0;
         this.iStage.myLab.iDsk.addEventListener(MouseEvent.MOUSE_DOWN,this.doblack2);
         this.tween_Device = new Tween(this.iCreator,"y",Regular.easeOut,this.iCreator.y,80,0.23,true);
         this.tween_btn = new Tween(this.btnSet,"alpha",Regular.easeOut,this.btnSet.alpha,0,0.2,true);
         this.tween_Device.addEventListener(TweenEvent.MOTION_FINISH,function():*
         {
            btnSetHide();
         });
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.move_Sub);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.up_Sub);
         this.btnSet.movSub.alpha = 0;
      }
      
      private function up_Sub2(e:*) : *
      {
         this.btnSet.movSub.alpha = 0;
      }
      
      public function add_Sub(e:*) : *
      {
         this.move_Device_my = mouseY;
         this.btnSet.movSub2.gotoAndPlay(2);
         if(this.tween_Device != null)
         {
            this.tween_Device.stop();
         }
         if(root["iWc"].currentFrame == 213)
         {
            root["iWc"].play();
         }
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.move_Sub);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.up_Sub);
         if(this.btnSet.currentFrame == 1)
         {
            this.iNewNum = 0;
            this.iPhase = 3;
            this.iStage.myDomain.cFocus(false);
            this.bset.iconLabel.visible = false;
            this.bset.pMenu.visible = false;
            this.bset.pRefresh.alpha = 0;
            this.iStage.myLab.iFmls.visible = false;
            this.iCreator.gotoAndStop(3);
            if(this.iRankTp == 6)
            {
               this.myTextField.visible = true;
            }
            this.doAddChem(0);
            this.iBlack.gotoAndStop("Sub");
            this.crsn = false;
         }
      }
      
      public function add_Tool(e:*) : *
      {
         this.btnSet.movTool.gotoAndPlay(2);
         this.move_Device_my = mouseY;
         if(this.tween_Device != null)
         {
            this.tween_Device.stop();
         }
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.move_Tool);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.up_Tool);
         if(this.btnSet.currentFrame == 1)
         {
            this.bset.iconLabel.visible = false;
            this.bset.pMenu.visible = false;
            this.bset.pRefresh.alpha = 0;
            this.iPhase = 4;
            this.iCreator.gotoAndStop(4);
            this.msdPickUp2.play();
            this.iCreator.Tools.btnMa.addEventListener(TouchEvent.TOUCH_BEGIN,this.d_ign);
            this.iCreator.Tools.btnFr.addEventListener(TouchEvent.TOUCH_BEGIN,this.d_frz);
            this.iCreator.Tools.btnpH.addEventListener(TouchEvent.TOUCH_BEGIN,this.d_ph);
            this.iCreator.Tools.btnGl.addEventListener(TouchEvent.TOUCH_BEGIN,this.d_gr);
            this.iCreator.Tools.btnTh.addEventListener(TouchEvent.TOUCH_BEGIN,this.d_dt);
            this.iCreator.Tools.btnBu.addEventListener(TouchEvent.TOUCH_BEGIN,this.d_dr);
            this.iCreator.Tools.scaleX = this.iCreator.Tools.scaleY = Window.getRes();
            this.temp_k = 0;
            this.iStage.myLab.iFmls.visible = false;
            removeEventListener(Event.ENTER_FRAME,this.settraymove);
         }
      }
      
      private function move_Tool(e:*) : *
      {
         var iy:Number = mouseY - this.move_Device_my - 60 * Window.getRes();
         var ay:Number = (60 - iy) / 260;
         if(iy > -150 * Window.getRes())
         {
            this.btnSet.movTool.y = iy + 60 * Window.getRes();
         }
         else
         {
            this.btnSet.movTool.y = 0;
         }
         if(ay <= 1)
         {
            this.btnSet.alpha = ay;
         }
         else
         {
            ay = 1;
         }
         if(iy < 80)
         {
            this.iCreator.y = iy;
         }
         else if(80 + Math.atan((iy - 80) / 80 + 1) / Math.PI * 300 - 75 < 100)
         {
            this.iCreator.y = 80 + Math.atan((iy - 80) / 80 + 1) / Math.PI * 300 - 75;
         }
         else
         {
            this.iCreator.y = 100;
         }
         this.iCreator.y *= Window.getRes();
      }
      
      private function up_Tool(e:*) : *
      {
         this.btnSet.movTool.y = 0;
         this.iCreator.gotoAndStop(4);
         this.iStage.myLab.iDsk.addEventListener(MouseEvent.MOUSE_DOWN,this.doblack1);
         this.tween_Device = new Tween(this.iCreator,"y",Regular.easeOut,this.iCreator.y,60 * Window.getRes(),0.2,true);
         this.tween_btn = new Tween(this.btnSet,"alpha",Regular.easeOut,this.btnSet.alpha,0,0.2,true);
         this.tween_Device.addEventListener(TweenEvent.MOTION_FINISH,function():*
         {
            btnSetHide();
         });
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.move_Tool);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.up_Tool);
      }
      
      public function doblack1(e:*) : void
      {
         this.doCreate();
         this.iBlack.gotoAndPlay("EquipClose");
         this.iStage.myLab.iDsk.removeEventListener(MouseEvent.MOUSE_DOWN,this.doblack1);
      }
      
      public function doblack2(e:*) : void
      {
         if(this.iCreator.currentFrame == 3)
         {
            if(this.iCreator.movNote.currentFrame != 1)
            {
               this.iCreator.movNote.gotoAndPlay(12);
            }
            else
            {
               this.doCreate();
               this.iBlack.gotoAndStop(1);
               this.iStage.myLab.iDsk.removeEventListener(MouseEvent.MOUSE_DOWN,this.doblack2);
            }
         }
         else if(this.iTap)
         {
            this.iBlack.gotoAndStop(1);
            this.iStage.myLab.iDsk.removeEventListener(MouseEvent.MOUSE_DOWN,this.doblack2);
         }
      }
      
      public function doblack2_1(e:*) : void
      {
         this.doCreate();
         this.iBlack.gotoAndStop(1);
         this.iBlack.removeEventListener(MouseEvent.MOUSE_DOWN,this.doblack2);
      }
      
      public function doblack2_2(e:*) : void
      {
         if(this.iCreator.currentFrame == 3)
         {
            if(this.btnSet.alpha != 1)
            {
               this.doCreate();
               this.iBlack.gotoAndStop(1);
               this.iBlack.removeEventListener(MouseEvent.MOUSE_DOWN,this.doblack2);
            }
         }
      }
      
      public function doblackz() : void
      {
         this.doCreate();
         this.iBlack.gotoAndStop(1);
      }
      
      public function doblack3(e:*) : void
      {
         if(this.btnSet.currentFrame != 1 && !this.iEdit)
         {
            this.doCreate();
            this.iBlack.removeEventListener(MouseEvent.CLICK,this.doblack3);
         }
      }
      
      public function rank5(e:*) : *
      {
         if(this.iRankTp != 0)
         {
            this.iRankTp = 0;
            this.elex = 100;
            this.pCD(2);
         }
      }
      
      public function rank6(e:*) : *
      {
         if(this.iRankTp != 0)
         {
            this.iRankTp = 6;
            this.elex = 100;
            this.pCD(2);
         }
      }
      
      public function rank1(e:*) : *
      {
         this.iRankTp = 1;
         this.elex = 100;
         this.hideSearch();
         this.pCD(2);
      }
      
      public function rank2(e:*) : *
      {
         this.iRankTp = 2;
         this.elex = 100;
         this.hideSearch();
         if(root["iWc"].currentFrame == 322)
         {
            root["iWc"].play();
         }
         this.pCD(2);
      }
      
      public function rank3(e:*) : *
      {
         this.iRankTp = 3;
         this.elex = 100;
         this.hideSearch();
         this.pCD(2);
      }
      
      public function rank4(e:*) : *
      {
         this.iRankTp = 4;
         this.elex = 100;
         this.hideSearch();
         this.pCD(2);
      }
      
      public function rank7(e:*) : *
      {
         this.iRankTp = 7;
         this.elex = 100;
         this.hideSearch();
         this.pCD(2);
      }
      
      private function hideSearch() : *
      {
         this.myTextField.visible = false;
      }
      
      private function initSearch() : *
      {
         this.myTextField = new StageText();
         this.myTextField.editable = true;
         this.myTextField.fontFamily = "SF UI Display Medium";
         this.myTextField.fontSize = 15;
         this.myTextField.color = 679599;
         this.myTextField.textAlign = TextFormatAlign.LEFT;
         this.myTextField.autoCapitalize = AutoCapitalize.ALL;
         this.myTextField.maxChars = 15;
         this.myTextField.returnKeyLabel = ReturnKeyLabel.DONE;
         this.myTextField.autoCorrect = false;
         this.myTextField.locale = "en-US";
         this.myTextField.visible = false;
         this.myTextField.text = "";
      }
      
      public function rankSearch(e:*) : *
      {
         this.iRankTp = 6;
         this.elex = 100;
         this.pCD(3);
         var txtField:* = this.iCreator.iTS.txtSearch2;
         var pos:* = txtField.localToGlobal(new Point(0,0));
         this.myTextField.stage = stage;
         this.myTextField.viewPort = new Rectangle(pos.x,pos.y,txtField.width + 60,txtField.height);
         this.myTextField.visible = true;
         this.myTextField.assignFocus();
         this.myTextField.addEventListener(Event.CHANGE,this.refreshSearch);
      }
      
      public function refreshSearch(e:*) : *
      {
         this.pCD(3);
      }
      
      public function ranke1(e:*) : *
      {
         this.eCD(1);
      }
      
      public function ranke2(e:*) : *
      {
         this.eCD(2);
      }
      
      public function doAlp() : void
      {
         if(this.iRankTp != 7)
         {
            this.iCreator.iTS.gotoAndStop(this.iRankTp);
         }
         else
         {
            this.iCreator.iTS.gotoAndStop(5);
         }
         this.iCreator.iTS.go1.addEventListener(MouseEvent.MOUSE_DOWN,this.rank1);
         this.iCreator.iTS.go2.addEventListener(MouseEvent.MOUSE_DOWN,this.rank2);
         this.iCreator.iTS.go3.addEventListener(MouseEvent.MOUSE_DOWN,this.rank3);
         this.iCreator.iTS.go4.addEventListener(MouseEvent.MOUSE_DOWN,this.rank4);
         this.iCreator.iTS.go5.addEventListener(MouseEvent.MOUSE_DOWN,this.rank7);
         this.iCreator.iTS.goSearch.addEventListener(MouseEvent.MOUSE_DOWN,this.rankSearch);
      }
      
      public function pCD(n:*) : *
      {
         var i:* = undefined;
         var cnt:Number = NaN;
         var ak_temp:Array = null;
         var ak_temp2:Array = null;
         var n2:* = undefined;
         var n3:* = undefined;
         var nm:* = undefined;
         var mm:* = undefined;
         var fnm:* = undefined;
         var rnm:* = undefined;
         var state:* = undefined;
         var tp:* = undefined;
         var access:* = undefined;
         var star:Boolean = false;
         var cnm:String = null;
         var searching:String = null;
         var found:* = undefined;
         var small:* = undefined;
         var nm2:String = null;
         var st:* = undefined;
         var col:* = undefined;
         var ac:* = undefined;
         var pt:* = undefined;
         var alp:* = undefined;
         var _tag:String = null;
         var _alphabet:String = null;
         if(n == 2 || n == 3)
         {
            this.iCreator.mouseEnabled = false;
            for(i in this.iEle)
            {
               if(this.iEle[i] != null)
               {
                  this.iEle[i].iDelete();
                  this.iEle[i] = null;
               }
            }
            this.iCreator.gotoAndStop(1);
            this.iCreator.gotoAndStop(3);
            this.refreshCredit();
            this.iCreator.movNote.scaleX = this.iCreator.movNote.scaleY = Window.getRes();
            this.iCreator.Scroll.scaleX = this.iCreator.Scroll.scaleY = Window.getRes();
            this.iCreator.ele.x = this.elex;
            this.gomovesp = 0;
            this.iCreator.Scroll.addEventListener(MouseEvent.MOUSE_DOWN,this.scmd);
            this.doAlp();
            this.iCreator.Scroll.visible = true;
            cnt = 0;
            ak_temp = new Array();
            if(this.iRankTp != 1)
            {
               for(n in this.iStage.myDb.SDb)
               {
                  ak_temp.push(String(n));
               }
               ak_temp.sort(Array.CASEINSENSITIVE);
            }
            else
            {
               ak_temp2 = new Array();
               for(n2 in this.iStage.myDb.SDb)
               {
                  ak_temp2.push({
                     "cname":String(n2),
                     "rank":this.iStage.myDb.SDb[n2].rank
                  });
               }
               ak_temp2.sortOn("rank",Array.NUMERIC);
               for(n3 in ak_temp2)
               {
                  ak_temp[n3] = ak_temp2[n3].cname;
               }
               ak_temp2 = [];
            }
            ak_temp = new Array("H2O").concat(ak_temp);
            for(i in ak_temp)
            {
               nm = this.iStage.myDb.SDb[ak_temp[i]].nm;
               mm = this.iStage.myDb.SDb[ak_temp[i]].mm;
               fnm = this.iStage.myDb.SDb[ak_temp[i]].fnm;
               rnm = this.iStage.myDb.SDb[ak_temp[i]].aname;
               state = this.iStage.myDb.cLoad(nm,"cState");
               tp = this.iStage.myDb.cLoad(nm,"tp");
               access = this.iStage.myDb.SDb[ak_temp[i]].access;
               star = false;
               if(this.iStage.myDb.SDb[ak_temp[i]].star != null)
               {
                  if(this.iStage.myDb.SDb[ak_temp[i]].star)
                  {
                     star = true;
                  }
               }
               cnm = this.iStage.myDb.SDb[nm].htmlnm;
               searching = "";
               if(this.iRankTp == 6)
               {
                  searching = this.myTextField.text.toLocaleUpperCase();
               }
               if(searching == "")
               {
                  searching = "XXX";
               }
               found = -1;
               if(this.iRankTp == 6)
               {
                  found = Math.max(rnm.toLocaleUpperCase().indexOf(searching),cnm.toLocaleUpperCase().indexOf(searching));
               }
               if(this.iRankTp == 6 && found >= 0 && access >= 1 || (tp == "Organic" && this.iRankTp == 1 || state == this.iRankTp - 1 && tp != "Organic" || i == 0 || this.iRankTp == 7 && star) && access >= 1)
               {
                  small = tp == "Organic" ? -3 : 0;
                  if(this.iStage.myDb.iSb(cnm) != null)
                  {
                     nm2 = "<font size=\'" + String(35 * this.iStage.myDb.iSbs(cnm)) + "\'>" + this.iStage.myDb.iSb(cnm) + "</font>";
                  }
                  else
                  {
                     nm2 = CGN.Ch2(cnm,small);
                  }
                  st = this.iStage.myDb.cLoad(nm,"cState");
                  col = this.iStage.myDb.cLoad(nm,"Col");
                  ac = this.iStage.myDb.cLoad(nm,"Ac");
                  pt = this.iStage.myDb.cLoad(nm,"ptn" + this.iStage.myDb.cLoad(nm,"cState"));
                  alp = this.iStage.myDb.cLoad(nm,"Alp");
                  if(pt == null)
                  {
                     pt = 1;
                  }
                  if(col == null)
                  {
                     col = 16777215;
                  }
                  if(tp == "Organic" && (this.iRankTp == 1 || this.iRankTp == 7 || this.iRankTp == 6))
                  {
                     if(Credit.organic == 1)
                     {
                        access = 1;
                     }
                     this.iEle["ele" + cnt] = new iElement4(nm2,mm,st,this.iStage.myLab,this,col,pt,alp,nm,access);
                  }
                  else if(st == 1)
                  {
                     this.iEle["ele" + cnt] = new iElement1(nm2,mm,st,this.iStage.myLab,this,col,pt,alp,nm,access);
                  }
                  else if(st == 2)
                  {
                     this.iEle["ele" + cnt] = new iElement2(nm2,mm,st,this.iStage.myLab,this,col,pt,alp,nm,access,tp);
                  }
                  else if(st == 3)
                  {
                     this.iEle["ele" + cnt] = new iElement3(nm2,mm,st,this.iStage.myLab,this,col,pt,alp,nm,access);
                  }
                  if(tp == "Organic" && this.iRankTp == 1)
                  {
                     _tag = this.iStage.myDb.cLoad(nm,"tag");
                     if(this.pretag != _tag && _tag != "0")
                     {
                        if(iLoc.LG == "zh" || iLoc.LG == "tw" || iLoc.LG == "jp" || iLoc.LG == "ko")
                        {
                           this.iEle["ele" + cnt].alphabetSec.alphabet2.text = this.localTag(_tag);
                           this.iEle["ele" + cnt].alphabetSec.alphabet.text = "";
                        }
                        else
                        {
                           this.iEle["ele" + cnt].alphabetSec.alphabet2.text = "";
                           this.iEle["ele" + cnt].alphabetSec.alphabet.text = this.localTag(_tag);
                        }
                        this.iEle["ele" + cnt].resizeBar();
                        this.pretag = _tag;
                     }
                     else
                     {
                        this.iEle["ele" + cnt].alphabetSec.alphabet2.text = "";
                        this.iEle["ele" + cnt].alphabetSec.alphabet.text = "";
                        this.iEle["ele" + cnt].alphabetSec.visible = false;
                     }
                  }
                  else if(this.iRankTp == 2)
                  {
                     _alphabet = nm.slice(0,1);
                     if(this.prealphabet != _alphabet)
                     {
                        this.iEle["ele" + cnt].alphabetSec.alphabet.text = _alphabet;
                        this.prealphabet = nm.slice(0,1);
                     }
                     else
                     {
                        this.iEle["ele" + cnt].alphabetSec.alphabet.text = "";
                        this.iEle["ele" + cnt].alphabetSec.visible = false;
                     }
                  }
                  this.iEle["ele" + cnt].scaleX = this.iEle["ele" + cnt].scaleY = Window.getRes2();
                  if(i > 0)
                  {
                     this.iEle["ele" + cnt].x = 63 * cnt * Window.getRes2();
                     this.iEle["ele" + cnt].y = -5;
                     this.iCreator.ele.addChild(this.iEle["ele" + cnt]);
                     cnt++;
                  }
               }
            }
            this.ztotal = cnt;
            this.iScroll();
         }
      }
      
      private function scmd(e:MouseEvent) : void
      {
         if(this.iCreator.movNote.currentFrame != 1)
         {
            this.iCreator.movNote.gotoAndPlay(12);
         }
         this.pHideAlp(true);
         var offset:Number = 0;
         if(Window.getRes() != 1)
         {
            offset = -100;
         }
         this.iCreator.Scroll.ScrollB.alpha = 1;
         this.iCreator.Scroll.ScrollB.startDrag(false,new Rectangle(offset,0,840,0));
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.scmm);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.scmu);
      }
      
      private function scmm(e:MouseEvent) : void
      {
         var offset:Number = 0;
         if(Window.getRes() != 1)
         {
            offset = -100;
         }
         this.iCreator.ele.x = 100 - (this.iCreator.Scroll.ScrollB.x - offset) / 840 * (this.iCreator.ele.width - 840);
         this.iVisScroll();
      }
      
      private function scmu(e:MouseEvent) : void
      {
         this.pHideAlp(false);
         this.iCreator.Scroll.ScrollB.stopDrag();
         this.iCreator.Scroll.ScrollB.alpha = 0.5;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.scmm);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.scmu);
      }
      
      public function do_edit(e:*) : *
      {
         this.iEdit = e;
         for(var h:uint = 0; h < this.iCreator.ele.numChildren; h++)
         {
            this.iCreator.ele.getChildAt(h).doEdit(e);
         }
         this.iCreator.btnFinish.visible = e;
         if(this.iCreator.ele.numChildren > 0)
         {
            this.iCreator.btnEdit.visible = !e;
         }
         else
         {
            this.iCreator.btnEdit.visible = false;
         }
      }
      
      public function pDrag(e:*) : *
      {
         this.gomovesp = 0;
         if(this.iCreator.currentFrame == 3)
         {
            if(this.iCreator.ele.width > 840)
            {
               this.rightx = 100 - this.iCreator.ele.width + 840;
               this.leftx = this.iCreator.ele.width - 840;
            }
            else
            {
               this.rightx = 100;
               this.leftx = 0;
            }
            if(this.iCreator.movNote.currentFrame != 1)
            {
               this.iCreator.movNote.gotoAndPlay(12);
            }
         }
         this.epx = mouseX;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.pMove);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.pRel);
      }
      
      private function pMove(e:MouseEvent) : *
      {
         if(!this.pIsMove)
         {
            this.iCreator.ele.startDrag(false,new Rectangle(this.rightx,this.iCreator.ele.y,this.leftx,0));
         }
         if(this.iCreator.currentFrame == 3)
         {
            this.iScroll();
         }
         this.pIsMove = true;
         this.movesp = mouseX - this.movex;
         this.movex = mouseX;
      }
      
      private function iScroll() : void
      {
         this.iVisScroll();
         var offset:Number = 0;
         if(Window.getRes() != 1)
         {
            offset = -100;
         }
         this.iCreator.Scroll.ScrollB.x = 840 * (100 - this.iCreator.ele.x) / (this.iCreator.ele.width - 840) + offset;
      }
      
      private function iVisScroll() : void
      {
      }
      
      public function pHideAlp(b:Boolean) : void
      {
         var i:* = undefined;
         for(i in this.iEle)
         {
            if(this.iEle[i] != null)
            {
               if(this.iEle[i] is iElement4)
               {
                  if(this.iEle[i].alphabetSec.alphabet.text != "" || this.iEle[i].alphabetSec.alphabet2.text != "")
                  {
                     this.iEle[i].alphabetSec.visible = b;
                  }
               }
               else if(this.iEle[i].alphabetSec.alphabet.text != "")
               {
                  this.iEle[i].alphabetSec.visible = b;
               }
            }
         }
         if(b)
         {
            this.alphaTween = new Tween(this.iCreator.iTS,"alpha",Regular.easeOut,this.iCreator.iTS.alpha,0,0.3,true);
         }
         else
         {
            this.alphaTween = new Tween(this.iCreator.iTS,"alpha",Regular.easeOut,this.iCreator.iTS.alpha,1,0.3,true);
         }
      }
      
      public function pRel(e:*) : *
      {
         this.iCreator.ele.stopDrag();
         if(Math.abs(this.movesp) > 2 && this.iCreator.currentFrame == 3 || Math.abs(this.movesp) > 2 && this.iCreator.currentFrame == 4)
         {
            if(this.movesp > 60)
            {
               this.gomovesp = 60;
            }
            else if(this.movesp < -60)
            {
               this.gomovesp = -60;
            }
            else
            {
               this.gomovesp = this.movesp;
            }
            addEventListener(Event.ENTER_FRAME,this.traymove);
         }
         else
         {
            this.gomovesp = 0;
            this.movesp = 0;
         }
         this.pIsMove = false;
         if(this.iCreator.currentFrame == 3)
         {
            this.elex = this.iCreator.ele.x;
            this.iScroll();
         }
         else
         {
            this.elex2 = this.iCreator.ele.x;
         }
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.pMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.pRel);
      }
      
      public function stopMove() : void
      {
         this.gomovesp = 0;
         removeEventListener(Event.ENTER_FRAME,this.traymove);
      }
      
      private function traymove(e:*) : *
      {
         if(Math.abs(this.gomovesp) > 0.3)
         {
            if(this.gomovesp > 0)
            {
               this.iCreator.ele.x += this.gomovesp;
               this.gomovesp -= (this.gomovesp + 1) / 20;
            }
            else if(this.gomovesp < 0)
            {
               this.iCreator.ele.x += this.gomovesp;
               this.gomovesp -= (this.gomovesp - 1) / 20;
            }
            if(this.iCreator.currentFrame == 3)
            {
               this.iScroll();
            }
         }
         else
         {
            this.gomovesp = 0;
            removeEventListener(Event.ENTER_FRAME,this.traymove);
         }
         if(this.iCreator.currentFrame == 3)
         {
            if(this.iCreator.ele.x < this.rightx || this.iCreator.ele.x > 100)
            {
               this.gomovesp = 0;
               if(this.iCreator.ele.x > 100)
               {
                  this.iCreator.ele.x = 100;
               }
               else
               {
                  this.iCreator.ele.x = this.rightx;
               }
               removeEventListener(Event.ENTER_FRAME,this.traymove);
            }
         }
         else if(this.iCreator.currentFrame == 4)
         {
            if(this.iCreator.ele.x < this.rightx || this.iCreator.ele.x > 100)
            {
               this.gomovesp = 0;
               if(this.iCreator.ele.x > 100)
               {
                  this.iCreator.ele.x = 100;
               }
               else
               {
                  this.iCreator.ele.x = this.rightx;
               }
               removeEventListener(Event.ENTER_FRAME,this.traymove);
            }
         }
         if(this.iCreator.currentFrame == 3)
         {
            this.elex = this.iCreator.ele.x;
         }
         else
         {
            this.elex2 = this.iCreator.ele.x;
         }
         if(this.iCreator.currentFrame == 3)
         {
            this.iScroll();
         }
      }
      
      public function cCreateTap(e:iElement) : *
      {
         this.iCreator.ele.stopDrag();
         this.stopMove();
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.pMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.pRel);
         this.iTapper.x = stage.mouseX;
         this.iTapper.y = stage.mouseY;
         this.iTapper.iSet(e,this.iStage.myDomain.cDbs);
         this.iTap = true;
         this.iTapper.iDrag();
      }
      
      public function cCreateM(e:iElement) : *
      {
         var cv_temp:* = undefined;
         var mat_temp:* = undefined;
         this.iCreator.ele.stopDrag();
         this.stopMove();
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.pMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.pRel);
         var mix:Array = e.mix;
         var type:* = e.iSt;
         this.iStage.myDomain.cCreate("g" + this.num,"cGroup","","");
         this.iStage.myDomain.cCreate("d" + this.num,"cDevice",this.iStage.myDomain.cBox["g" + this.num],type);
         this.iStage.myLab.iCreate("id" + this.num,"iDevice",this.iStage.myDomain.cBox["d" + this.num]);
         this.iStage.myLab.iBox["id" + this.num].x = stage.mouseX;
         this.iStage.myLab.iBox["id" + this.num].y = stage.mouseY;
         this.iStage.myLab.iBox["id" + this.num].iDrag();
         for(var i:* = 0; i < mix.length; i++)
         {
            cv_temp = mix[i].cMass;
            mat_temp = this.iStage.myDomain.cCreatMatter(mix[i].cName,cv_temp,this.iStage.myDomain.sTemp);
            this.iStage.myLab.iBox["id" + this.num].cDv.cMt.cAddSub(this.iStage.myDomain.cCore[mat_temp],1);
         }
         ++this.num;
      }
      
      public function iGetName(e:iDevice) : String
      {
         var ct:Number = NaN;
         var i:* = undefined;
         var nm:String = "";
         var prenm:String = "";
         if(e.cDv.cMt.cG().length > 1)
         {
            ct = 0;
            for(i in e.cDv.cMt.cG())
            {
               if(e.cDv.cMt.cG()[i].cName != "O2" && e.cDv.cMt.cG()[i].cName != "H2O" && e.cDv.cMt.cG()[i].cName != "N2")
               {
                  if(e.cDv.cMt.cG()[i].cName != prenm)
                  {
                     nm += e.cDv.cMt.cG()[i].cName;
                  }
                  prenm = e.cDv.cMt.cG()[i].cName;
                  ct++;
                  if(ct == 2)
                  {
                     break;
                  }
                  nm += " ";
               }
            }
            if(nm == "")
            {
               nm = e.cDv.cMt.cG()[1].cName;
            }
         }
         else
         {
            nm = e.cDv.cMt.cG()[0].cName;
         }
         return nm;
      }
      
      public function iSetFree() : void
      {
         this.isFree = true;
         this.btnUpgrade.addEventListener(MouseEvent.CLICK,this.d_upgrade);
      }
      
      public function doFree() : void
      {
      }
      
      public function cCreateBeaker1(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(root["iWc"].currentFrame == 159)
            {
               root["iWc"].play();
            }
            this.pCreate("Beaker1","cDevice",e);
            this.iSet("Beaker");
         }
      }
      
      public function cCreateBeaker2(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(this.isFree)
            {
               this.doFree();
            }
            else
            {
               this.pCreate("Beaker2","cDevice",e);
               this.iSet("Beaker2");
            }
         }
      }
      
      public function cCreateFunnel(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(this.isFree)
            {
               this.doFree();
            }
            else
            {
               this.pCreate("Funnel","cDevice",e);
               this.iSet("Funnel");
            }
         }
      }
      
      public function cCreateGasBottle(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(this.isFree)
            {
               this.doFree();
            }
            else
            {
               this.pCreate("GasBottle","cDevice",e);
               this.iSet("GB");
            }
         }
      }
      
      public function cCreateAwl(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            this.pCreate("Awl","cDevice",e);
            this.iSet("Awl");
         }
      }
      
      public function cCreateAwl2(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(this.isFree)
            {
               this.doFree();
            }
            else
            {
               this.pCreate("Awl2","cDevice",e);
               this.iSet("Awl2");
            }
         }
      }
      
      public function cCreateWatch(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(this.isFree)
            {
               this.doFree();
            }
            else
            {
               this.pCreate("Watch","cDevice",e);
               this.iSet("Watch");
            }
         }
      }
      
      public function cCreateBowl(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(this.isFree)
            {
               this.doFree();
            }
            else
            {
               this.pCreate("Bowl","cDevice",e);
               this.iSet("Bowl");
            }
         }
      }
      
      public function cCreateBoiler(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(this.isFree)
            {
               this.doFree();
            }
            else
            {
               this.pCreate("Boiler","cDevice",e);
               this.iSet("Boiler");
            }
         }
      }
      
      public function cCreateBoiler2(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(this.isFree)
            {
               this.doFree();
            }
            else
            {
               this.pCreate("Boiler2","cDevice",e);
               this.iSet("Boiler2");
            }
         }
      }
      
      public function cCreateTT(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(this.isFree)
            {
               this.doFree();
            }
            else
            {
               this.pCreate("TT","cDevice",e);
               this.iSet("TT");
            }
         }
      }
      
      public function cCreateSteelStand(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(this.isFree)
            {
               this.doFree();
            }
            else
            {
               this.pCreate("SteelStand","cStructure");
               this.iSet("Ss");
            }
         }
      }
      
      public function cCreateTripod(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            this.pCreate("Tripod","cTripod");
            this.iSet("Tripod");
         }
      }
      
      public function iReset() : void
      {
         this.iSet("");
      }
      
      public function cCreateTube(e:*) : *
      {
         this.pCreate("Tube","cTube");
         this.iStage.myLab.iDoLink = 1;
      }
      
      public function cCreateTubeSuper() : void
      {
         this.pCreate("Tube","cTube");
      }
      
      public function cDragTube(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            this.DragTube();
            this.closeCreate();
            this.doblack1(0);
         }
      }
      
      public function cDragLid(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            this.DragLid();
            this.closeCreate();
            this.doblack1(0);
         }
      }
      
      public function iSet(n:String) : void
      {
         if(this.iCreator.currentFrame == 2)
         {
            if(n != "")
            {
               this.iPreSet = n;
               this.iCreator.iSet["q" + n].visible = false;
               this.iSexPx = this.iCreator.iSet.x;
            }
            else
            {
               this.iCreator.iSet["q" + this.iPreSet].visible = true;
            }
         }
      }
      
      private function qTimer(e:Event) : void
      {
         if(mouseY > 310)
         {
            this.doblack1(0);
         }
      }
      
      public function iDoDark(n:Boolean) : *
      {
      }
      
      public function cCreateHeater1(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            this.pCreate("Heater","cHeater1");
            this.iSet("Heater");
         }
      }
      
      public function cCreateHeater2(e:*) : *
      {
         if(this.seton)
         {
            this.seton = false;
            if(this.isFree)
            {
               this.doFree();
            }
            else
            {
               this.pCreate("Heater","cHeater2");
               this.iSet("Ab");
            }
         }
      }
      
      public function iRollingAdd(t:String) : void
      {
         if(this.iRolling[t] == null)
         {
            this.iRolling[t] = 1;
         }
         else
         {
            ++this.iRolling[t];
         }
      }
      
      public function iRollingClear() : void
      {
         var i:* = undefined;
         for(i in this.iRolling)
         {
            this.iRolling[i] = 0;
         }
      }
      
      public function ReportDevice(b:*) : void
      {
         this.iStage.myLab.myReport.NewAction(ActionType.ADDEQUIP,b);
      }
      
      public function ReportSub(a:*, b:*, c:*, d:*) : void
      {
         this.iStage.myLab.myReport.NewAction(ActionType.ADDSUB,a,b,c,d);
      }
      
      public function pCreate(inType:*, inClass:*, e:TouchEvent = null) : *
      {
         switch(inClass)
         {
            case "cDevice":
               this.msdPickUp.play();
               this.iStage.myDomain.cCreate("g" + this.num,"cGroup","","");
               this.iStage.myDomain.cCreate("d" + this.num,"cDevice",this.iStage.myDomain.cBox["g" + this.num],inType);
               this.iStage.myLab.iCreate("id" + this.num,"iDevice",this.iStage.myDomain.cBox["d" + this.num]);
               this.iStage.myLab.iBox["id" + this.num].x = mouseX;
               this.iStage.myLab.iBox["id" + this.num].y = mouseY;
               this.iStage.myLab.iBox["id" + this.num].iDrag(e);
               this.ReportDevice(this.iStage.myLab.iBox["id" + this.num].iUID);
               ++this.num;
               break;
            case "cStructure":
               this.msdPickUp.play();
               this.iStage.myDomain.cCreate("d" + this.num,"cStructure","",inType);
               this.iStage.myLab.iCreate("id" + this.num,"iStructure",this.iStage.myDomain.cBox["d" + this.num]);
               this.iStage.myLab.iBox["id" + this.num].x = stage.mouseX;
               this.iStage.myLab.iBox["id" + this.num].y = stage.mouseY;
               this.iStage.myLab.iBox["id" + this.num].iDrag();
               this.ReportDevice(this.iStage.myLab.iBox["id" + this.num].iUID);
               ++this.num;
               break;
            case "cTripod":
               this.msdPickUp.play();
               this.iStage.myDomain.cCreate("d" + this.num,"cTripod","",inType);
               this.iStage.myLab.iCreate("id" + this.num,"iTripod",this.iStage.myDomain.cBox["d" + this.num]);
               this.iStage.myLab.iBox["id" + this.num].x = stage.mouseX;
               this.iStage.myLab.iBox["id" + this.num].y = stage.mouseY;
               this.iStage.myLab.iBox["id" + this.num].iDrag();
               this.ReportDevice(this.iStage.myLab.iBox["id" + this.num].iUID);
               ++this.num;
               break;
            case "cDropper":
               this.iStage.myDomain.cCreate("g" + this.num,"cGroup","","");
               this.iStage.myDomain.cCreate("d" + this.num,"cDevice",this.iStage.myDomain.cBox["g" + this.num],"Dropper");
               this.iStage.myLab.iCreate("id" + this.num,"iDropper",this.iStage.myDomain.cBox["d" + this.num]);
               this.iStage.myLab.iBox["id" + this.num].x = stage.mouseX;
               this.iStage.myLab.iBox["id" + this.num].y = stage.mouseY;
               this.iStage.myLab.iBox["id" + this.num].iDrag();
               ++this.num;
               break;
            case "cSpoon":
               this.iStage.myDomain.cCreate("g" + this.num,"cGroup","","");
               this.iStage.myDomain.cCreate("d" + this.num,"cDevice",this.iStage.myDomain.cBox["g" + this.num],"Spoon");
               this.iStage.myLab.iCreate("id" + this.num,"iSpoon",this.iStage.myDomain.cBox["d" + this.num]);
               this.iStage.myLab.iBox["id" + this.num].x = stage.mouseX;
               this.iStage.myLab.iBox["id" + this.num].y = stage.mouseY;
               this.iStage.myLab.iBox["id" + this.num].iDrag();
               ++this.num;
               break;
            case "cHeater1":
               this.msdPickUp.play();
               this.iStage.myDomain.cCreate("d" + this.num,"cHeater","","Heater");
               this.iStage.myLab.iCreate("id" + this.num,"iHeater1",this.iStage.myDomain.cBox["d" + this.num]);
               this.iStage.myLab.iBox["id" + this.num].x = stage.mouseX;
               this.iStage.myLab.iBox["id" + this.num].y = stage.mouseY;
               this.iStage.myLab.iBox["id" + this.num].iDrag();
               this.ReportDevice(this.iStage.myLab.iBox["id" + this.num].iUID);
               ++this.num;
               break;
            case "cHeater2":
               this.msdPickUp.play();
               this.iStage.myDomain.cCreate("d" + this.num,"cHeater","","Heater");
               this.iStage.myLab.iCreate("id" + this.num,"iHeater2",this.iStage.myDomain.cBox["d" + this.num]);
               this.iStage.myLab.iBox["id" + this.num].x = stage.mouseX;
               this.iStage.myLab.iBox["id" + this.num].y = stage.mouseY;
               this.iStage.myLab.iBox["id" + this.num].iDrag();
               this.ReportDevice(this.iStage.myLab.iBox["id" + this.num].iUID);
               ++this.num;
               break;
            case "cTube":
               this.msdPickUp.play();
               this.iStage.myDomain.cCreate("d" + this.num,"cTube","",inType);
               this.iStage.myLab.iCreate("id" + this.num,"iTube",this.iStage.myDomain.cBox["d" + this.num]);
               this.iStage.myLab.iBox["id" + this.num].x = stage.mouseX;
               this.iStage.myLab.iBox["id" + this.num].y = stage.mouseY;
               this.iStage.myLab.iTheLink = this.iStage.myLab.iBox["id" + this.num];
               ++this.num;
         }
      }
      
      private function DragTubeStop(e:*) : void
      {
         this.iTube.visible = false;
         this.iTube.stopDrag();
         this.iStage.myLab.iIsTube = false;
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.DragTubeStop);
      }
      
      private function DragLidStop(e:*) : void
      {
         this.iLid.visible = false;
         this.iLid.stopDrag();
         this.iStage.myLab.iIsLid = false;
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.DragLidStop);
      }
      
      private function DragTube() : void
      {
         this.iTube.visible = true;
         this.iTube.startDrag(true);
         this.iStage.myLab.iIsTube = true;
         stage.addEventListener(MouseEvent.MOUSE_UP,this.DragTubeStop);
      }
      
      private function DragLid() : void
      {
         this.iLid.visible = true;
         this.iLid.startDrag(true);
         this.iStage.myLab.iIsLid = true;
         stage.addEventListener(MouseEvent.MOUSE_UP,this.DragLidStop);
      }
   }
}

