## Thunar custom actions
### Open terminal here
```
<action>
    <icon>utilities-terminal</icon>
    <name>Open Terminal Here</name>
    <unique-id>1521317528494802-1</unique-id>
    <command>exo-open --launch TerminalEmulator %d</command>
    <description>Open terminal here</description>
    <patterns>*</patterns>
    <directories/>
</action>
```
### Thunar as root
Requires `gvfs`
```
<action>
    <icon>nix-root-console</icon>
    <name>Open Thunar as ROOT</name>
    <unique-id>1521317741628820-3</unique-id>
    <command>thunar admin:%D</command>
    <description>Opening Thunar as ROOT</description>
    <patterns>*</patterns>
    <directories/>
</action>
```
### Edit file as root
Requires `gvfs`
```
<action>
    <icon>nix-root-edit</icon>
    <name>Edit file as ROOT</name>
    <unique-id>1538658921535571-1</unique-id>
    <command>xed admin:%f</command>
    <description>Edit file as ROOT</description>
    <patterns>*</patterns>
    <startup-notify/>
    <text-files/>
</action>
```
### Write ISO to USB
Requires `mintstick`
```
<action>
    <icon>media-flash</icon>
    <name>Write to USB</name>
    <unique-id>1570439344294225-1</unique-id>
    <command>mintstick -m iso -i %f</command>
    <description>Write selected ISO to USB</description>
    <patterns>*.iso</patterns>
    <other-files/>
</action>
```
### Download subtitles for movie
Requires `zenity` and `periscope-git` (AUR)
```
<action>
    <icon>emblem-web</icon>
    <name>Fetch subtitles</name>
    <unique-id>1581765909225351-1</unique-id>
    <command>periscope -l en %F &amp;&amp; zenity --info --title &quot;Done&quot; --text &quot;Subtitles downloaded successfully&quot; || zenity --error --title &quot;Error&quot; --text &quot;Subtitles not downloaded successfully&quot;</command>
    <description>Download subtibles for movie</description>
    <patterns>*</patterns>
    <video-files/>
</action>
```
### Secure delete
Requires `findtuils`, `coreutils`, `xdialog`
```
<action>
    <icon>nix-shred</icon>
    <name>Secure Delete</name>
    <unique-id>1451484670887515-4</unique-id>
    <command>srm_guified.sh %f</command>
    <description>Securely Wipe Files Before Deletion</description>
    <patterns>*</patterns>
    <directories/>
    <audio-files/>
    <image-files/>
    <other-files/>
    <text-files/>
    <video-files/>
</action>
```