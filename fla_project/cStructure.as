package
{
   public class cStructure
   {
      
      public var cName:String = new String();
      
      public var cNumber:Number = new Number();
      
      public var cType:String = new String();
      
      public var cLife:Boolean = true;
      
      public var cKind:String;
      
      public function cStructure(inType:*, inDm:*)
      {
         super();
         this.cType = inType;
      }
      
      public function cExist() : *
      {
      }
   }
}

