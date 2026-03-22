package
{
   import com.shortybmc.utils.*;
   import flash.events.*;
   import flash.net.*;
   
   public class CSV extends URLLoader
   {
      
      private var FieldSeperator:String;
      
      private var FieldEnclosureToken:String;
      
      private var RecordsetDelimiter:String;
      
      private var Header:Array;
      
      private var EmbededHeader:Boolean;
      
      private var HeaderOverwrite:Boolean;
      
      private var SortField:*;
      
      private var SortSequence:String;
      
      public function CSV(request:URLRequest = null)
      {
         super();
         this.fieldSeperator = ",";
         this.fieldEnclosureToken = "\"";
         this.recordsetDelimiter = "\r";
         this.header = new Array();
         this.embededHeader = true;
         this.headerOverwrite = false;
         if(request)
         {
            load(request);
         }
         this.dataFormat = URLLoaderDataFormat.TEXT;
         addEventListener(Event.COMPLETE,this.decode);
      }
      
      public function get fieldSeperator() : String
      {
         return this.FieldSeperator;
      }
      
      public function get fieldEnclosureToken() : String
      {
         return this.FieldEnclosureToken;
      }
      
      public function get recordsetDelimiter() : String
      {
         return this.RecordsetDelimiter;
      }
      
      public function get embededHeader() : Boolean
      {
         return this.EmbededHeader;
      }
      
      public function get headerOverwrite() : Boolean
      {
         return this.HeaderOverwrite;
      }
      
      public function get header() : Array
      {
         return this.Header;
      }
      
      public function get headerHasValues() : Boolean
      {
         var check:Boolean = false;
         try
         {
            if(this.Header.length > 0)
            {
               check = true;
            }
         }
         catch(e:Error)
         {
            check = false;
         }
         finally
         {
            return check;
         }
      }
      
      public function get dataHasValues() : Boolean
      {
         var check:Boolean = false;
         try
         {
            if(data.length > 0)
            {
               check = true;
            }
         }
         catch(e:Error)
         {
            check = false;
         }
         finally
         {
            return check;
         }
      }
      
      public function set fieldSeperator(value:String) : void
      {
         this.FieldSeperator = value;
      }
      
      public function set fieldEnclosureToken(value:String) : void
      {
         this.FieldEnclosureToken = value;
      }
      
      public function set recordsetDelimiter(value:String) : void
      {
         this.RecordsetDelimiter = value;
      }
      
      public function set embededHeader(value:Boolean) : void
      {
         this.EmbededHeader = value;
      }
      
      public function set headerOverwrite(value:Boolean) : void
      {
         this.HeaderOverwrite = value;
      }
      
      public function set header(value:Array) : void
      {
         if(!this.embededHeader && !this.headerHasValues || !this.embededHeader && this.headerHasValues && this.headerOverwrite || this.headerOverwrite)
         {
            this.Header = value;
         }
      }
      
      public function getRecordSet(index:int) : Array
      {
         if(this.dataHasValues)
         {
            return data[index];
         }
         return null;
      }
      
      public function addRecordSet(recordset:Array, index:* = null) : void
      {
         if(!this.dataHasValues)
         {
            data = new Array();
         }
         if(!index && index != 0)
         {
            data.push(recordset);
         }
         else
         {
            data.splice(index,0,recordset);
         }
      }
      
      public function deleteRecordSet(startIndex:int, endIndex:int = 1) : Boolean
      {
         if(this.dataHasValues && startIndex < data.length && endIndex > 0)
         {
            return data.splice(startIndex,endIndex);
         }
         return false;
      }
      
      public function search(needle:*, removeDuplicates:Boolean = true) : Array
      {
         var i:Array = null;
         var j:String = null;
         var k:* = 0;
         var l:int = 0;
         var result:Array = new Array();
         for each(i in data)
         {
            if(needle is Array)
            {
               for each(j in needle)
               {
                  if(i.indexOf(String(j)) >= 0)
                  {
                     result.push(i);
                  }
               }
            }
            else if(i.indexOf(String(needle)) >= 0)
            {
               result.push(i);
            }
         }
         if(removeDuplicates && result.length > 2)
         {
            k = int(result.length - 1);
         }
         while(k--)
         {
            l = int(result.length);
            while(--l > k)
            {
               if(result[k] == result[l])
               {
                  result.splice(l,1);
               }
            }
         }
         return result;
      }
      
      public function sort(fieldNameOrIndex:* = 0, sequence:String = "ASC") : void
      {
         this.SortSequence = sequence;
         if(this.headerHasValues && this.header.indexOf(fieldNameOrIndex) >= 0)
         {
            this.SortField = this.header.indexOf(fieldNameOrIndex);
         }
         else
         {
            this.SortField = fieldNameOrIndex;
         }
         if(this.dataHasValues)
         {
            data.sort(this.sort2DArray);
         }
      }
      
      public function decode(event:Event = null) : void
      {
         var count:uint = 0;
         var result:Array = new Array();
         data = data.toString().split(this.recordsetDelimiter);
         for(var i:uint = 0; i < data.length; i++)
         {
            if(!Boolean(count % 2))
            {
               result.push(data[i]);
            }
            else
            {
               result[result.length - 1] += data[i];
            }
            count += StringUtils.count(data[i],this.fieldEnclosureToken);
         }
         result = result.filter(this.isNotEmptyRecord);
         result.forEach(this.fieldDetection);
         if(this.embededHeader && this.headerOverwrite)
         {
            result.shift();
         }
         else if(this.embededHeader && this.headerHasValues)
         {
            result.shift();
         }
         else if(this.embededHeader)
         {
            this.Header = result.shift();
         }
         data = result;
      }
      
      public function encode() : void
      {
         var recordset:Array = null;
         var result:String = "";
         if(this.headerHasValues && this.header.length > 0)
         {
            this.embededHeader = true;
            data.unshift(this.header);
         }
         if(this.dataHasValues)
         {
            for each(recordset in data)
            {
               result += recordset.join(this.fieldSeperator) + this.recordsetDelimiter;
            }
         }
         data = result;
      }
      
      private function fieldDetection(element:*, index:int, arr:Array) : void
      {
         var count:uint = 0;
         var result:Array = new Array();
         var tmp:Array = element.split(this.fieldSeperator);
         for(var i:uint = 0; i < tmp.length; i++)
         {
            if(!Boolean(count % 2))
            {
               result.push(StringUtils.trim(tmp[i]));
            }
            else
            {
               result[result.length - 1] += this.fieldSeperator + tmp[i];
            }
            count += StringUtils.count(tmp[i],this.fieldEnclosureToken);
         }
         arr[index] = result;
      }
      
      private function sort2DArray(a:Array, b:Array) : Number
      {
         var n:int = 0;
         var r:int = this.SortSequence == "ASC" ? -1 : 1;
         if(String(a[this.SortField]) < String(b[this.SortField]))
         {
            n = r;
         }
         else if(String(a[this.SortField]) > String(b[this.SortField]))
         {
            n = -r;
         }
         else
         {
            n = 0;
         }
         return n;
      }
      
      private function isNotEmptyRecord(element:*, index:int, arr:Array) : Boolean
      {
         return Boolean(StringUtils.trim(element));
      }
      
      public function dump() : String
      {
         var j:uint = 0;
         var result:String = "data:Array -> [\r";
         for(var i:int = 0; i < data.length; i++)
         {
            result += "\t[" + i + "]:Array -> [\r";
            j = 0;
            while(j < data[i].length)
            {
               result += "\t\t[" + j + "]:String -> " + data[i][j] + "\r";
               j++;
            }
            result += "\t]\r";
         }
         return result + "]\r";
      }
   }
}

