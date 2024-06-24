#!/bin/bash
conda create -n langflow_env_py310 python=3.10 
conda activate langflow_env_py310
python -m pip install langflow -U
python -m langflow run --PORT 9797 --HOST --host $(hostname -I) &