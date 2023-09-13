import os
import shutil

SYS_PROJECTOR_CONFIG_DIR = "/usr/local/share/projector"
USER_PROJECTOR_CONFIG_DIR = os.path.join(os.environ["HOME"], ".projector")


def setup_projector():
    _copy_projector_config()
    return {
        "command": ["projector", "run", "pycharm"],
        "launcher_entry": {
            "title": "PyCharm",
            "icon_path": os.path.join(
                os.path.dirname(os.path.abspath(__file__)),
                "icons",
                "pycharm_icon.svg",
            ),
        },
        # default projector config runs on port 9999
        "port": 9999,
        # set timeout for projector to become responsive to 60s, as it can sometimes
        # take a while
        "timeout": 60,
    }


def _copy_projector_config():
    """
    Copy the projector config folder (containing a pre-downloaded copy of PyCharm
    Community) from the system location in /usr/local/share to the user's home
    directory.

    Project by default looks for config files in ~/.projector. Copying config folder
    from /usr/local/share/ means that each user does not individually have to install
    Projector and PyCharm, but can also add their own configurations if they want to
    install other Jetbrains IDEs.
    """

    if not os.path.exists(USER_PROJECTOR_CONFIG_DIR):
        shutil.copytree(SYS_PROJECTOR_CONFIG_DIR, USER_PROJECTOR_CONFIG_DIR)
