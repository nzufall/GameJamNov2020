import os, sys
from subprocess import run, PIPE


def main():
    premake_path = os.path.join(os.getcwd(), "Bin", "premake5.exe")
    premake_results = run([premake_path, "vs2019"])

    local_env = os.environ
    local_env["Path"] = f"{local_env['Path']};C:\Program Files (x86)\Microsoft Visual Studio\Installer"
    output = run(["vswhere", "-version", "16.0", "-property","installationPath"], env=local_env, stdout=PIPE, stderr=PIPE)

    msbuid_path = os.path.join(output.stdout.decode("utf-8").rstrip(), "MSBuild", "Current", "Bin", "MSBuild.exe")
    run(msbuid_path)


if __name__ == "__main__":
    sys.exit(main())