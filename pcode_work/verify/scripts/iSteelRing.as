package
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol362")]
   public class iSteelRing extends MovieClip
   {
      
      public var iBody:MovieClip;
      
      public var iHitObj:MovieClip;
      
      public var iStr:iStructure;
      
      public var iIsAwg:Boolean = false;
      
      public var iAwgs:iAwg = new iAwg(this);
      
      public var iType:String;
      
      public var iGenr:String;
      
      public var iMove:Boolean = false;
      
      public function iSteelRing(inStr:*)
      {
         super();
         addFrameScript(0,this.frame1);
         this.iGenr = "SteelRing";
         this.iType = "SteelRing";
         this.iStr = inStr;
         this.iAwgs.x = 68;
         this.iAwgs.gotoAndStop(1);
         this.iHitObj.addEventListener(MouseEvent.MOUSE_DOWN,this.startDrag_press);
         addChild(this.iAwgs);
      }
      
      private function startDrag_press(e:*) : *
      {
         this.iMove = true;
         if(this.iStr.iLabs.iSelected != this)
         {
            this.iStr.iLabs.iSelected = this;
         }
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDrag_press);
         startDrag(false,new Rectangle(-90,-340,0,210));
         addEventListener(Event.ENTER_FRAME,this.iProg);
      }
      
      private function iProg(e:*) : *
      {
         this.iStr.iDragLink();
      }
      
      public function iDoAwg(inN:*) : *
      {
         this.iIsAwg = inN;
         if(inN)
         {
            this.iStr.iLabs.iDoAwg(false);
            this.iAwgs.gotoAndStop(2);
         }
         else
         {
            this.iAwgs.gotoAndStop(1);
         }
      }
      
      public function iDelete() : void
      {
         this.iStr.iLabs.iSelected = null;
         this.iStr.iDoSteelRing(false);
      }
      
      private function stopDrag_press(e:*) : *
      {
         this.iMove = false;
         this.iStr.iLabs.iSelected = null;
         stopDrag();
         this.iStr.iDragLink();
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDrag_press);
         removeEventListener(Event.ENTER_FRAME,this.iProg);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

