#!/bin/bash
pip install autogenstudio
autogenstudio ui --port 9797 --host $(hostname -I) &
