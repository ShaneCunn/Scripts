$folder = "D:\Test\"
$subfolders = "Volvo","Skoda","Tesla"
$fileToBeCopied = "D:\Test\testdoc.doc"
$file = Import-Csv 'D:\Test\Test.csv' -Delimiter ';' 
$file | 
 % { 
        $path = Join-Path $folder $_.Letter; 
        New-Item -Path $path -Name $_.Name -Type Directory 
        
}
foreach ($subfolder in $subfolders)
{ 
$file | %{
 $path2 = Join-Path $folder $_.Letter;
 $path3 = Join-Path $path2 $_.Name;
 New-Item -Path $path3\$subfolder -Type Directory 
 Copy-Item $fileToBeCopied -Destination  $path3
   }
}