LoadPlugin("filters/MT.dll")
LoadPlugin("filters/TDeint.dll")
LoadPlugin("filters/SangNom.dll")
LoadPlugin("filters/mt_masktools-25.dll")
LoadPlugin("filters/deen.dll")
LoadPlugin("filters/aWarpSharp.dll")
LoadPlugin("filters/Toon-v1.0-lite.dll")

Import("AAA.avs")
#Import("SharpTools-v0.3.avs")
#Import("LimitedSharpenFaster.avs")

#SetMTMode(5,3)

DirectShowSource("C:\Users\miles.wu\Desktop\Disc2.m2ts")
Trim(43516, 86970)

SetMemoryMax(1000)
#DirectShowSource("C:\Users\miles.wu\Desktop\00003.m2ts", audio=false)
#TDeint(mode=2, mtnmode=3, blim=100)
deint = TDeint(mode=2, mtnmode=3, blim=100)
#TFM(cthresh=4, slow=2, output="matches.txt")
TFM(cthresh=4, slow=2, clip2=deint, input="matches.txt")
#TDecimate(mode=1) 
#AssumeFPS(24000,1001)

#TDecimate(mode=4, output="metrics.txt")
TDecimate(mode=5, hybrid=2, vfrDec=1, input="metrics.txt", tfmIn="matches.txt", mkvOut="mkv-timecodesfile2.txt")

#SetMTMode(2)
AssumeFPS(30000,1001)

#AAA()
MT("AAA()", 3, 20)

Deen(mode="a2d", rad=4, thrY=5, thrUV=4, min=0.15) 
#Deen(mode="a2d", rad=5, thrY=7, thrUV=9, min=0.5) 
#SSXSharpen(ssw=4, ssh=4, xstren=255, xthresh=255)

#LimitedSharpenFaster(strength=300)
aWarpSharp2(depth=12, type=0)
#aWarpSharp2(depth=22, type=0)
#VMToon(strength=48, luma_cap=191, threshold=4, thinning=48, sharpen=true, mask=true, ssw=6, ssh=6, xstren=255, xthresh=255) 
ToonLite(strength=0.85)

#AAA()
MT("AAA()", 3, 20)
#LanczosResize(12, 12)








