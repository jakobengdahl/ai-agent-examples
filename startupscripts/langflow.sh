#!/bin/bash
conda create -n langflow_env_py310 python=3.10 -y 
conda activate langflow_env_py310
python -m pip install langflow -U
python -m langflow run --no-open-browser --port 9797 --host $(hostname -I) &