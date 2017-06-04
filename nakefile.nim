import nake

task "tests", "Run tests":
    withDir "tests":
        for f in walkFiles "*.nim":
            if f[0] == 't':
                echo "Running test: ", f
                direShell(nimExe, "c", "-r", f)
