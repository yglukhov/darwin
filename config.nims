import std/os
import std/strutils

proc nimExec(subcmd, file: string, extraFlags = "") =
  let nimFlags = getEnv("NIMFLAGS").strip()
  var cmd = "nim " & subcmd
  cmd.add(" " & nimFlags)
  cmd.add(" " & extraFlags)
  cmd.add(" " & file)
  exec(cmd)

task test, "run unit tests":
  for file in listFiles("tests"):
    let (_, name) = splitPath(file)
    if file.startsWith("tests/") and name.startsWith("t") and name.endsWith(".nim"):
      nimExec("r", file)
