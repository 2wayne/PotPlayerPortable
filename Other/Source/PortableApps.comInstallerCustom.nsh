!macro CustomCodePostInstall
	${IfNot} ${FileExists} "$INSTDIR\Data\PotPlayer.ini"
    CreateDirectory "$INSTDIR\Data"
    CopyFiles /SILENT "$INSTDIR\App\DefaultData\PotPlayer.ini" "$INSTDIR\Data"
	${EndIf} 
!macroend