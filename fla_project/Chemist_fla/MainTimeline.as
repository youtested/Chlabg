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
   }
}

