//
//  Provide the Tcl extension demoext in Swift
//
//  Copyright © 2017 FlightAware. All rights reserved.
//

import Tcl8_6
import SwiftTcl

func demoext (interp: TclInterp, objv: [TclObj]) -> String {
	return "demoext"
}

@_silgen_name("Swifttcldemoext_Init")
func Demoext_Init(_ interpPtr:UnsafeMutablePointer<Tcl_Interp>) -> Int {
	let interp = TclInterp(interp: interpPtr)	
    interp.createCommand(named: "demoext", using: demoext)
    return 0
}
