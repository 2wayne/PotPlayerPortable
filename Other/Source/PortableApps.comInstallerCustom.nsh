!macro CustomCodePostInstall
	${If} ${FileExists} "$INSTDIR\Data\PotPlayer.ini"
	Rename "$INSTDIR\Data\PotPlayer.ini" "$INSTDIR\Data\PotPlayerMini.ini"
	${EndIf}
	${IfNot} ${FileExists} "$INSTDIR\Data\PotPlayerMini.ini"
    CreateDirectory "$INSTDIR\Data"
    CopyFiles /SILENT "$INSTDIR\App\DefaultData\PotPlayerMini.ini" "$INSTDIR\Data"
	${EndIf}
!macroend