package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.text.TextField;
   
   public class iControl extends MovieClip
   {
      
      public var Board:MovieClip;
      
      public var btnClear:SimpleButton;
      
      public var btnClose:SimpleButton;
      
      public var btnLit:SimpleButton;
      
      public var btnStore:SimpleButton;
      
      public var btnTube:SimpleButton;
      
      public var movLit:MovieClip;
      
      public var txtNum:TextField;
      
      public var iDv:*;
      
      private var iVisible:Boolean = false;
      
      public function iControl()
      {
         super();
         this.iHide();
         alpha = 0;
         scaleX = scaleY = Window.getRes();
      }
      
      private function timer(e:*) : *
      {
         this.iProg();
      }
      
      public function iSet(inDv:*) : void
      {
         this.iDv = inDv;
         if(this.iDv != null)
         {
            x = this.iDv.x;
            y = this.iDv.y;
            if(this.iDv.iType == "Heater")
            {
               gotoAndStop("Heater");
               this.btnLit.addEventListener(MouseEvent.MOUSE_DOWN,this.iLit);
               this.btnClose.addEventListener(MouseEvent.MOUSE_DOWN,this.iDelete);
            }
            else if(this.iDv.iType == "TT")
            {
               gotoAndStop("TT");
            }
            else if(this.iDv.iType == "SteelStand")
            {
               gotoAndStop("SteelStand");
               this.btnClose.addEventListener(MouseEvent.MOUSE_DOWN,this.iDelete);
            }
            else if(this.iDv.iType == "Tripod")
            {
               gotoAndStop("Tripod");
               this.btnClose.addEventListener(MouseEvent.MOUSE_DOWN,this.iDelete);
            }
            else if(this.iDv.iType == "SteelRing")
            {
               gotoAndStop("SteelRing");
            }
            else if(this.iDv.iType == "Funnel" || this.iDv.iType == "Watch" || this.iDv.iType == "Bowl")
            {
               gotoAndStop("Funnel");
               this.btnClose.addEventListener(MouseEvent.MOUSE_DOWN,this.iDelete);
               this.btnClear.addEventListener(MouseEvent.MOUSE_DOWN,this.iClear);
            }
            else if(this.iDv.iType == "Dropper")
            {
               gotoAndStop("Dropper");
               this.btnClose.addEventListener(MouseEvent.MOUSE_DOWN,this.iDelete);
            }
            else
            {
               gotoAndStop("TT");
            }
            this.iDisplay();
         }
         else
         {
            this.iHide();
         }
      }
      
      private function iStore(e:*) : void
      {
         gotoAndStop("Save");
      }
      
      private function iDisplay() : void
      {
         addEventListener(Event.ENTER_FRAME,this.timer);
         this.iVisible = true;
         if(this.iDv.iType == "Heater")
         {
            if(this.iDv.iIsIgn)
            {
               this.movLit.gotoAndStop(2);
            }
            else
            {
               this.movLit.gotoAndStop(1);
            }
         }
         this.iElude();
      }
      
      private function iElude() : void
      {
         x = this.iDv.x;
         y = this.iDv.y;
      }
      
      private function iHide() : void
      {
         this.iVisible = false;
      }
      
      private function iLit(e:*) : *
      {
         this.iDv.iDoIgn(!this.iDv.iIsIgn);
         this.iDisplay();
         root["myLab"].iSelected = null;
      }
      
      private function iClear(e:*) : *
      {
         this.iDv.iClear();
         this.iDisplay();
         root["myLab"].iSelected = null;
      }
      
      private function iAddTube(e:*) : *
      {
         root["pPan"].cCreateTubeSuper();
         root["myLab"].iDoLink1 = this.iDv;
         root["myLab"].iInitLink();
         this.iDisplay();
         root["myLab"].iSelected = null;
      }
      
      public function iDelete(e:*) : *
      {
         if(this.iDv.iType == "iDevice" || this.iDv.iGenr == "Heater")
         {
            this.iDv.iDelete();
         }
         else
         {
            this.iDv.iDelete();
         }
      }
      
      private function iAddChemical(e:*) : *
      {
         root["pPan"].pCD(2);
         root["myLab"].iSelected = null;
      }
      
      public function iProg() : *
      {
         var dis:Number = NaN;
         var iHt:Number = NaN;
         if(this.iVisible)
         {
            visible = true;
            if(alpha < 1)
            {
               alpha += 0.1;
            }
         }
         else if(alpha > 0)
         {
            alpha -= 0.1;
         }
         else
         {
            visible = false;
            removeEventListener(Event.ENTER_FRAME,this.timer);
         }
         if(this.iDv != null)
         {
            if(this.iDv.iType == "SteelRing")
            {
               y = this.iDv.y * this.iDv.iStr.Device_1.scaleY + this.iDv.iStr.y + 45;
               if(this.iDv.iStr.iLinkBox[0] != null)
               {
                  if(this.iDv.iStr.iLinkBox[0].objs.iType == "Heater")
                  {
                     gotoAndStop("SteelRing");
                     if(this.iDv.iStr.x < 300)
                     {
                        this.Board.gotoAndStop(2);
                        x = this.iDv.iStr.x + (this.iDv.x + 400) * this.iDv.iStr.Device_1.scaleX;
                     }
                     else
                     {
                        this.Board.gotoAndStop(1);
                        x = this.iDv.x * this.iDv.iStr.Device_1.scaleX + this.iDv.iStr.x;
                     }
                     if(this.iDv.iMove)
                     {
                        dis = -this.iDv.y - 163;
                        iHt = Math.round(this.iDv.iStr.iLinkBox[0].objs.MaxCap * Math.exp(-dis * dis / 30000));
                        this.txtNum.text = String(iHt) + "°C";
                     }
                  }
                  else
                  {
                     gotoAndStop(1);
                  }
               }
               else
               {
                  gotoAndStop(1);
               }
            }
         }
      }
   }
}

