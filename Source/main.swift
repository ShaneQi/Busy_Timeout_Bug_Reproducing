import SQLite
import Foundation

let sqlite1 = try! SQLite("./db")
try! sqlite1.execute(statement: "CREATE TABLE IF NOT EXISTS test (id TEXT, value NUMBER);")
sqlite1.close()

//  Acquire an exclusive lock.
let sqlite2 = try! SQLite("./db")
try! sqlite2.execute(statement: "BEGIN EXCLUSIVE;")

let beginTime = Date()

let sqlite3 = try! SQLite("./db")
do {
	//  Set busy_timeout to 5 seconds.
	try sqlite3.execute(statement: "PRAGMA busy_timeout = 5000;")

	//  Make sure busy_timeout is successfully set.
	try sqlite3.forEachRow(statement: "PRAGMA busy_timeout;") {
		s, _ in 
		print(s.columnText(position: 0))
	}

	//  Try to read.
	try sqlite3.execute(statement: "SELECT * FROM test;")

} catch let e {
	print(e)
}

let endTime = Date()

print(endTime.timeIntervalSince(beginTime))

var a = true
while a {

}
