SetMTMode(6,#CPUS * 2)
potplayer_source()
SetMTMode(2)
LoadPlugin("#PROGRAMDIR\AviSynth 2.5\plugins\InterFrame-2.5.0\Dependencies\svpflow1.dll")
LoadPlugin("#PROGRAMDIR\AviSynth 2.5\plugins\InterFrame-2.5.0\Dependencies\svpflow2.dll")
Import("#PROGRAMDIR\AviSynth 2.5\plugins\InterFrame-2.5.0\InterFrame2.avsi")
InterFrame(Preset="Medium", Tuning="Animation", GPU=false, Cores=#CPUS)
SetMTMode(1)
GetMTMode(false) > 0 ? distributor() : last
