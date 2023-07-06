$header = @'
---
layout: post
title:  "AirBnB Austin Listing by Susana"
date:   2023-07-04 16:00:00 -0500
categories: airbnb review
---

<style type="text/css">
    img, video {
        width: 480px;
        max-width: 480px;
    }
</style>

This is a review of the [listing #886912477107293975](https://www.airbnb.com/rooms/886912477107293975/) ([archive](https://archive.today/6tREd)) in Austin by Susana.

'@

$img_txt = @'

Change this line and "alt:text" text, "title:text" text "height" and "width" below as desired

'@

$img_tag = @'

<p>
    <a href="filepath">
        <img src="filepath" alt="alt:filename" title="filename"/>
    </a>
</p>

'@

$vid_txt = @'

Change this line and "height" and "width" as desired

'@

$vid_tag = @'

<p>
    <video controls="controls">
        <source src="filepath" type="video/mp4">
    </video>
</p>

'@

$markdown = $header
$files = (Get-ChildItem "..\assets\img") + (Get-ChildItem "..\assets\mov") | Sort-Object -Property "Name"
foreach ($file in $files) {
    $filename = $file.BaseName
    $filepath = $file.Name
    if ($file.Extension -eq ".jpg") {
        $tag = $img_tag.Replace("filepath", "/assets/img/$filepath").Replace("filename", "$filename")
        $markdown += "$img_txt `n $tag `n"
    }
    if ($file.Extension -eq ".mp4") {
        $tag = $vid_tag.Replace("filepath", "/assets/mov/$filepath")
        $markdown += "$vid_txt `n $tag `n"
    }
}

Out-File -FilePath "..\_posts\2023-06-29-airbnb-austin-by-susana.markdown" -InputObject $markdown -Encoding ASCII
