package
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.text.*;
   import flash.ui.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol267")]
   public class iTap extends MovieClip
   {
      
      public var TB:MovieClip;
      
      public var TapHit:MovieClip;
      
      private var iLb:iLab;
      
      private var iIsDrag:Boolean = false;
      
      private var iIsTap:Boolean = false;
      
      private var iTapTime:Number = 0;
      
      private var iTpNm:String;
      
      private var iTp:String;
      
      private var iState:Number;
      
      private var SubName:TextField = new TextField();
      
      private var SubAtt:TextField = new TextField();
      
      private var iStep:Number = 0;
      
      public function iTap(inLabs:*)
      {
         super();
         Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
         this.TB.TV.height = 0;
         this.iLb = inLabs;
         visible = false;
         this.SubName.x = -52;
         this.SubName.y = -163;
         this.SubAtt.x = -1;
         this.SubAtt.y = -163;
         this.SubName.selectable = false;
         this.SubName.width = width;
         this.SubName.height = 18;
         this.SubAtt.selectable = false;
         this.SubAtt.width = width;
         this.SubAtt.height = 18;
         addChild(this.SubName);
         addChild(this.SubAtt);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.iDoTap);
         this.addEventListener(MouseEvent.MOUSE_UP,this.iStopTap);
      }
      
      public function iProg() : *
      {
         var tf_temp2:TextFormat = null;
         if(this.iIsTap)
         {
            tf_temp2 = new TextFormat();
            tf_temp2.font = "Tahoma";
            tf_temp2.bold = false;
            tf_temp2.color = 16777215;
            if(y - stage.mouseY > 0)
            {
               this.iTapTime = (y - stage.mouseY) / 180 * 50;
            }
            else
            {
               this.iTapTime = 0;
            }
            this.TB.TV.height = this.iTapTime / 50 * 180;
            if(this.iTapTime > 50)
            {
               this.iTapTime = 50;
            }
            this.SubAtt.text = String(Math.round(this.iTapTime)) + " " + this.iLb.cDm.sTemp;
            this.SubAtt.setTextFormat(tf_temp2);
         }
      }
      
      public function iDoTap(e:*) : *
      {
         if(!this.iIsDrag)
         {
            this.iIsTap = true;
         }
      }
      
      public function iDragTap1(inNm:String, inSt:Number, inTp:String) : *
      {
         this.addEventListener(TouchEvent.TOUCH_END,this.iStopTap);
         var tf_temp:TextFormat = new TextFormat();
         tf_temp.font = "Tahoma";
         tf_temp.bold = true;
         switch(inSt)
         {
            case 1:
               tf_temp.color = 16777215;
               break;
            case 2:
               tf_temp.color = 39423;
               break;
            case 3:
               tf_temp.color = 10066329;
               break;
            case 4:
               tf_temp.color = 16711935;
         }
         this.iState = inSt;
         this.SubName.text = inNm;
         this.iTp = inTp;
         this.SubName.setTextFormat(tf_temp);
         this.iTpNm = inNm;
         startDrag(true);
         visible = true;
         this.iIsDrag = true;
      }
      
      public function iStopTap(e:*) : *
      {
         if(this.iIsDrag)
         {
            this.addEventListener(TouchEvent.TOUCH_BEGIN,this.iDoTap);
            this.iIsDrag = false;
            stopDrag();
            this.iTapTime = 0;
         }
         else
         {
            this.removeEventListener(TouchEvent.TOUCH_BEGIN,this.iDoTap);
            this.removeEventListener(TouchEvent.TOUCH_END,this.iStopTap);
            this.iTryHit();
            this.TB.TV.height = 0;
            this.iIsTap = false;
            this.SubName.text = "";
            this.SubAtt.text = "";
            visible = false;
         }
      }
      
      public function iTryHit() : *
      {
         var i:* = undefined;
         var mat_temp:* = undefined;
         for(i in this.iLb.iBox)
         {
            if(this.iLb.iBox[i] != null && this.iLb.iBox[i].iType != "SteelStand" && this.iLb.iBox[i].iType != "Dropper" && this.iLb.iBox[i].iType != "Heater")
            {
               if(this.iLb.iBox[i].iD.iHitObj.hitTestObject(this.TapHit))
               {
                  mat_temp = this.iLb.iBox[i].cDv.cMt.cFather.cCreatMatter(this.iTpNm,this.iTapTime,this.iLb.iBox[i].cDv.cMt.cFather.sTemp);
                  this.iLb.iBox[i].cDv.cMt.cAddSub(this.iLb.iBox[i].cDv.cMt.cFather.cCore[mat_temp],1);
                  if(this.iTapTime < 10)
                  {
                     this.iLb.mSd.inmTap.play();
                  }
                  else
                  {
                     this.iLb.mSd.inmTap2.play();
                  }
                  break;
               }
            }
         }
      }
   }
}

