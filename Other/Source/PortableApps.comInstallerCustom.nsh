!macro CustomCodePostInstall
	CopyFiles /SILENT "$INSTDIR\App\DefaultData\PotPlayer.ini" "$INSTDIR\Data"
!macroend