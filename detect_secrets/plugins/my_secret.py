"""
This plugin searches for my secret
"""
import re

from .base import RegexBasedDetector


class MyDanger(RegexBasedDetector):
    """Scans for my secret."""
    secret_type = 'My custom secret'

    denylist = [
        # Discord Bot Token ([M|N]XXXXXXXXXXXXXXXXXXXXXXX.XXXXXX.XXXXXXXXXXXXXXXXXXXXXXXXXXX)
        # Reference: https://discord.com/developers/docs/reference#authentication
        re.compile(r'danger\.pem'),
        re.compile(r'chaoge123123')
    ]
