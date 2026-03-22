package
{
   public class iReportQuery
   {
      
      public var iAction:String;
      
      public var a:*;
      
      public var b:*;
      
      public var c:*;
      
      public var d:*;
      
      public function iReportQuery(action:String, A:* = null, B:* = null, C:* = null, D:* = null)
      {
         super();
         this.iAction = action;
         if(A != null)
         {
            this.a = A;
         }
         if(B != null)
         {
            this.b = B;
         }
         if(C != null)
         {
            this.c = C;
         }
         if(D != null)
         {
            this.d = D;
         }
      }
   }
}

