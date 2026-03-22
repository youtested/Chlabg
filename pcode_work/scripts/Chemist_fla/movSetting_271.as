package Chemist_fla
{
   import flash.accessibility.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.sensors.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1490")]
   public dynamic class movSetting_271 extends MovieClip
   {
      
      public var Sel:MovieClip;
      
      public var btn0:iBtnCo;
      
      public var btn05:iBtnCo;
      
      public var btn1:iBtnCo;
      
      public var btn2:iBtnCo;
      
      public var btn4:iBtnCo;
      
      public var btnAbout:iBtnCo;
      
      public var btnBack:SimpleButton;
      
      public var btnBack2:SimpleButton;
      
      public var btnBack3:SimpleButton;
      
      public var btnBasic:iBtnCo;
      
      public var btnCO2:iBtnCo;
      
      public var btnCl2:iBtnCo;
      
      public var btnEmail:btnCo2;
      
      public var btnFb:btnCo2;
      
      public var btnGas:iBtnCo;
      
      public var btnH2:iBtnCo;
      
      public var btnLanguage:iBtnCo;
      
      public var btnNatural:iBtnCo;
      
      public var btnProtective:iBtnCo;
      
      public var btnPure:iBtnCo;
      
      public var btnReport:iBtnCo;
      
      public var btnShare:iBtnCo;
      
      public var btnSpeed:iBtnCo;
      
      public var btnTemp:iBtnCo;
      
      public var btnTt:btnCo2;
      
      public var btnUserguide:iBtnCo;
      
      public var btndu:iBtnCo;
      
      public var btnen:iBtnCo;
      
      public var btnfr:iBtnCo;
      
      public var btnfzh:iBtnCo;
      
      public var btnge:iBtnCo;
      
      public var btnit:iBtnCo;
      
      public var btnja:iBtnCo;
      
      public var btnko:iBtnCo;
      
      public var btnno:iBtnCo;
      
      public var btnpo:iBtnCo;
      
      public var btnru:iBtnCo;
      
      public var btnsp:iBtnCo;
      
      public var btnsw:iBtnCo;
      
      public var btnszh:iBtnCo;
      
      public var btnth:iBtnCo;
      
      public var iNTemp:iNumberSlider;
      
      public var sExp:MovieClip;
      
      public var sSound:MovieClip;
      
      public var txtGas:TextField;
      
      public var txtK:TextField;
      
      public var txtSpeed:TextField;
      
      public var txtTemp:TextField;
      
      public var t:Number;
      
      public function movSetting_271()
      {
         super();
         addFrameScript(0,this.frame1,10,this.frame11,19,this.frame20,29,this.frame30,38,this.frame39,48,this.frame49,57,this.frame58,67,this.frame68,76,this.frame77,105,this.frame106);
      }
      
      public function d_stsetsavex(e:*) : void
      {
         root["myDomain"].sExp = this.sExp.selected;
         root["pPan"].d_saveConfif();
      }
      
      public function d_stsetsave(e:*) : void
      {
         root["myDomain"].sSound = this.sSound.selected;
         root["pPan"].d_saveConfif();
      }
      
      public function d_kidsave(e:*) : void
      {
         root["myDomain"].sKid = sKid.selected;
         root["pPan"].d_saveConfif();
      }
      
      public function ug(e:*) : void
      {
         var request:* = new URLRequest("http://thixlab.com/chemist_guide.pdf");
         navigateToURL(request,"_blank");
      }
      
      public function cg(e:*) : void
      {
         this.txtK.text = String(Math.round(this.iNTemp.N + 273));
         root["myDomain"].sTemp = Math.round(this.iNTemp.N);
         root["pPan"].d_saveAtm();
      }
      
      public function SetAtm(n:Number) : void
      {
         root["myDomain"].sAtmN = n;
         if(n == 1)
         {
            root["myDomain"].sAtm = ["O2"];
            root["myDomain"].sAtmPct = [1];
         }
         else if(n == 2)
         {
            root["myDomain"].sAtm = ["N2"];
            root["myDomain"].sAtmPct = [1];
         }
         else if(n == 3)
         {
            root["myDomain"].sAtm = ["O2","N2","CO2"];
            root["myDomain"].sAtmPct = [0.21,0.78,0.1];
         }
         else if(n == 4)
         {
            root["myDomain"].sAtm = ["O2","N2","Ar","CO2","Ne","He"];
            root["myDomain"].sAtmPct = [0.2,0.78,0.009,0.0004,0.00002,0.000005];
         }
         else if(n == 5)
         {
            root["myDomain"].sAtm = ["H2"];
            root["myDomain"].sAtmPct = [1];
         }
         else if(n == 6)
         {
            root["myDomain"].sAtm = ["Cl2"];
            root["myDomain"].sAtmPct = [1];
         }
         else if(n == 7)
         {
            root["myDomain"].sAtm = ["CO2"];
            root["myDomain"].sAtmPct = [1];
         }
         this.Sel.gotoAndStop(root["myDomain"].sAtmN);
         root["pPan"].d_saveAtm();
      }
      
      public function SetSpd(n:Number) : void
      {
         root["myDomain"].cSpeed = n;
         this.Goto(n);
         root["pPan"].d_saveAtm();
      }
      
      public function Goto(n:Number) : void
      {
         var gn:Number = 1;
         if(n == 0)
         {
            gn = 1;
         }
         else if(n == 0.5)
         {
            gn = 2;
         }
         else if(n == 1)
         {
            gn = 3;
         }
         else if(n == 2)
         {
            gn = 4;
         }
         else if(n == 4)
         {
            gn = 5;
         }
         this.Sel.gotoAndStop(gn);
      }
      
      public function back2(e:*) : void
      {
         parent["Board"].gotoAndPlay(6);
         play();
      }
      
      public function openPage(url:String, linkWindow:String = "_blank", popUpDimensions:Array = null) : void
      {
      }
      
      public function back3(e:*) : void
      {
         parent["Board"].gotoAndPlay(6);
         play();
      }
      
      public function l_en(e:*) : void
      {
         switch(e.target.name)
         {
            case "btnen":
               iLoc.LG = "en";
               break;
            case "btnszh":
               iLoc.LG = "zh";
               break;
            case "btnfzh":
               iLoc.LG = "tw";
               break;
            case "btnja":
               iLoc.LG = "jp";
               break;
            case "btnru":
               iLoc.LG = "ru";
               break;
            case "btnth":
               iLoc.LG = "th";
               break;
            case "btnfr":
               iLoc.LG = "fr";
               break;
            case "btndu":
               iLoc.LG = "du";
               break;
            case "btnko":
               iLoc.LG = "ko";
               break;
            case "btnpo":
               iLoc.LG = "po";
               break;
            case "btnsp":
               iLoc.LG = "sp";
               break;
            case "btnge":
               iLoc.LG = "ge";
               break;
            case "btnno":
               iLoc.LG = "no";
               break;
            case "btnit":
               iLoc.LG = "it";
               break;
            case "btnsw":
               iLoc.LG = "sw";
         }
         root["pPan"].d_quit(0);
      }
      
      internal function frame1() : *
      {
         stop();
         this.sSound.selected = root["myDomain"].sSound;
         this.sExp.selected = root["myDomain"].sExp;
         this.sExp.addEventListener(Event.CHANGE,this.d_stsetsavex);
         this.sSound.addEventListener(Event.CHANGE,this.d_stsetsave);
         this.btnTemp.addEventListener(MouseEvent.CLICK,function():*
         {
            gotoAndPlay("temp");
            parent["Board"].gotoAndPlay(2);
         });
         this.btnGas.addEventListener(MouseEvent.CLICK,function():*
         {
            gotoAndPlay("gas");
            parent["Board"].gotoAndPlay(2);
         });
         this.btnSpeed.addEventListener(MouseEvent.CLICK,function():*
         {
            gotoAndPlay("speed");
            parent["Board"].gotoAndPlay(2);
         });
         this.btnAbout.addEventListener(MouseEvent.CLICK,function():*
         {
            gotoAndPlay("about");
            parent["Board"].gotoAndPlay(2);
         });
         this.btnLanguage.addEventListener(MouseEvent.CLICK,function():*
         {
            gotoAndPlay("language");
            parent["Board"].gotoAndPlay(2);
         });
         this.btnShare.addEventListener(MouseEvent.CLICK,function():*
         {
            root["PT"]();
            root["pPan"].d_quit(0);
         });
         this.btnUserguide.addEventListener(MouseEvent.CLICK,this.ug);
         this.btnReport.addEventListener(MouseEvent.CLICK,function():*
         {
            root["Report"]();
            root["pPan"].d_quit(0);
         });
         this.txtTemp.text = String(root["myDomain"].sTemp);
         this.t = root["myDomain"].sAtmN;
         if(this.t == 1)
         {
            if(iLoc.LG == "en" || iLoc.LG == "jp")
            {
               this.txtGas.text = "Pure Oxygen";
            }
            else if(iLoc.LG == "zh")
            {
               this.txtGas.text = "纯氧";
            }
            else
            {
               this.txtGas.text = "Pure Oxygen";
            }
         }
         else if(this.t == 2 || iLoc.LG == "jp")
         {
            if(iLoc.LG == "en")
            {
               this.txtGas.text = "Protective Gas";
            }
            else if(iLoc.LG == "zh")
            {
               this.txtGas.text = "保护气";
            }
            else
            {
               this.txtGas.text = "Protective Gas";
            }
         }
         else if(this.t == 3 || iLoc.LG == "jp")
         {
            if(iLoc.LG == "en")
            {
               this.txtGas.text = "Basic Air";
            }
            else if(iLoc.LG == "zh")
            {
               this.txtGas.text = "基本空气";
            }
         }
         else if(this.t == 4 || iLoc.LG == "jp")
         {
            if(iLoc.LG == "en")
            {
               this.txtGas.text = "Natural Air";
            }
            else if(iLoc.LG == "zh")
            {
               this.txtGas.text = "自然空气";
            }
            else
            {
               this.txtGas.text = "Natural Air";
            }
         }
         else if(this.t == 5 || iLoc.LG == "jp")
         {
            if(iLoc.LG == "en")
            {
               this.txtGas.text = "Hydrogen";
            }
            else if(iLoc.LG == "zh")
            {
               this.txtGas.text = "氢气";
            }
            else
            {
               this.txtGas.text = "Hydrogen";
            }
         }
         else if(this.t == 6 || iLoc.LG == "jp")
         {
            if(iLoc.LG == "en")
            {
               this.txtGas.text = "Chlorine";
            }
            else if(iLoc.LG == "zh")
            {
               this.txtGas.text = "氯气";
            }
            else
            {
               this.txtGas.text = "Chlorine";
            }
         }
         else if(this.t == 7 || iLoc.LG == "jp")
         {
            if(iLoc.LG == "en")
            {
               this.txtGas.text = "Carbon dioxide";
            }
            else if(iLoc.LG == "zh")
            {
               this.txtGas.text = "二氧化碳";
            }
            else
            {
               this.txtGas.text = "Carbon dioxide";
            }
         }
         else if(this.t == 8 || iLoc.LG == "jp")
         {
            this.txtGas.text = "Natural Air";
         }
         this.txtSpeed.text = String(root["myDomain"].cSpeed) + "x";
         if(root["myDomain"].cSpeed == 0)
         {
            this.txtSpeed.textColor = 16711680;
         }
         else
         {
            this.txtSpeed.textColor = 16777215;
         }
      }
      
      internal function frame11() : *
      {
         stop();
         this.btnBack.addEventListener(MouseEvent.MOUSE_DOWN,function():*
         {
            play();
            parent["Board"].gotoAndPlay(6);
         });
         this.iNTemp.Max = 200;
         this.iNTemp.Min = -90;
         this.iNTemp.Set(root["myDomain"].sTemp);
         this.iNTemp.addEventListener(Event.CHANGE,this.cg);
         this.txtK.text = String(this.iNTemp.N + 273);
      }
      
      internal function frame20() : *
      {
         gotoAndStop(1);
      }
      
      internal function frame30() : *
      {
         stop();
         this.btnBack.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            play();
            parent["Board"].gotoAndPlay(6);
         });
         this.Sel.gotoAndStop(root["myDomain"].sAtmN);
         this.btnPure.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetAtm(1);
         });
         this.btnProtective.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetAtm(2);
         });
         this.btnBasic.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetAtm(3);
         });
         this.btnNatural.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetAtm(4);
         });
         this.btnH2.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetAtm(5);
         });
         this.btnCl2.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetAtm(6);
         });
         this.btnCO2.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetAtm(7);
         });
      }
      
      internal function frame39() : *
      {
         gotoAndStop(1);
      }
      
      internal function frame49() : *
      {
         stop();
         this.btnBack.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            play();
            parent["Board"].gotoAndPlay(6);
         });
         this.Goto(root["myDomain"].cSpeed);
         this.btn0.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetSpd(0);
         });
         this.btn05.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetSpd(0.5);
         });
         this.btn1.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetSpd(1);
         });
         this.btn2.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetSpd(2);
         });
         this.btn4.addEventListener(MouseEvent.MOUSE_UP,function():*
         {
            SetSpd(4);
         });
      }
      
      internal function frame58() : *
      {
         gotoAndStop(1);
      }
      
      internal function frame68() : *
      {
         stop();
         this.btnBack2.addEventListener(MouseEvent.CLICK,this.back2);
      }
      
      internal function frame77() : *
      {
         gotoAndStop(1);
      }
      
      internal function frame106() : *
      {
         stop();
         this.btnBack3.addEventListener(MouseEvent.CLICK,this.back2);
         this.btnen.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnszh.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnfzh.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnja.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnru.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnth.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnfr.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btndu.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnko.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnpo.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnsp.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnno.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnge.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnit.addEventListener(MouseEvent.CLICK,this.l_en);
         this.btnsw.addEventListener(MouseEvent.CLICK,this.l_en);
      }
   }
}

