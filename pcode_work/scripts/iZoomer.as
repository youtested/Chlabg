package
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol42")]
   public class iZoomer extends MovieClip
   {
      
      public var b2:MovieClip;
      
      public var mag:MovieClip;
      
      private var iTID:int;
      
      private var iMagd:*;
      
      private var matrix:Matrix;
      
      private var rect:Rectangle;
      
      private var Adding:Boolean = false;
      
      private var iMove:Boolean = false;
      
      private var b:Bitmap;
      
      public function iZoomer()
      {
         super();
         addFrameScript(0,this.frame1,6,this.frame7,12,this.frame13);
      }
      
      public function iZoomTo(d:*, e:TouchEvent, l:Boolean = false) : void
      {
         var scale:Number = NaN;
         visible = true;
         this.iTID = e.touchPointID;
         this.Adding = l;
         scale = 2;
         if(this.Adding)
         {
            scale = 4;
            gotoAndPlay(8);
            x = d.x;
         }
         else
         {
            scale = 2;
            gotoAndPlay(2);
            x = e.stageX;
         }
         y = e.stageY;
         stage.addEventListener(TouchEvent.TOUCH_MOVE,this.tm);
         this.iMagd = d;
         this.rect = d.getBounds(root["myLab"]);
         this.matrix = new Matrix(1,0,0,1,d.iD.Device_2.width,d.iD.Device_2.height * 0.6 + 40);
         this.matrix.scale(scale,scale);
         if(currentFrame > 1)
         {
            this.iMagnify(this.iMagd);
            addEventListener(Event.ENTER_FRAME,this.domg);
         }
      }
      
      private function domg(e:*) : void
      {
         if(currentFrame > 2)
         {
            if(!this.iMove)
            {
               this.iMagnify(this.iMagd);
            }
            else
            {
               this.iMove = false;
            }
         }
      }
      
      private function tm(e:TouchEvent) : void
      {
         if(e.touchPointID == this.iTID)
         {
            if(this.Adding)
            {
               x = this.iMagd.x;
            }
            else
            {
               x = e.stageX;
            }
            y = e.stageY;
            if(currentFrame > 2)
            {
               if(this.Adding)
               {
                  this.b.x = -(x - this.iMagd.x) * 2 - this.b.width / 2 - 400;
                  this.b.y = -(y - this.iMagd.y) * 2 - this.b.height / 2 - 200;
               }
               else
               {
                  this.b.x = -(x - this.iMagd.x) * 2 - this.b.width / 2 - 15;
                  this.b.y = -(y - this.iMagd.y) * 2 - this.b.height / 2 - 150;
               }
               this.b2.x = this.b.x;
               this.b2.y = this.b.y;
            }
            this.iMove = true;
         }
      }
      
      public function iDisZoom() : void
      {
         stage.removeEventListener(TouchEvent.TOUCH_MOVE,this.tm);
         removeEventListener(Event.ENTER_FRAME,this.domg);
         visible = false;
         this.iMagd = null;
         gotoAndStop(1);
      }
      
      public function iHideZoom() : void
      {
         visible = false;
      }
      
      public function iReZoom() : void
      {
         visible = true;
      }
      
      public function iMagnify(d:*) : void
      {
         var bitmapdata:BitmapData = new BitmapData(400,610,true,16777215);
         bitmapdata.draw(d,this.matrix);
         this.b = new Bitmap(bitmapdata);
         if(currentFrame == 7 || currentFrame == 13)
         {
            if(this.mag != null)
            {
               while(this.mag.numChildren > 0)
               {
                  this.mag.removeChildAt(0);
               }
               if(this.Adding)
               {
                  this.b.x = -(x - d.x) * 2 - this.b.width / 2 - 400;
                  this.b.y = -(y - d.y) * 2 - this.b.height / 2 - 200;
               }
               else
               {
                  this.b.x = -(x - d.x) * 2 - this.b.width / 2 - 15;
                  this.b.y = -(y - d.y) * 2 - this.b.height / 2 - 150;
               }
               this.b2.x = this.b.x;
               this.b2.y = this.b.y;
               this.mag.addChild(this.b);
            }
         }
      }
      
      public function initZoom2() : void
      {
      }
      
      public function initZoom() : void
      {
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame7() : *
      {
         stop();
      }
      
      internal function frame13() : *
      {
         stop();
      }
   }
}

