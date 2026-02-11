import foundation
import app_kit / [nsscreen, nsview, nsevent, nscursor, nspasteboard, nswindow,
    nstrackingarea, nstextinputcontext,
    nsopengl, nsopenglview,
    nsapplication, nsmenu, nsresponder, nstext, nstextview, nswindowcontroller,
    nsdragoperation, nsdragginginfo, nsalert, nsimage, nscell, nscontrol,
    nsfont, nstextfield, nscolor, nsimageview, nspanel, nssavepanel,
    nsopenpanel, nsbutton, nseventmask]
export foundation, nsscreen, nsview, nsevent, nscursor, nspasteboard, nswindow,
    nstrackingarea, nstextinputcontext,
    nsopengl, nsopenglview,
    nsapplication, nsmenu, nsresponder, nstext, nstextview, nswindowcontroller,
    nsdragoperation, nsdragginginfo, nsalert, nsimage, nscell, nscontrol,
        nsfont, nstextfield, nscolor, nsimageview, nspanel, nssavepanel,
            nsopenpanel, nsbutton, nseventmask

{.passL: "-framework AppKit".}
