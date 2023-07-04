$img_txt = @'

Change this line and "alt:text" text, "title:text" text "height" and "width" below as desired

'@

$img_tag = @'

<p>
    <img src="filepath" 
         alt="alt:filename" 
         title="filename" 
         width="480" 
         height="320" />
</p>

'@

$vid_txt = @'

Change this line and "height" and "width" as desired

'@

$vid_tag = @'

<p>
    <video width="480" height="320" controls="controls">
        <source src="filepath" type="video/mp4">
    </video>
</p>

'@

$files = Get-ChildItem ..\assets\img
foreach ($file in $files) {
    $filename = $file.BaseName
    $filepath = $file.Name
    if ($file.Extension -eq ".jpg") {
        $tag = $img_tag.Replace("filepath", "/assets/img/$filepath").Replace("filename", "$filename")
        Write-Host "$img_txt $tag"
    }
    if ($file.Extension -eq ".mp4") {
        $tag = $vid_tag.Replace("filepath", "/assets/img/$filepath")
        Write-Host "$vid_txt $tag"
    }
}