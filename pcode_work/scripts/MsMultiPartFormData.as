package
{
   import flash.text.*;
   import flash.utils.*;
   
   public class MsMultiPartFormData
   {
      
      public var Boundary:String = "---------------------------7db1851cd1158";
      
      private var fieldName:String = "Content-Disposition: form-data; name=\"XXXX\"";
      
      private var fieldValue:String = "XXXX";
      
      private var fileField:String = "Content-Disposition: form-data; name=\"XXXX\"; filename=\"XXXXXXXX\"";
      
      private var fileContentType:String = "Content-Type: XXXX";
      
      private var formData:ByteArray;
      
      public function MsMultiPartFormData()
      {
         super();
         this.formData = new ByteArray();
      }
      
      public function AddFormField(FieldName:String, FieldValue:String) : void
      {
         var newFieldName:String = this.fieldName;
         var newFieldValue:String = this.fieldValue;
         newFieldName = newFieldName.replace("XXXX",FieldName);
         newFieldValue = newFieldValue.replace("XXXX",FieldValue);
         this.formData.writeMultiByte("--" + this.Boundary + "\r\n","UTF-8");
         this.formData.writeMultiByte(newFieldName + "\r\n\r\n","UTF-8");
         this.formData.writeMultiByte(newFieldValue + "\r\n","UTF-8");
      }
      
      public function AddFile(FieldName:String, FileName:String, FileContent:ByteArray, ContentType:String) : void
      {
         var newFileField:String = this.fileField;
         var newFileContentType:String = this.fileContentType;
         newFileField = newFileField.replace("XXXX",FieldName);
         newFileField = newFileField.replace("XXXXXXXX",FileName);
         newFileContentType = newFileContentType.replace("XXXX",ContentType);
         this.formData.writeMultiByte("--" + this.Boundary + "\r\n","UTF-8");
         this.formData.writeMultiByte(newFileField + "\r\n","UTF-8");
         this.formData.writeMultiByte(newFileContentType + "\r\n\r\n","UTF-8");
         this.formData.writeBytes(FileContent,0,FileContent.length);
         this.formData.writeMultiByte("\r\n","UTF-8");
      }
      
      public function AddStreamFile(FieldName:String, FileName:String, FileContent:ByteArray) : void
      {
         this.AddFile(FieldName,FileName,FileContent,"application/octet-stream");
      }
      
      public function PrepareFormData() : void
      {
         this.formData.writeMultiByte("--" + this.Boundary + "--","UTF-8");
      }
      
      public function GetFormData() : ByteArray
      {
         return this.formData;
      }
   }
}

