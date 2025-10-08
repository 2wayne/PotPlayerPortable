${SegmentFile}

${SegmentInit}
	${If} $Bits = 64
		${SetEnvironmentVariablesPath} FullAppDir "$EXEDIR\App\PotPlayer"
		Rename "$EXEDIR\App\PotPlayer32\Language" "$EXEDIR\App\PotPlayer\Language"
		Rename "$EXEDIR\App\PotPlayer32\IconPack" "$EXEDIR\App\PotPlayer\IconPack"
	${Else}
		${SetEnvironmentVariablesPath} FullAppDir "$EXEDIR\App\PotPlayer32"
		Rename "$EXEDIR\App\PotPlayer\Language" "$EXEDIR\App\PotPlayer32\Language"
		Rename "$EXEDIR\App\PotPlayer\IconPack" "$EXEDIR\App\PotPlayer32\IconPack"
	${EndIf}
!macroend
