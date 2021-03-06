import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

public class fileio
{
    public static function doFileIO():void
    {
        var file:File = File.applicationStorageDirectory.resolvePath("fileio.txt");
        var stream:FileStream = new FileStream();
        stream.open(file, FileMode.WRITE);
        stream.writeUTFBytes("hello");
        stream.writeUTFBytes("\nworld");
        stream.close();

        stream.open(file, FileMode.READ);
        var content:String = stream.readUTFBytes(stream.bytesAvailable);
        stream.close();
        var input:String = content.split("\n")[1];
        trace(input);
    }
}

-- AIR applications cannot write into their directory due to security reasons, so it uses application storage directory.
