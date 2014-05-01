Setmemorymax(384)
SetMTMode(6,#CPUS * 2)
potplayer_source()
SetMTMode(2)
InterFrame(Preset="Fast", Tuning="Animation", GPU=true, Cores=#CPUS)
SetMTMode(1)
GetMTMode(false) > 0 ? distributor() : last
