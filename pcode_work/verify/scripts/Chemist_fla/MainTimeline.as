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
   
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var Sounder:MovieClip;
      
      public var lc:iLoc;
      
      public var Life:Boolean;
      
      public var myDebug:iDebug;
      
      public var myDomain:cDomain;
      
      public var myLab:iLab;
      
      public var myDb:cDb;
      
      public var myReporter:iReporter;
      
      public var myPT:iPT;
      
      public var pPan:iPan;
      
      public var wso:SharedObject;
      
      public var iWc:iWelcome;
      
      public var myAch:iAch;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1,114,this.frame115);
      }
      
      public function orientationChangeListener(e:StageOrientationEvent) : *
      {
         if(e.afterOrientation != "rotatedLeft" && e.afterOrientation != "rotatedRight")
         {
            e.preventDefault();
         }
      }
      
      public function Report() : void
      {
         this.myReporter.visible = true;
         var c:String = this.myLab.myReport.DoReport();
         this.myReporter.MainTxt.htmlText = c;
         this.myReporter.datetxt.text = this.myLab.myReport.ddate;
      }
      
      public function PT() : void
      {
         this.myPT.visible = true;
      }
      
      public function frameHandler(event:Event) : void
      {
         if(this.Life)
         {
            this.myLab.iProg();
            this.myDomain.cExist();
         }
      }
      
      internal function frame1() : *
      {
         this.lc = new iLoc();
         Window.init(stage);
         if(Window.getRes() != 1)
         {
            stage.scaleMode = StageScaleMode.SHOW_ALL;
            stage.align = StageAlign.TOP;
         }
         Window.report();
         stage.addEventListener(StageOrientationEvent.ORIENTATION_CHANGING,this.orientationChangeListener);
      }
      
      internal function frame115() : *
      {
         stop();
         this.Life = true;
         this.myDebug = new iDebug();
         this.myDomain = new cDomain(this,0);
         this.myLab = new iLab(this.myDomain);
         this.myDb = new cDb(this.myDomain);
         this.myReporter = new iReporter();
         this.myReporter.visible = false;
         this.myPT = new iPT();
         this.myPT.visible = false;
         this.pPan = new iPan(this);
         this.myDomain.cCL.cLoad();
         this.wso = SharedObject.getLocal("ChemistWelcome3");
         addChild(this.myLab);
         addChild(this.pPan);
         addChild(this.myReporter);
         addChild(this.myPT);
         if(Window.getRes() == 1)
         {
            addChild(new MaskCorner());
         }
         addChild(new FadeIn());
         this.iWc = new iWelcome();
         this.iWc.x = 512;
         this.iWc.y = 384;
         if(this.wso.data.pass == null)
         {
            addChild(this.iWc);
            this.wso.data.pass = 1;
            this.wso.flush();
         }
         else
         {
            root["pPan"].iStart();
         }
         this.pPan.d_loadConfig();
         this.pPan.d_loadAtm();
         this.pPan.pCreateDropper();
         this.myAch = new iAch(this.pPan);
         this.myLab.myReport.load();
         addEventListener(Event.ENTER_FRAME,this.frameHandler);
         this.pPan.iZm.initZoom();
         ChemStore.Setup();
      }
   }
}

