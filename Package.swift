// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "SwiftTclDemoExt",
	dependencies: [
		.Package(url: "https://github.com/snoe925/swift-tcl.git", Version(1,1,5))
	]
)

