!macro CustomCodePostInstall
	${If} ${FileExists} "$INSTDIR\Data\PotPlayerMini.ini"
	${AndIfNot} ${FileExists} "$INSTDIR\Data\PotPlayerMini64.ini"
		CopyFiles "$INSTDIR\Data\PotPlayerMini.ini" "$INSTDIR"
		Rename "$INSTDIR\PotPlayerMini.ini" "$INSTDIR\Data\PotPlayerMini64.ini"
	${EndIf}
!macroend