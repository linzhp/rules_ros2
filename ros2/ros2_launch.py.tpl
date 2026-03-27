import os
import sys

from ros2cli import cli
from ros2launch.command import launch


def _chdir_to_runfiles_main():
    if 'RUNFILES_DIR' in os.environ:
        runfiles_main = os.path.join(os.environ['RUNFILES_DIR'], '_main')
        if os.path.isdir(runfiles_main):
            os.chdir(runfiles_main)


_chdir_to_runfiles_main()

{ament_setup}

LAUNCH_FILE = '{launch_file}'

# The package name is intentionally undefined such that ros2launch picks up
# the given launch file.
argv = [LAUNCH_FILE] + sys.argv[1:]

extension = launch.LaunchCommand()
sys.exit(cli.main(argv=argv, extension=extension))
