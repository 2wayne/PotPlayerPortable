${SegmentFile}

${Segment.OnInit}
	; Borrowed the following from PAL 2.2, Remove on release of PAL 2.2
		; Work out if it's 64-bit or 32-bit
	System::Call kernel32::GetCurrentProcess()i.s
	System::Call kernel32::IsWow64Process(is,*i.r0)
	${If} $0 == 0
		StrCpy $Bits 32
	${Else}
		StrCpy $Bits 64
	${EndIf}
!macroend

${SegmentInit}
	${If} $Bits = 64
		${SetEnvironmentVariablesPath} FullAppDir $EXEDIR\App\PotPlayer64
				Rename "$EXEDIR\Data\PotPlayer.ini" "$EXEDIR\Data\PotPlayer64.ini"
	${Else}
		${SetEnvironmentVariablesPath} FullAppDir $EXEDIR\App\PotPlayer
	${EndIf}
!macroend

${SegmentPost}
        ${If} $Bits == 64
                Rename "$EXEDIR\Data\PotPlayer64.ini" "$EXEDIR\Data\PotPlayer.ini"
        ${EndIf}
!macroend