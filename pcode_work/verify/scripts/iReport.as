package
{
   import flash.net.*;
   
   public class iReport
   {
      
      public var dlist:Array = new Array();
      
      public var ddate:String;
      
      public var dtemp:String;
      
      public var dgas:String;
      
      public var dspeed:String;
      
      public var core:cDomain;
      
      public var lab:iLab;
      
      public var Step:*;
      
      public var StepStart:int = 0;
      
      public var PlainTxt:*;
      
      public var MainTxt:String;
      
      public var ReportSo:SharedObject = SharedObject.getLocal("ReportSO3");
      
      public function iReport(c:*, l:*)
      {
         super();
         this.core = c;
         this.lab = l;
         this.dlist = new Array();
         this.MainTxt = "";
         var dt:Date = new Date();
         this.ddate = dt.date + "/" + String(dt.month + 1) + "/" + dt.fullYear;
         this.StepStart = 0;
      }
      
      public function NewReport() : void
      {
         this.StepStart = 0;
         this.dlist = new Array();
         var dt:Date = new Date();
         this.ddate = dt.date + "/" + String(dt.month + 1) + "/" + dt.fullYear;
         this.MainTxt = "";
         while(this.dlist.length > 0)
         {
            this.dlist.pop();
         }
         this.dlist.push(new iReportQuery(ActionType.SETLAB,String(this.core.sTemp),String(this.core.sAtmN),String(this.core.cSpeed)));
      }
      
      public function NewAction(action:String, a:* = null, b:* = null, c:* = null, d:* = null) : void
      {
         this.dlist.push(new iReportQuery(action,a,b,c,d));
         this.save();
      }
      
      public function save() : void
      {
         var i:* = undefined;
         this.ReportSo.data.Main = this.DoReport();
         for(i in this.lab.root["pPan"].iRolling)
         {
            this.ReportSo.data[i] = this.lab.root["pPan"].iRolling[i];
         }
         this.ReportSo.data.Step = this.Step;
         this.ReportSo.flush();
      }
      
      public function load() : void
      {
         var i:* = undefined;
         if(this.ReportSo.data.Main != null)
         {
            this.MainTxt = this.ReportSo.data.Main;
            for(i in this.ReportSo.data)
            {
               trace("so",i);
               if(i != "Main")
               {
                  this.lab.root["pPan"].iRolling[i] = this.ReportSo.data[i];
               }
            }
            this.StepStart = this.ReportSo.data.Step;
         }
         else
         {
            this.MainTxt = "";
            this.dlist.push(new iReportQuery(ActionType.SETLAB,String(this.core.sTemp),String(this.core.sAtmN),String(this.core.cSpeed)));
         }
      }
      
      public function DoReport() : String
      {
         var i:* = undefined;
         this.Step = this.StepStart;
         var t:String = "<font color = \'#666666\'>";
         for(i in this.dlist)
         {
            t = t.concat(this.DoReportLine(this.dlist[i]));
            t = t.concat("\n");
         }
         t = this.MainTxt.concat(t);
         this.PlainTxt = "Lab Report\n" + this.ddate + "\n\n" + t;
         return t;
      }
      
      public function GetStep() : String
      {
         ++this.Step;
         return String(this.Step) + ". ";
      }
      
      public function DoReportLine(q:iReportQuery) : String
      {
         var t:String = null;
         var t2:String = null;
         if(iLoc.LG == "zh")
         {
            switch(q.iAction)
            {
               case ActionType.ADDEQUIP:
                  return this.GetStep() + "放置 <font color= \'#000000\'>" + q.a + "<font color = \'#666666\'> 于实验桌。";
               case ActionType.ADDLID:
                  return this.GetStep() + "添加瓶塞于 <font color= \'#000000\'>" + q.a + "<font color = \'#666666\'>。";
               case ActionType.LINKTUBE:
                  return this.GetStep() + "用玻璃导管链接 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> 和 <font color= \'#000000\'>" + q.b + "<font color= \'#666666\'>。";
               case ActionType.PUT:
                  return this.GetStep() + "放置 <font color= \'#000000\'>" + q.b + "<font color= \'#666666\'> 于 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>。";
               case ActionType.CLEARSUB:
                  return this.GetStep() + "清空 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> 内的所有药剂。";
               case ActionType.TESTPH:
                  return this.GetStep() + "用pH试纸检测 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> 内的pH值。";
               case ActionType.STIR:
                  return this.GetStep() + "搅拌 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> 内的药剂。";
               case ActionType.BURN:
                  return this.GetStep() + "燃烧 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> 内的药剂。";
               case ActionType.FREEZE:
                  return this.GetStep() + "冷冻 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> 内的药剂。";
               case ActionType.TESTDT:
                  return this.GetStep() + "用温度计检测 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> 内的温度。";
               case ActionType.CLEAN:
                  return this.GetStep() + "清理玻璃碎片。";
               case ActionType.DELETE:
                  return this.GetStep() + "删除 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>。";
               case ActionType.EXPLODE:
                  return "<font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>" + " 爆炸了。";
               case ActionType.SUCK:
                  return this.GetStep() + "用滴管吸取 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> 内的药剂。";
               case ActionType.LEAK:
                  return this.GetStep() + "用滴管向 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> 添加药剂。";
               case ActionType.POUR:
                  return this.GetStep() + "从 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> 内倾倒药剂到 <font color= \'#000000\'>" + q.b + "<font color= \'#666666\'>。";
               case ActionType.REACTION:
                  return " <font color= \'#000000\'>" + q.b + " 内发生化学反应: " + q.a + "<font color= \'#666666\'>。";
               case ActionType.IGNITE:
                  return this.GetStep() + "点燃 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>。";
               case ActionType.DISIGNITE:
                  return this.GetStep() + "熄灭 <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>。";
               case ActionType.ADDSUB:
                  if(q.c == 1)
                  {
                     t = "(s)";
                  }
                  if(q.c == 2)
                  {
                     t = "(l)";
                  }
                  if(q.c == 3)
                  {
                     t = "(g)";
                  }
                  if(q.c == "")
                  {
                     t = "";
                  }
                  return this.GetStep() + "添加 <font color= \'#000000\'>" + q.a + " " + q.b + t + "<font color= \'#666666\'> 到 <font color= \'#000000\'>" + q.d + "<font color= \'#666666\'>。";
               case ActionType.SETLAB:
                  if(q.b == "1")
                  {
                     t2 = "纯氧";
                  }
                  if(q.b == "2")
                  {
                     t2 = "保护气";
                  }
                  if(q.b == "3")
                  {
                     t2 = "基本空气";
                  }
                  if(q.b == "4")
                  {
                     t2 = "自然空气";
                  }
                  if(q.b == "5")
                  {
                     t2 = "氢气";
                  }
                  if(q.b == "6")
                  {
                     t2 = "氯气";
                  }
                  if(q.b == "7")
                  {
                     t2 = "二氧化碳";
                  }
                  return this.GetStep() + "设置实验室为 " + q.a + "℃ " + t2 + " 和 " + q.c + "x 时间速度。";
            }
         }
         else
         {
            switch(q.iAction)
            {
               case ActionType.TRACE:
                  return q.a;
               case ActionType.ADDEQUIP:
                  return this.GetStep() + "Place a <font color= \'#000000\'>" + q.a + "<font color = \'#666666\'> on the table.";
               case ActionType.ADDLID:
                  return this.GetStep() + "Add lid to <font color= \'#000000\'>" + q.a + "<font color = \'#666666\'>.";
               case ActionType.LINKTUBE:
                  return this.GetStep() + "Connect <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> to <font color= \'#000000\'>" + q.b + "<font color= \'#666666\'> with Glass tube.";
               case ActionType.PUT:
                  return this.GetStep() + "Place <font color= \'#000000\'>" + q.b + "<font color= \'#666666\'> to <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>.";
               case ActionType.CLEARSUB:
                  return this.GetStep() + "Remove all substances in <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>.";
               case ActionType.TESTPH:
                  return this.GetStep() + "Test the pH value in <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>.";
               case ActionType.STIR:
                  return this.GetStep() + "Mix the substances in <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>.";
               case ActionType.BURN:
                  return this.GetStep() + "Burn the substances in <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>.";
               case ActionType.FREEZE:
                  return this.GetStep() + "Freeze the substances in <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>.";
               case ActionType.TESTDT:
                  return this.GetStep() + "Test the temperature in <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>.";
               case ActionType.CLEAN:
                  return this.GetStep() + "Clear explosion debris.";
               case ActionType.DELETE:
                  return this.GetStep() + "Remove <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> from table.";
               case ActionType.EXPLODE:
                  return "<font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>" + " explodes.";
               case ActionType.SUCK:
                  return this.GetStep() + "Draw up substances from <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>" + " with\t Pipette.";
               case ActionType.LEAK:
                  return this.GetStep() + "Dispense substances to <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>" + " from Pipette.";
               case ActionType.POUR:
                  return this.GetStep() + "Pour substances from <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'> to <font color= \'#000000\'>" + q.b + "<font color= \'#666666\'>.";
               case ActionType.REACTION:
                  return "Reaction in <font color= \'#000000\'>" + q.b + ": " + q.a + "<font color= \'#666666\'>.";
               case ActionType.IGNITE:
                  return this.GetStep() + "Light up <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>.";
               case ActionType.DISIGNITE:
                  return this.GetStep() + "Put off <font color= \'#000000\'>" + q.a + "<font color= \'#666666\'>.";
               case ActionType.ADDSUB:
                  if(q.c == 1)
                  {
                     t = "(s)";
                  }
                  if(q.c == 2)
                  {
                     t = "(l)";
                  }
                  if(q.c == 3)
                  {
                     t = "(g)";
                  }
                  if(q.c == "")
                  {
                     t = "";
                  }
                  return this.GetStep() + "Add <font color= \'#000000\'>" + q.a + " " + q.b + t + "<font color= \'#666666\'> to <font color= \'#000000\'>" + q.d + "<font color= \'#666666\'>.";
               case ActionType.SETLAB:
                  if(q.b == "1")
                  {
                     t2 = "Pure Oxygen";
                  }
                  if(q.b == "2")
                  {
                     t2 = "Protective Gas";
                  }
                  if(q.b == "3")
                  {
                     t2 = "Basic Air";
                  }
                  if(q.b == "4")
                  {
                     t2 = "Natural Air";
                  }
                  if(q.b == "5")
                  {
                     t2 = "Hydrogen";
                  }
                  if(q.b == "6")
                  {
                     t2 = "Chlorine";
                  }
                  if(q.b == "7")
                  {
                     t2 = "Carbon dioxide";
                  }
                  return this.GetStep() + "Set lab to " + q.a + "℃ " + t2 + " and " + q.c + "x speed.";
            }
         }
      }
   }
}

