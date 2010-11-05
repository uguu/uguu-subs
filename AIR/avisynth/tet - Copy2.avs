LoadPlugin("C:\Users\miles.wu\Desktop\avi\filters\ffms2.dll")
FFAudioSource("C:\Users\miles.wu\Desktop\avi\aud\Vol3-2.wav")
AudioDubEx(BlankClip(length=Int(29.97*AudioLengthF(last)/Audiorate(last)), width=32, height=32, pixel_type="RGB24", fps=29.97),last)
#Trim(0, 43457)
Trim(130530, 173113)
#Trim(174066, 217510)

#174000


