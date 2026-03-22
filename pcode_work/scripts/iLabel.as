package
{
   import flash.display.*;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1535")]
   public class iLabel extends MovieClip
   {
      
      public var Board:MovieClip;
      
      private var iBox:Dictionary;
      
      private var iDv:*;
      
      private var iBg:Sprite;
      
      private var isShow:Boolean = true;
      
      private var isOn:Boolean = false;
      
      private var iDAList:Dictionary = new Dictionary(true);
      
      public function iLabel(inDv:*)
      {
         super();
         this.iBg = new Sprite();
         this.iDv = inDv;
         this.iBox = new Dictionary();
         addChild(this.iBg);
         this.hideLabel();
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      private function showLabel() : *
      {
         this.isShow = true;
         this.iBg.visible = true;
         this.Board.visible = false;
      }
      
      private function hideLabel() : *
      {
         this.isShow = false;
         this.iBg.visible = false;
         this.Board.visible = false;
      }
      
      public function iProg() : *
      {
         if(root["pPan"].iShowLabel)
         {
            if(this.iDv.iGenr == "Container")
            {
               if(!this.isShow)
               {
                  this.showLabel();
               }
            }
         }
         else if(this.isShow)
         {
            this.hideLabel();
         }
         if(this.isShow)
         {
            this.iShow();
         }
      }
      
      private function iShow() : *
      {
         var t:* = undefined;
         var v:* = undefined;
         var k:* = undefined;
         var ht_temp:* = 0;
         for(t in this.iBox)
         {
            if(this.iBox[t] != null)
            {
               if(this.iBox[t].iLife)
               {
                  this.iBox[t].iProg();
               }
               else
               {
                  this.iBox[t] = null;
               }
            }
         }
         for(v = this.iDv.cDv.cMt.cStack.length; v > 0; v--)
         {
            k = v - 1;
            if(this.iDv.cDv.cMt.cStack[k].cMass > 0)
            {
               if(this.iBox["iBg" + k] == null)
               {
                  this.iBox["iBg" + k] = new iLabelBg(this.iDv,k);
                  this.iBg.addChild(this.iBox["iBg" + k]);
               }
               this.iBox["iBg" + k].y = -ht_temp;
               ht_temp += this.iBox["iBg" + k].height - 5;
            }
         }
         if(ht_temp > 0)
         {
            this.Board.lm.height = ht_temp + 8;
            this.Board.lu.y = -this.Board.lm.height + 5;
            this.Board.visible = false;
         }
         else
         {
            this.Board.visible = false;
         }
      }
   }
}

