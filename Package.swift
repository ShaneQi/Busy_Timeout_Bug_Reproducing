import PackageDescription

let package = Package(
		name: "Busy_Timeout_Bug_Reproducing",
		dependencies: [
		.Package(url:"https://github.com/PerfectlySoft/Perfect-SQLite.git", Version(2,0,1)),
		]
		)

