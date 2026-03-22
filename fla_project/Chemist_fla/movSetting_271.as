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
   }
}

