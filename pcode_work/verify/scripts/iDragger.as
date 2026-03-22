package
{
   import flash.display.MovieClip;
   import flash.events.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1726")]
   public class iDragger extends MovieClip
   {
      
      public var Fluid:MovieClip;
      
      public var Powder:MovieClip;
      
      public var iInner1:MovieClip;
      
      public var iInner2:MovieClip;
      
      public var iInner3:MovieClip;
      
      public var iInner4:MovieClip;
      
      private var M:Number;
      
      public var e:iElement;
      
      public var iHasObj:*;
      
      private var iType:Number;
      
      public var tapy:Number = 0;
      
      public var iHt:Number = 0;
      
      public var iHasSnap:Boolean = false;
      
      private var nm:String;
      
      private var db:cDb;
      
      public function iDragger()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,15,this.frame16,18,this.frame19,30,this.frame31,33,this.frame34,45,this.frame46,48,this.frame49,60,this.frame61);
         visible = false;
      }
      
      private function getFrame(t:Number) : Number
      {
         if(t != 0)
         {
            return (t - 1) * 15 + 2;
         }
         return 47;
      }
      
      public function iSet(_e:iElement, _db:cDb) : void
      {
         var nm1:String = null;
         var _iInner:* = undefined;
         this.db = _db;
         this.e = _e;
         this.nm = this.e.iNm;
         var small:* = this.db.cLoad(this.nm,"tp") == "Organic" ? -3 : 0;
         var ky:Number = 0;
         if(this.db.iSb(this.nm) != null)
         {
            ky = -((this.db.iSbs(this.nm) - 1) * 10 + 10);
            nm1 = "<font size=\'" + String(35 * this.db.iSbs(this.nm)) + "\'>" + this.db.iSb(this.nm) + "</font>";
         }
         else
         {
            nm1 = CGN.Ch2(this.db.cLoad(this.nm,"htmlnm"),small);
         }
         var mix:Array = this.e.mix;
         var mixr:Array = this.e.mixr;
         var type:Number = Number(this.e.iSt);
         this.iType = type;
         gotoAndStop(this.getFrame(type));
         if(this.db.cLoad(this.nm,"tp") == "Organic")
         {
            gotoAndStop(this.getFrame(4));
            _iInner = this.iInner4;
            _iInner.gotoAndStop(4);
            _iInner.PsCol.gotoAndStop(type);
            _iInner.texture.gotoAndStop(type);
            _iInner.light.gotoAndStop(type);
            _iInner.movText2.txtName.htmlText = nm1;
            _iInner.movText2.txtName.y = ky;
         }
         else if(type == 1)
         {
            _iInner = this.iInner1;
            _iInner.gotoAndStop(1);
            _iInner.PsCol.gotoAndStop(1);
            _iInner.PsCol.SubPt.gotoAndStop(this.e.SubPt.currentFrame);
            _iInner.movText.txtName.htmlText = nm1;
         }
         else if(type == 2)
         {
            _iInner = this.iInner2;
            _iInner.gotoAndStop(2);
            _iInner.PsCol.gotoAndStop(2);
            _iInner.PsCol.SubPtn.gotoAndStop(this.e.SubPt.currentFrame);
            _iInner.txtName.htmlText = nm1;
         }
         else if(type == 3)
         {
            _iInner = this.iInner3;
            _iInner.gotoAndStop(3);
            _iInner.PsCol.gotoAndStop(3);
            _iInner.txtName.htmlText = nm1;
         }
         if(type != 0)
         {
            _iInner.PsCol.iColorPan.transform.colorTransform = this.e.iColorPan.transform.colorTransform;
            _iInner.PsCol.alpha = this.e.iColorPan.alpha;
         }
         this.mouseEnabled = false;
         this.mouseChildren = false;
         stage.addEventListener(MouseEvent.MOUSE_UP,this.cancel);
      }
      
      public function iGoBack() : void
      {
         var type:* = undefined;
         if(root["pPan"].iTap)
         {
            this.iHasObj.iD.PreSub.visible = false;
            root["pPan"].Ams.iClose();
            this.iHasObj = null;
            type = this.e.iSt;
            if(this.db.cLoad(this.nm,"tp") == "Organic")
            {
               type = 4;
            }
            gotoAndStop(this.getFrame(type));
            startDrag(true);
         }
      }
      
      public function iGo(o:*) : void
      {
         var type:* = undefined;
         if(root["pPan"].iTap)
         {
            if(o != this.iHasObj)
            {
               if(this.iHasObj != null)
               {
                  this.iHasObj.iD.PreSub.visible = false;
                  root["pPan"].Ams.iClose();
               }
               type = this.e.iSt;
               if(this.db.cLoad(this.nm,"tp") == "Organic")
               {
                  type = 4;
               }
               gotoAndPlay(this.getFrame(type));
               this.iHasObj = o;
               x = o.x + 60;
               y = o.y - 70;
               stopDrag();
               o.iD.PreSub.visible = true;
               o.iD.PreSub.gotoAndStop(this.iType + 1);
               root["pPan"].Ams.iSet(o);
               root["pPan"].Ams.iStart(1);
               stage.addEventListener(MouseEvent.MOUSE_MOVE,this.tdo);
            }
            else if(!root["pPan"].isSnap)
            {
               this.iDo();
            }
         }
      }
      
      private function tdo(e:*) : void
      {
         if(this.iHasObj != null)
         {
            if(root["pPan"].isSnap)
            {
               if(!this.iHasSnap)
               {
                  this.iHasSnap = true;
               }
               this.iDo();
            }
            else if(this.iHasSnap)
            {
               this.iHasObj = null;
               stage.addEventListener(MouseEvent.MOUSE_MOVE,this.tdo);
               this.iHasSnap = false;
            }
         }
      }
      
      private function iPrecise(n:Number) : Number
      {
         if(n >= 0 && n < 100)
         {
            return n / 10;
         }
         if(n >= 100 && n < 150)
         {
            return Math.round(n / 5) - 10;
         }
         if(n >= 150 && n < 170)
         {
            return Math.round(n / 2) - 55;
         }
         if(n >= 170 && n < 190)
         {
            return Math.round(n / 2) - 55;
         }
         return n - 150;
      }
      
      private function iDo() : void
      {
         var hm:Number = NaN;
         var v:Number = NaN;
         var m:Number = NaN;
         var mol:Number = NaN;
         var more2:Number = NaN;
         var o:* = this.iHasObj;
         if(!o.iZoomed)
         {
            this.iHt = o.y + 15 - stage.mouseY;
         }
         var ht:Number = this.iHt;
         if(ht < 0)
         {
            ht = 0;
         }
         if(ht > hm)
         {
            ht = hm;
         }
         hm = o.iD.Device_3.height * 0.8;
         var vm:Number = Number(o.cDv.cVol);
         v = Number(this.iPrecise(Math.round(ht / hm * 250)));
         if(this.e.iSt != 0)
         {
            if(this.e.iSt == 2 || this.e.iSt == 3 || this.e.iSt == 4)
            {
               if(o.iType != "Watch")
               {
                  if(v > 10)
                  {
                     if(root["pPan"].Ams.backs.currentFrame == 6)
                     {
                        root["pPan"].Ams.backs.play();
                        root["pPan"].Ams.txtGroup.play();
                     }
                  }
                  else if(root["pPan"].Ams.backs.currentFrame == 1)
                  {
                     root["pPan"].Ams.backs.play();
                     root["pPan"].Ams.txtGroup.play();
                  }
               }
               else
               {
                  v = 0.5;
               }
               if(v <= 0)
               {
                  v = 0.1;
               }
               m = v * root["myDb"].cLoad(this.e.iNm,"cDensity");
               ht = v / vm * hm;
               mol = Math.round(m / root["myDb"].cLoad(this.e.iNm,"mm") * 10) / 10;
               root["pPan"].Ams.txtGroup.txt1.txtAmount.text = String(v);
               root["pPan"].Ams.txtGroup.txt1.txtAmount1.text = "mL";
               root["pPan"].Ams.txtGroup.txt2.txtAmount2.text = String(mol);
            }
            else
            {
               more2 = 0;
               if(v > 10)
               {
                  if(root["pPan"].Ams.backs.currentFrame == 6)
                  {
                     root["pPan"].Ams.backs.play();
                     root["pPan"].Ams.txtGroup.play();
                  }
               }
               else if(root["pPan"].Ams.backs.currentFrame == 1)
               {
                  root["pPan"].Ams.backs.play();
                  root["pPan"].Ams.txtGroup.play();
               }
               if(o.iType != "Watch")
               {
                  m = v;
               }
               else
               {
                  v = 0.5;
                  m = v * root["myDb"].cLoad(this.e.iNm,"cDensity");
               }
               if(m <= 0)
               {
                  m = 0.1;
               }
               ht = m / root["myDb"].cLoad(this.e.iNm,"cDensity") / vm * hm;
               mol = Math.round(m / root["myDb"].cLoad(this.e.iNm,"mm") * 10) / 10;
               root["pPan"].Ams.txtGroup.txt1.txtAmount.text = String(m);
               root["pPan"].Ams.txtGroup.txt1.txtAmount1.text = "g";
               root["pPan"].Ams.txtGroup.txt2.txtAmount2.text = String(mol);
            }
            this.M = m;
            root["pPan"].Ams.txtGroup.txt2.txtAmount3.text = "mol";
         }
         else
         {
            ht = v;
            if(v <= 0)
            {
               v = 0.1;
            }
            root["pPan"].Ams.txtGroup.txt1.txtAmount.text = String(v);
            root["pPan"].Ams.txtGroup.txt1.txtAmount1.text = "g";
            root["pPan"].Ams.txtGroup.txt2.txtAmount2.text = "";
            root["pPan"].Ams.txtGroup.txt2.txtAmount3.text = "";
            this.M = v;
         }
         root["pPan"].Ams.x = o.x;
         root["pPan"].Ams.y = stage.mouseY;
         o.iD.PreSub.SubMuch.bac1.height = ht;
         o.iD.PreSub.SubSurface.y = -ht;
         o.iD.PreSub.SubMuch.bac1.y = o.iD.PreSub.SubMuch.bac3.y - o.iD.PreSub.SubMuch.bac3.height;
         o.iD.PreSub.SubMuch.bac2.y = o.iD.PreSub.SubMuch.bac1.y - o.iD.PreSub.SubMuch.bac1.height;
      }
      
      public function iSetAms() : void
      {
         root["pPan"].Ams.y = stage.mouseY;
      }
      
      private function cancel(e:*) : void
      {
         this.iStopDrag();
      }
      
      public function iDrag() : void
      {
         this.e.visible = false;
         visible = true;
         startDrag(true);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.domove);
      }
      
      private function domove(e:*) : void
      {
         var obj:* = root["myLab"].iHitTap(this);
         if(obj != null)
         {
            this.iGo(obj);
         }
         else if(this.iHasObj != null)
         {
            this.iGoBack();
         }
      }
      
      public function iStopDrag() : void
      {
         var iswater:Boolean = false;
         var type:Number = NaN;
         var _tar:* = undefined;
         var _alp:Number = NaN;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.tdo);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.domove);
         this.stopDrag();
         this.e.visible = true;
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.cancel);
         if(this.iHasObj == null)
         {
            visible = false;
            root["pPan"].Ams.iClose();
            if(root["pPan"].iCreator.currentFrame != 1)
            {
            }
         }
         else
         {
            iswater = Boolean(this.iHasObj.iHasWater);
            type = Number(this.e.iSt);
            this.iHasObj.iD.PreSub.visible = false;
            root["pPan"].Ams.iClose();
            x = this.iHasObj.x + 60;
            y = this.iHasObj.y - 70;
            root["myLab"].shineObj = null;
            root["pPan"].AddChem(this.iHasObj,this.M);
            this.iHasObj = null;
            if(this.db.cLoad(this.nm,"tp") == "Organic")
            {
               type = 4;
            }
            gotoAndPlay(this.getFrame(type) + 3);
            if(this.e.iSt == 1)
            {
               _tar = this.Powder;
               _alp = 0.5;
            }
            else if(this.e.iSt == 2)
            {
               _tar = this.Fluid;
               _alp = 0.3;
            }
            else
            {
               _tar = this.Powder;
               _alp = 0.5;
            }
            if(_tar != null)
            {
               if(this.iType != 0)
               {
                  _tar.transform.colorTransform = this.e.iColorPan.transform.colorTransform;
                  _tar.alpha = _alp;
               }
               _tar.visible = true;
               _tar.play();
            }
         }
         root["pPan"].iTap = false;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame4() : *
      {
         stop();
      }
      
      internal function frame16() : *
      {
         visible = false;
         stop();
      }
      
      internal function frame19() : *
      {
         stop();
      }
      
      internal function frame31() : *
      {
         visible = false;
         stop();
      }
      
      internal function frame34() : *
      {
         stop();
      }
      
      internal function frame46() : *
      {
         visible = false;
         stop();
      }
      
      internal function frame49() : *
      {
         stop();
      }
      
      internal function frame61() : *
      {
         visible = false;
         stop();
      }
   }
}

