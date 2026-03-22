package
{
   public class cHeater
   {
      
      public var cName:String = new String();
      
      public var cNumber:Number = new Number();
      
      public var cType:String = new String();
      
      public var cLife:Boolean;
      
      public var cKind:String;
      
      public function cHeater(inType:*, inDm:*)
      {
         super();
         this.cType = inType;
         this.cLife = true;
      }
      
      public function cExist() : *
      {
      }
   }
}

