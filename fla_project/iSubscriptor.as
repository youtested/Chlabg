package
{
   public class iSubscriptor
   {
      
      public function iSubscriptor()
      {
         super();
      }
      
      public static function iSub(st:String) : String
      {
         var t:String = st;
         t = strReplace(t,"1","₁");
         t = strReplace(t,"2","₂");
         t = strReplace(t,"3","₃");
         t = strReplace(t,"4","₄");
         t = strReplace(t,"5","₅");
         t = strReplace(t,"6","₆");
         t = strReplace(t,"7","₇");
         t = strReplace(t,"8","₈");
         t = strReplace(t,"9","₉");
         return strReplace(t,"0","₀");
      }
      
      private static function strReplace(str:String, search:String, replace:String) : String
      {
         return str.split(search).join(replace);
      }
   }
}

