DEGREE = "\xC2\xB0"

def dms(deg)
  degrees, minutes = deg.divmod(1)
  minutes *= 60
  seconds = (minutes - minutes.to_i) * 60
  degrees.to_s + DEGREE + format('%02d', minutes) + "'" +
    format('%02d', seconds) + '"'
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
