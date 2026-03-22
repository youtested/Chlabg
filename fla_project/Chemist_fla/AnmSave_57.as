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
   
   public dynamic class AnmSave_57 extends MovieClip
   {
      
      public var btnCancel:SimpleButton;
      
      public var btnSave:SimpleButton;
      
      public var movSave:MovieClip;
      
      public var movTitle:MovieClip;
      
      public var txtName:TextField;
      
      public function AnmSave_57()
      {
         super();
      }
      
      public function txtchange(e:*) : *
      {
         this.replash();
      }
      
      public function replash() : void
      {
         if(this.txtName.text == "")
         {
            this.movTitle.visible = true;
            this.btnSave.enabled = false;
            this.movSave.alpha = 0.5;
         }
         else
         {
            this.movTitle.visible = false;
            this.btnSave.enabled = true;
            this.movSave.alpha = 1;
         }
      }
      
      public function store(e:*) : void
      {
         if(this.txtName.text != "")
         {
            root["pPan"].cAddM(root["myLab"].iCtrl.iDv,this.txtName.text);
            root["myLab"].iSelected = null;
            (parent as MovieClip).gotoAndStop(1);
         }
      }
      
      public function cancel(e:*) : void
      {
         (parent as MovieClip).gotoAndStop(2);
      }
   }
}

