package com.distriqt.extension.inappbilling
{
   import com.distriqt.extension.inappbilling.purchases.Downloads;
   import flash.events.EventDispatcher;
   import flash.external.ExtensionContext;
   
   internal final class DownloadsImpl extends EventDispatcher implements Downloads
   {
      
      private var _extContext:ExtensionContext;
      
      public function DownloadsImpl(param1:ExtensionContext)
      {
         super();
         _extContext = param1;
      }
      
      public function get isSupported() : Boolean
      {
         return false;
      }
      
      public function startDownloads(param1:Purchase) : Boolean
      {
         return false;
      }
      
      public function pauseDownloads() : Boolean
      {
         return false;
      }
      
      public function cleanup() : void
      {
      }
   }
}

