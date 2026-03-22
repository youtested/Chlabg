package
{
   import flash.display.MovieClip;
   import flash.text.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1528")]
   public class iLabelBg extends MovieClip
   {
      
      public var txtL1:TextField;
      
      public var txtName:TextField;
      
      private var iLbk1:String;
      
      private var iLbk2:String;
      
      private var iColk1:Number;
      
      private var iColk2:Number;
      
      private var iColk3:Number;
      
      private var iColk4:Number;
      
      public var ids:Number;
      
      private var iDv:iDevice;
      
      public var iLife:Boolean;
      
      public function iLabelBg(inDv:*, n:*)
      {
         super();
         this.iDv = inDv;
         this.ids = n;
         this.iColk1 = this.iDv.cDv.cMt.cFather.sCol1;
         this.iColk2 = this.iDv.cDv.cMt.cFather.sCol2;
         this.iColk3 = this.iDv.cDv.cMt.cFather.sCol3;
         this.iColk4 = this.iDv.cDv.cMt.cFather.sCol4;
         this.iLife = true;
      }
      
      private function remove() : void
      {
         this.iLife = false;
         parent.removeChild(this);
      }
      
      public function iProg() : void
      {
         var m:Number = NaN;
         var st_temp:* = undefined;
         var ct:Number = NaN;
         var myFormat:TextFormat = null;
         if(this.iDv.cDv.cMt.cStack[this.ids] == null)
         {
            this.remove();
         }
         else
         {
            m = Number(this.iDv.cDv.cMt.cStack[this.ids].cMass);
            if(m < 0)
            {
               this.remove();
            }
            else
            {
               st_temp = this.iDv.cDv.cMt.cShow(this.ids,"cState");
               this.iLbk1 = this.iDv.cDv.cMt.cFather.sLbAry[root["pPan"].LabelType];
               switch(st_temp)
               {
                  case 1:
                     ct = Number(this.iColk1);
                     break;
                  case 2:
                     ct = Number(this.iColk2);
                     break;
                  case 3:
                     ct = Number(this.iColk3);
                     break;
                  case 4:
                     ct = Number(this.iColk4);
               }
               this.txtName.text = iSubscriptor.iSub(this.iDv.cDv.cMt.cShow(this.ids,"cRName"));
               myFormat = new TextFormat();
               if(this.txtName.text.length >= 10)
               {
                  myFormat.size = 11;
               }
               else
               {
                  myFormat.size = 15;
               }
               this.txtName.defaultTextFormat = myFormat;
               this.txtName.textColor = ct;
               this.txtL1.text = this.iDv.cDv.cMt.cShow(this.ids,this.iLbk1);
            }
         }
      }
   }
}

