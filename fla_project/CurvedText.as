package
{
   import flash.display.*;
   import flash.geom.Rectangle;
   import flash.text.*;
   
   public class CurvedText extends MovieClip
   {
      
      public static const DIRECTION_UP:String = "up";
      
      public static const DIRECTION_DOWN:String = "down";
      
      public var showLetterBorder:Boolean = false;
      
      public var showCurve:Boolean = false;
      
      private var _letterHolder:MovieClip;
      
      private var _text:String;
      
      private var _radius:Number;
      
      private var _letters:Array;
      
      private var _widthOfText:Number = 0;
      
      private var _startAngle:Number = 0;
      
      private var _endAngle:Number = 360;
      
      private var _totalAngle:Number = 0;
      
      private var _textFormat:TextFormat;
      
      private var _direction:String;
      
      public function CurvedText(text:String, radius:Number = 200, startAngle:Number = 0, endAngle:Number = 360, direction:String = "up", textFormat:TextFormat = null)
      {
         super();
         this._text = text;
         this._radius = radius;
         this._startAngle = startAngle;
         this._endAngle = endAngle;
         this._direction = direction;
         this._textFormat = textFormat;
         this._letters = [];
         this._totalAngle = Math.abs(this._startAngle) + Math.abs(this._endAngle);
      }
      
      public function draw() : void
      {
         var letter:Object = null;
         if(this._text == "")
         {
            return;
         }
         if(Boolean(this._letterHolder) && contains(this._letterHolder))
         {
            removeChild(this._letterHolder);
         }
         this._letterHolder = new MovieClip();
         addChild(this._letterHolder);
         var numOfLetters:int = int(this._text.length);
         for(var i:int = 0; i < numOfLetters; i++)
         {
            letter = this.getLetterObject(this._text.charAt(i));
            letter.stepDegrees = this._totalAngle / numOfLetters;
            this._letters.push(letter);
            this._widthOfText += letter.fieldWidth;
            this._letterHolder.addChild(letter.movie);
         }
         this.position();
         if(this.showCurve)
         {
            this._letterHolder.graphics.lineStyle(1,16711680,1);
            this._letterHolder.graphics.drawCircle(0,0,this._radius);
         }
      }
      
      private function getLetterObject(letter:String) : Object
      {
         if(!this._textFormat)
         {
            this._textFormat = new TextFormat();
            this._textFormat.align = TextFormatAlign.CENTER;
            this._textFormat.font = "Verdana";
            this._textFormat.size = 12;
            this._textFormat.color = 0;
         }
         var movie:MovieClip = new MovieClip();
         var field:TextField = new TextField();
         field.width = 10;
         field.defaultTextFormat = this._textFormat;
         field.embedFonts = true;
         field.multiline = false;
         field.autoSize = TextFieldAutoSize.CENTER;
         field.text = letter;
         field.x = -field.width / 2;
         field.y = -field.height / 2;
         if(this.showLetterBorder)
         {
            field.border = true;
         }
         movie.addChild(field);
         return {
            "movie":movie,
            "field":field,
            "widthInDegrees":0,
            "fieldWidth":field.width,
            "fieldHeight":field.height
         };
      }
      
      private function position() : void
      {
         var angle:Number = NaN;
         var xValue:int = 0;
         var yValue:int = 0;
         var numOfLetters:int = int(this._letters.length);
         var degrees:Number = Number(this._startAngle);
         for(var i:int = 0; i < numOfLetters; i++)
         {
            angle = this._letters[i].stepDegrees + degrees;
            if(this._direction == DIRECTION_DOWN)
            {
               angle -= 180;
               this._letters[i].movie.scaleY = -1;
            }
            else
            {
               xValue = this._radius * Math.cos((angle - 90) / 180 * Math.PI);
               yValue = this._radius * Math.sin((angle - 90) / 180 * Math.PI);
            }
            xValue = this._radius * Math.cos((angle - 90) / 180 * Math.PI);
            yValue = this._radius * Math.sin((angle - 90) / 180 * Math.PI);
            this._letters[i].movie.x = xValue;
            this._letters[i].movie.y = yValue;
            this._letters[i].movie.rotation = angle;
            degrees += this._letters[i].stepDegrees;
         }
         var bounds:Rectangle = this._letterHolder.getBounds(this);
         this._letterHolder.x = -bounds.x;
         this._letterHolder.y = -bounds.y;
         if(this._direction == DIRECTION_DOWN)
         {
            this._letterHolder.scaleX = -1;
         }
      }
   }
}

