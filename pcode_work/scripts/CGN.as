package
{
   public class CGN
   {
      
      private static const size:Number = 17;
      
      private static const subsize:Number = 13;
      
      public function CGN()
      {
         super();
      }
      
      public static function Ch(t:String) : String
      {
         var nt:String = "<font size=\'40\'>";
         var pi:Number = 0;
         var isn:Boolean = false;
         for(var i:int = 0; i < t.length; i++)
         {
            if(!isNaN(t.charAt(i)) && !isn)
            {
               nt += t.slice(pi,i);
               pi = i;
               isn = true;
               nt += "<font size=\'23\'>";
            }
            else if(Boolean(isNaN(t.charAt(i))) && isn)
            {
               nt += t.slice(pi,i);
               pi = i;
               isn = false;
               nt += "<font size=\'40\'>";
            }
         }
         nt += t.slice(pi,i);
         return nt + "</font>";
      }
      
      public static function Ch2(t:String, small:Number = 0) : String
      {
         var nt:String = "<font size=\'" + String(size + small) + "\'>";
         var pi:Number = 0;
         var isn:Boolean = false;
         for(var i:int = 0; i < t.length; i++)
         {
            if(!isNaN(t.charAt(i)) && !isn)
            {
               nt += t.slice(pi,i);
               pi = i;
               isn = true;
               nt += "<font size=\'" + String(subsize + small) + "\'>";
            }
            else if(Boolean(isNaN(t.charAt(i))) && isn)
            {
               nt += t.slice(pi,i);
               pi = i;
               isn = false;
               nt += "<font size=\'" + String(size + small) + "\'>";
            }
         }
         nt += t.slice(pi,i);
         return nt + "</font>";
      }
      
      public static function Cn(t:Number) : String
      {
         if(t == 1)
         {
            return "";
         }
         return "<font size=\'40\'>" + String(t);
      }
   }
}

