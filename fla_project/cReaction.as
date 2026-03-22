package
{
   public class cReaction
   {
      
      public var cS:Array;
      
      public var cN:Array;
      
      public var cSP:Array;
      
      public var cNP:Array;
      
      public var cReactSub:Array;
      
      public var cProductSub:Array;
      
      public var cHR:Number;
      
      public var cSpeed:Number;
      
      public var cTp:String;
      
      public var cId:String;
      
      public var cEff:String;
      
      public var cExp:Boolean = false;
      
      public var cGExp:Boolean = false;
      
      public var cDet:Boolean = false;
      
      public var cLDet:Boolean = false;
      
      public var cIgn:Boolean = false;
      
      public var cE1:Boolean = false;
      
      public var cIgnCol:Number;
      
      public var cIgnAlp:Number;
      
      public var cBB:Boolean = false;
      
      public var cEle:Boolean = false;
      
      public function cReaction(inS1:cMatter, inS2:*, inAr:Object, id:String)
      {
         var i:* = undefined;
         var cN2:* = undefined;
         this.cSP = new Array();
         this.cNP = new Array();
         super();
         var cS1:* = inS1;
         var cS2:* = inS2;
         this.cId = id;
         var cN1:* = inAr[cS1.cName];
         if(cS2 != null)
         {
            cN2 = inAr[cS2.cName];
         }
         this.cSpeed = inAr.cSpeed;
         this.cHR = inAr.cHR;
         this.cS = new Array(cS1,cS2);
         this.cN = new Array(cN1,cN2);
         if(inAr.cEff == "EXPLODE2")
         {
            this.cExp = true;
         }
         if(inAr.cEff == "EXPLODE3")
         {
            this.cGExp = true;
         }
         if(inAr.cEff == "BURN1")
         {
            this.cDet = true;
         }
         if(inAr.cEff == "E1")
         {
            this.cE1 = true;
         }
         if(inAr.cEff == "ELE")
         {
            this.cEle = true;
         }
         if(inAr.cEff == "BUBBLE")
         {
            this.cBB = true;
         }
         if(inAr.cEff == "BURN2")
         {
            this.cLDet = true;
         }
         if(inAr.cEff == "BURN3")
         {
            this.cIgn = true;
            this.cIgnCol = inAr.cIgnCol;
            this.cIgnAlp = inAr.cIgnAlp;
         }
         for(i in inAr.cP)
         {
            this.cSP.push(inAr.cP[i]);
            this.cNP.push(inAr[inAr.cP[i]]);
         }
      }
   }
}

