package components
{
   import flash.display.*;
   import flash.text.TextField;
   
   public class xTextField extends MovieClip
   {
      
      public var txt:TextField;
      
      private var _mask:Shape = new Shape();
      
      public function xTextField()
      {
         super();
      }
      
      public function set text(txt:String) : void
      {
         this.txt.text = txt;
      }
      
      public function get text() : String
      {
         return this.txt.text;
      }
      
      public function Init() : void
      {
         this.DrawMask();
         this.PostEvent();
      }
      
      private function DrawMask() : void
      {
         this._mask.graphics.beginFill(0,1);
         this._mask.graphics.drawRect(0,0,width,height);
         this.txt.mask = this._mask;
         addChild(this._mask);
      }
      
      private function PostEvent() : void
      {
         if(this.txt.textHeight > this.txt.height)
         {
         }
      }
   }
}

