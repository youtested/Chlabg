package
{
   import flash.display.MovieClip;
   import flash.events.*;
   
   public class iDropper extends iBase
   {
      
      public static var iSignAll:Number = 0;
      
      public var iAction:MovieClip;
      
      public var iD:MovieClip;
      
      public var iHitObj:MovieClip;
      
      public var iShadow:MovieClip;
      
      public var iSign:Number;
      
      private var iIsTap:Boolean = false;
      
      private var iTapTime:Number = 5;
      
      private var iTapMt:Number = 1;
      
      private var iMove:Boolean = false;
      
      private var pre_y:Number;
      
      public var isSucked:Boolean = false;
      
      private var act:Number = 0;
      
      public var leakToObj:*;
      
      public function iDropper(inStance:cDevice, inLb:*, inName:*)
      {
         super();
         iName = inName;
         ++iSignAll;
         this.iSign = iSignAll;
         iLabs = inLb;
         cDv = inStance;
         iType = cDv.cType;
         this.iShadow.mouseEnabled = false;
         mouseEnabled = false;
         this.iD.Ball.gotoAndStop(2);
      }
      
      public function iStart(mov:*) : void
      {
         this.iAction.visible = true;
         this.leakToObj = mov;
         stage.addEventListener(TouchEvent.TOUCH_MOVE,this.ActionMove);
      }
      
      public function iStop() : void
      {
         this.leakToObj = null;
         stage.removeEventListener(TouchEvent.TOUCH_MOVE,this.ActionMove);
      }
      
      private function ActionMove(e:TouchEvent) : void
      {
         if(e.touchPointID == root["pPan"].iDRTID)
         {
            if(this.isSucked)
            {
               if(this.iAction.currentFrame >= 17)
               {
                  this.pre_y = y - 40;
                  this.act = Math.round((e.stageY - this.pre_y) / 7);
                  if(this.act > 11)
                  {
                     this.iAction.gotoAndPlay(28);
                     this.isSucked = false;
                     this.pre_y = e.stageY;
                     this.iTryLeak();
                     this.iD.Ball.gotoAndStop(2);
                  }
                  else
                  {
                     if(this.act < 0)
                     {
                        this.act = 0;
                     }
                     this.iAction.gotoAndStop(17 + this.act);
                  }
               }
            }
            else if(this.iAction.currentFrame < 17)
            {
               this.pre_y = y + 30;
               this.act = Math.round((this.pre_y - e.stageY) / 8);
               if(this.act > 12)
               {
                  this.iAction.gotoAndPlay(13);
                  this.isSucked = true;
                  this.pre_y = e.stageY;
                  this.iTrySuck();
                  this.iD.Ball.gotoAndStop(1);
               }
               else
               {
                  if(this.act < 1)
                  {
                     this.act = 1;
                  }
                  this.iAction.gotoAndStop(this.act);
               }
            }
         }
      }
      
      public function iTrySuck() : *
      {
         var iSsc:Boolean = false;
         var inN:* = undefined;
         var ary_temp:* = undefined;
         var j:* = undefined;
         var i:* = undefined;
         var t1:* = undefined;
         var t2:* = undefined;
         var mm1:* = undefined;
         var mm2:* = undefined;
         var mass_temp:* = undefined;
         var mat_temp:* = undefined;
         if(this.leakToObj != null)
         {
            iSsc = false;
            inN = this.iTapTime;
            ary_temp = this.leakToObj.cDv.cMt.cStack;
            if(this.leakToObj.iType == "Beaker1" || this.leakToObj.iType == "Awl" || this.leakToObj.iType == "Beaker2" || this.leakToObj.iType == "Awl2" || this.leakToObj.iType == "Boiler" || this.leakToObj.iType == "Boiler2")
            {
               if(root["pPan"].Ams.iN != 1)
               {
                  root["pPan"].Ams.iSet(this.leakToObj);
                  root["pPan"].Ams.iStart(2);
                  root["pPan"].Ams.iMag();
               }
            }
            iLabs.myReport.NewAction(ActionType.SUCK,this.leakToObj.iUID);
            for(j in ary_temp)
            {
               iSsc = false;
               if(ary_temp[j].cState == 2 || ary_temp[j].cState == 4)
               {
                  for(i = 0; i < cDv.cMt.cStack.length; i++)
                  {
                     if(cDv.cMt.cStack[i] != null)
                     {
                        if(cDv.cMt.cStack[i].cName == ary_temp[j].cName)
                        {
                           t1 = cDv.cMt.cStack[i].cTemp;
                           t2 = ary_temp[j].cTemp;
                           mm1 = cDv.cMt.cStack[i].cMass;
                           mm2 = ary_temp[j].cDensity * inN;
                           this.leakToObj.cDv.cMt.cStack[j].cMass -= mm2;
                           cDv.cMt.cStack[i].cTemp = t1 + Math.abs((t1 - t2) / (mm1 / mm2 + 1));
                           cDv.cMt.cStack[i].cFlow(-inN,"cVol");
                           iSsc = true;
                           break;
                        }
                     }
                  }
                  if(!iSsc)
                  {
                     mass_temp = ary_temp[j].cDensity * inN;
                     this.leakToObj.cDv.cMt.cStack[j].cMass -= mass_temp;
                     mat_temp = cDv.cMt.cFather.cCreatMatter(ary_temp[j].cName,mass_temp,ary_temp[j].cTemp);
                     cDv.cMt.cAddSub(cDv.cMt.cFather.cCore[mat_temp],1);
                  }
               }
            }
         }
      }
      
      public function iTryLeak() : *
      {
         var inN:* = undefined;
         var SoundPlayed:Boolean = false;
         var iSsc:Boolean = false;
         var ary_temp:* = undefined;
         var j:* = undefined;
         var i:* = undefined;
         var t1:* = undefined;
         var t2:* = undefined;
         var mm1:* = undefined;
         var mm2:* = undefined;
         var mass_temp:* = undefined;
         var mat_temp:* = undefined;
         if(this.leakToObj != null)
         {
            inN = this.iTapTime;
            SoundPlayed = false;
            iSsc = false;
            ary_temp = cDv.cMt.cStack;
            if(this.leakToObj.iType == "Beaker1" || this.leakToObj.iType == "Awl" || this.leakToObj.iType == "Beaker2" || this.leakToObj.iType == "Awl2" || this.leakToObj.iType == "Boiler" || this.leakToObj.iType == "Boiler2")
            {
               if(root["pPan"].Ams.iN != 1)
               {
                  root["pPan"].Ams.iSet(this.leakToObj);
                  root["pPan"].Ams.iStart(2);
                  root["pPan"].Ams.iMag();
               }
            }
            for(j in ary_temp)
            {
               iSsc = false;
               if(this.leakToObj.iGenr == "Container")
               {
                  if(ary_temp[j].cMass > 0)
                  {
                     if(ary_temp[j].cState == 2 || ary_temp[j].cState == 4)
                     {
                        if(!SoundPlayed)
                        {
                           SoundPlayed = true;
                           iLabs.mSd.inmTap.play();
                           iLabs.myReport.NewAction(ActionType.LEAK,this.leakToObj.iUID);
                        }
                        for(i = 0; i < this.leakToObj.cDv.cMt.cStack.length; i++)
                        {
                           if(this.leakToObj.cDv.cMt.cStack[i] != null)
                           {
                              if(this.leakToObj.cDv.cMt.cStack[i].cName == ary_temp[j].cName)
                              {
                                 t1 = this.leakToObj.cDv.cMt.cStack[i].cTemp;
                                 t2 = ary_temp[j].cTemp;
                                 mm1 = this.leakToObj.cDv.cMt.cStack[i].cMass;
                                 mm2 = ary_temp[j].cDensity * inN;
                                 cDv.cMt.cStack[j].cMass -= mm2;
                                 this.leakToObj.cDv.cMt.cStack[i].cTemp = t1 + Math.abs((t1 - t2) / (mm1 / mm2 + 1));
                                 this.leakToObj.cDv.cMt.cStack[i].cFlow(-inN,"cVol");
                                 iSsc = true;
                                 break;
                              }
                           }
                        }
                        if(!iSsc)
                        {
                           mass_temp = ary_temp[j].cDensity * inN;
                           cDv.cMt.cStack[j].cMass -= mass_temp;
                           mat_temp = this.leakToObj.cDv.cMt.cFather.cCreatMatter(ary_temp[j].cName,mass_temp,ary_temp[j].cTemp);
                           this.leakToObj.cDv.cMt.cAddSub(this.leakToObj.cDv.cMt.cFather.cCore[mat_temp],1);
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

