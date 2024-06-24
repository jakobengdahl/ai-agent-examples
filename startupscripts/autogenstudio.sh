#!/bin/bash
pip install autogenstudio
autogenstudio ui --port 9191 --host $(hostname -I) &
