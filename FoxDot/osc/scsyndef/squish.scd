SynthDef.new(\squish,
{|amp=1, sus=1, pan=0, freq=0, vib=0, fmod=0, rate=0, bus=0, blur=1, beat_dur=1|
var osc, env;
sus = sus * blur;
freq = In.kr(bus, 1);
freq = [freq, freq+fmod];
freq=(freq / 4);
osc=Ringz.ar(Pulse.ar((4 * rate)), freq, sus, amp);
osc=(osc * XLine.ar(0.5, 1e-06, sus, doneAction: 2));
osc=osc.cos;
amp=(amp * 4);
osc = Mix(osc) * 0.5;
osc = Pan2.ar(osc, pan);
	ReplaceOut.ar(bus, osc)}).add;
