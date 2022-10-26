#SingleInstance Force
#NoEnv
SetBatchLines -1
SetWorkingDir %A_ScriptDir%

SetDevice(outp, inp) {
    RUN .\nircmd.exe setdefaultsounddevice "%outp%"
    RUN .\nircmd.exe setdefaultsounddevice "%outp%" 2
    RUN .\nircmd.exe setdefaultsounddevice "%inp%"
    RUN .\nircmd.exe setdefaultsounddevice "%inp%" 2
}

ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

IniRead, DesktopOut, config.ini, Desktop, Output
IniRead, DesktopIn, config.ini, Desktop, Input

IniRead, VROut, config.ini, VR, Output
IniRead, VRIn, config.ini, VR, Input

SetDevice(VROut, VRIn)
While (ProcessExist("vrmonitor.exe")) {
    Sleep, 5000
}
SetDevice(DesktopOut, DesktopIn)
