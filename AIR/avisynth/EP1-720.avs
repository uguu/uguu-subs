LoadPlugin("filters/MT.dll")
LoadPlugin("filters/TDeint.dll")
LoadPlugin("filters/SangNom.dll")
LoadPlugin("filters/mt_masktools-25.dll")
LoadPlugin("filters/deen.dll")
LoadPlugin("filters/aWarpSharp.dll")
LoadPlugin("filters/Toon-v1.0-lite.dll")
LoadPlugin("filters/VagueDenoiser.dll")
LoadPlugin("filters/gradfun2db.dll")

Import("AAA.avs")

#Import("SharpTools-v0.3.avs")
#Import("LimitedSharpenFaster.avs")

SetMTMode(5,2)

DirectShowSource("C:\Users\miles.wu\Desktop\00003.m2ts")
Trim(0, 43457)

SetMemoryMax(700)
#DirectShowSource("C:\Users\miles.wu\Desktop\00003.m2ts", audio=false)
deint = TDeint(mode=2, mtnmode=3, blim=100)
TFM(cthresh=4, slow=2, clip2=deint)
TDecimate(mode=1) 
AssumeFPS(24000,1001)
#Trim(0, 8640)
SetMTMode(2)

#AAA()
MT("AAA()", 4, 20)

#VagueDenoiser(threshold=2, method=3, nsteps=6, chromaT=2.0)
#Deen(mode="a2d", rad=4, thrY=7, thrUV=5, min=0.2) 
Deen(mode="a2d", rad=4, thrY=5, thrUV=4, min=0.15) 
#gradfun2db()
#SSXSharpen(ssw=4, ssh=4, xstren=255, xthresh=255)

#LimitedSharpenFaster(strength=300)
aWarpSharp2(depth=12, type=0)
#aWarpSharp2(depth=22, type=0)
#VMToon(strength=48, luma_cap=191, threshold=4, thinning=48, sharpen=true, mask=true, ssw=6, ssh=6, xstren=255, xthresh=255) 
ToonLite(strength=0.85)

#AAA()
MT("AAA()", 4, 20)
LanczosResize(1280, 720)










