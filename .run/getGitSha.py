#!/usr/bin/env python3
import subprocess
import sys

def get_git_sha():
    try:
        # Get the 7-character SHA
        sha = subprocess.check_output(['git', 'rev-parse', '--short=7', 'HEAD'],
                                      stderr=subprocess.DEVNULL).decode().strip()

        # Check if there are uncommitted changes (0=clean, 1=dirty)
        is_dirty = subprocess.run(['git', 'diff', 'HEAD', '--quiet']).returncode != 0
        return f"{sha}*" if is_dirty else sha
    except Exception:
        return "unknown"

if __name__ == "__main__":
    sys.stdout.write(get_git_sha())