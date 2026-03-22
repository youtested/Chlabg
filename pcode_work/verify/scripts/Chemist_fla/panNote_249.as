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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1390")]
   public dynamic class panNote_249 extends MovieClip
   {
      
      public var movBoard:MovieClip;
      
      public var movInner:MovieClip;
      
      public var n2:String;
      
      public var n:String;
      
      public var s:Number;
      
      public var access:Number;
      
      public var t:String;
      
      public var i:*;
      
      public function panNote_249()
      {
         super();
         addFrameScript(0,this.frame1,8,this.frame9);
      }
      
      public function NoSubLine(t:String) : String
      {
         var nt:String = "";
         for(var s:* = 0; s < t.length; s++)
         {
            if(t.charAt(s) != "_")
            {
               nt += t.charAt(s);
            }
         }
         return nt;
      }
      
      public function testAccess() : void
      {
         if(this.access != 1 && root["pPan"].iRankTp == 1)
         {
            this.movInner.movBuy.visible = true;
            this.movBoard.movBoard.movBack.gotoAndStop(2);
            this.movInner.movBuy.addEventListener(MouseEvent.MOUSE_DOWN,this.dobuy);
         }
         else
         {
            this.movInner.movBuy.visible = false;
            this.movBoard.movBoard.movBack.gotoAndStop(1);
         }
      }
      
      public function dodata(e:*) : void
      {
         this.movBoard.gotoAndStop(1);
         this.movInner.gotoAndStop(1);
         this.movInner.movState.gotoAndStop(this.s);
         this.movInner.txtName.text = root["myDb"].SDb[this.n].aname;
         this.movInner.btnReactions.addEventListener(MouseEvent.MOUSE_DOWN,this.goreactions);
         this.movInner.btnStar.addEventListener(MouseEvent.MOUSE_DOWN,this.dostar);
         if(root["myDb"].SDb[this.n].mm != null)
         {
            this.movInner.txtMo.text = root["myDb"].SDb[this.n].mm;
            this.movInner.txtReaction.text = root["pPan"].getFmlNumber(this.n);
            this.movInner.txtDe.text = root["myDb"].cLoad(this.n,"cDensity");
            if(root["myDb"].SDb[this.n].star != null)
            {
               if(root["myDb"].SDb[this.n].star)
               {
                  this.movInner.btnStar.gotoAndStop(2);
               }
               else
               {
                  this.movInner.btnStar.gotoAndStop(1);
               }
            }
            if(root["myDb"].SDb[this.n].mp < 9000)
            {
               this.movInner.txtMe.text = root["myDb"].SDb[this.n].mp + "°C";
            }
            else
            {
               this.movInner.txtMe.text = "";
            }
            if(root["myDb"].SDb[this.n].bp < 9000)
            {
               this.movInner.txtBo.text = root["myDb"].SDb[this.n].bp + "°C";
            }
            else
            {
               this.movInner.txtBo.text = "";
            }
            if(this.n != "H2O")
            {
               if(root["myDb"].SDb[this.n].solu < 10000)
               {
                  this.movInner.txtSo.text = root["myDb"].SDb[this.n].solu;
               }
               else if(iLoc.LG == "en")
               {
                  this.movInner.txtSo.text = "miscible";
               }
               else if(iLoc.LG == "zh")
               {
                  this.movInner.txtSo.text = "互溶";
               }
            }
            else
            {
               this.movInner.txtSo.text = "-";
            }
         }
      }
      
      public function doreactions(e:*) : void
      {
         this.movInner.gotoAndStop(3);
         this.movInner.btnData.addEventListener(MouseEvent.MOUSE_DOWN,this.godata);
         this.movInner.txtDe.htmlText = root["pPan"].getFml(this.n);
         this.movInner.txtReaction2.text = root["pPan"].getFmlNumber(this.n);
      }
      
      public function dostar(e:*) : void
      {
         if(root["myDb"].SDb[this.n].star == null)
         {
            root["myDb"].SDb[this.n].star = true;
         }
         else
         {
            root["myDb"].SDb[this.n].star = !root["myDb"].SDb[this.n].star;
         }
         root["myDb"].cSaveStar(this.n,root["myDb"].SDb[this.n].star);
         if(root["myDb"].SDb[this.n].star)
         {
            this.movInner.btnStar.gotoAndStop(2);
         }
         else
         {
            this.movInner.btnStar.gotoAndStop(1);
         }
      }
      
      public function goreactions(e:*) : void
      {
         this.movBoard.gotoAndStop(2);
         this.doreactions(0);
      }
      
      public function godata(e:*) : void
      {
         this.movBoard.gotoAndStop(1);
         this.dodata(0);
         this.testAccess();
      }
      
      public function dobuy(e:*) : void
      {
         Credit.buyOrganic();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame9() : *
      {
         stop();
         this.movInner.movBuy.btnBuy.txtPrice.text = Credit.getPrice("chemist.chemicals.organic");
         this.n2 = root["pPan"].noteName;
         this.n = root["pPan"].noteName2;
         this.s = root["myDb"].cLoad(this.n,"cState");
         this.access = Credit.organic;
         if(this.s == 0)
         {
            this.movInner.gotoAndStop(2);
            this.movBoard.gotoAndStop(3);
            this.movInner.txtName.htmlText = this.NoSubLine(this.n2);
            this.t = "";
            for(this.i in root["myDb"].SDb[this.n].mix)
            {
               this.t += root["myDb"].SDb[this.n].mix[this.i] + " " + root["myDb"].SDb[this.n].mixr[this.i] + "%\n";
            }
            this.movInner.txtDe.text = this.t;
         }
         else
         {
            this.dodata(0);
            this.testAccess();
         }
      }
   }
}

