import foundation
import app_kit / [nsscreen, nsview, nsevent, nscursor, nspasteboard, nswindow,
    nsapplication, nsmenu, nsresponder, nstext, nstextview, nswindowcontroller,
    nsdragoperation, nsdragginginfo, nsalert, nsimage, nscell, nscontrol,
    nsfont, nstextfield, nscolor]
export foundation, nsscreen, nsview, nsevent, nscursor, nspasteboard, nswindow,
    nsapplication, nsmenu, nsresponder, nstext, nstextview, nswindowcontroller,
    nsdragoperation, nsdragginginfo, nsalert, nsimage, nscell, nscontrol,
        nsfont, nstextfield, nscolor

{.passL: "-framework AppKit".}
