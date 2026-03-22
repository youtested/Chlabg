package
{
   import flash.display.MovieClip;
   import flash.events.*;
   
   public class iOut extends MovieClip
   {
      
      public var pShowLabel:MovieClip;
      
      public var iStage:*;
      
      public function iOut(inStage:*)
      {
         super();
         this.iStage = inStage;
         this.pShowLabel.addEventListener(MouseEvent.MOUSE_DOWN,this.show_Label);
         x = 916;
         y = 716;
         this.pShowLabel.alpha = 0;
      }
      
      public function show_Label(e:*) : *
      {
         this.iStage.myLab.iShowLabel = !this.iStage.myLab.iShowLabel;
         if(this.iStage.myLab.iShowLabel)
         {
            this.pShowLabel.alpha = 1;
         }
         else
         {
            this.pShowLabel.alpha = 0;
         }
      }
      
      public function show_Help(e:*) : *
      {
         this.iStage.myLab.iShowHelp = !this.iStage.myLab.iShowHelp;
      }
      
      public function show_Device(e:*) : *
      {
         this.iStage.myLab.iShowDevice = !this.iStage.myLab.iShowDevice;
      }
   }
}

