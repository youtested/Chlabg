package
{
   import flash.display.MovieClip;
   import flash.events.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1538")]
   public class iHeaterCap extends iBase
   {
      
      public var iD:MovieClip;
      
      public var iHitHeat:MovieClip;
      
      public var iHitObj:MovieClip;
      
      public function iHeaterCap(inStance:*, inLb:*, inName:*)
      {
         super();
         iName = inName;
         iLabs = inLb;
         iType = "HeaterCap";
         this.iInit();
      }
      
      public function iInit() : *
      {
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.startDrag_Press);
      }
      
      public function iProg() : *
      {
      }
      
      public function startDrag_Press(e:*) : void
      {
         this.iDrag();
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDrag_Release);
      }
      
      public function stopDrag_Release(e:*) : void
      {
         this.iStopDrag();
      }
      
      public function iDrag() : *
      {
         startDrag(false);
      }
      
      public function iStopDrag() : *
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDrag_Release);
         iLabs.iSortDepth();
         stopDrag();
         if(!iLabs.iHitDsk(this))
         {
            iLabs.iRemove(this);
         }
         else if(iLabs.iHitHeater(this))
         {
            iLabs.iRemove(this);
         }
      }
   }
}

