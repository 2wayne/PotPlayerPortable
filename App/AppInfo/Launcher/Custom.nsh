${SegmentFile}

${SegmentInit}
	${IfNot} ${AtLeastWinVista}
		Rename "$EXEDIR\App\PotPlayer\PotPlayerMini.exe" "$EXEDIR\App\PotPlayer\PotPlayerMiniVista.exe"
		Rename "$EXEDIR\App\PotPlayer\PotPlayerMiniXP.exe" "$EXEDIR\App\PotPlayer\PotPlayerMini.exe"
	${EndIf}
!macroend

${SegmentPost}
	${IfNot} ${AtLeastWinVista}
		Rename "$EXEDIR\App\PotPlayer\PotPlayerMini.exe" "$EXEDIR\App\PotPlayer\PotPlayerMiniXP.exe"
		Rename "$EXEDIR\App\PotPlayer\PotPlayerMiniVista.exe" "$EXEDIR\App\PotPlayer\PotPlayerMini.exe"
	${EndIf}
!macroend