package
{
   import flash.system.*;
   
   public class iLoc
   {
      
      public static var LG:String = "en";
      
      public static var LG2:String = "en";
      
      public function iLoc()
      {
         super();
         var t:String = Capabilities.language.toLowerCase();
         trace(t);
         LG2 = t;
         switch(t)
         {
            case "en_us":
               LG = "en";
               break;
            case "zh-cn":
               LG = "zh";
               break;
            case "zh-tw":
               LG = "tw";
               break;
            case "zh-hk":
               LG = "tw";
               break;
            case "zh-hans":
               LG = "zh";
               break;
            case "zh-hant":
               LG = "tw";
               break;
            case "ja-jp":
               LG = "jp";
               break;
            case "ja":
               LG = "jp";
               break;
            case "ko-kr":
               LG = "ko";
               break;
            case "ko":
               LG = "ko";
               break;
            case "nl-nl":
               LG = "du";
               break;
            case "nl":
               LG = "du";
               break;
            case "ru-ru":
               LG = "ru";
               break;
            case "ru":
               LG = "ru";
               break;
            case "fr-fr":
               LG = "fr";
               break;
            case "fr":
               LG = "fr";
               break;
            case "fr-ca":
               LG = "fr";
               break;
            case "it-it":
               LG = "it";
               break;
            case "it":
               LG = "it";
               break;
            case "no-no":
               LG = "no";
               break;
            case "es-es":
               LG = "sp";
               break;
            case "es-us":
               LG = "sp";
               break;
            case "es-419":
               LG = "sp";
               break;
            case "es":
               LG = "sp";
               break;
            case "pt":
               LG = "po";
               break;
            case "pt-br":
               LG = "po";
               break;
            case "es-mx":
               LG = "sp";
               break;
            case "de":
               LG = "ge";
               break;
            case "de-de":
               LG = "ge";
               break;
            case "pt-pt":
               LG = "po";
               break;
            case "th-th":
               LG = "th";
               break;
            case "th":
               LG = "th";
               break;
            case "sv-fi":
               LG = "sw";
               break;
            case "sv-se":
               LG = "sw";
               break;
            case "sv":
               LG = "sw";
         }
      }
   }
}

