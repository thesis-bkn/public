setup:
	PYTHON_VERSION="3.11.5" bash ./script/setup.sh

install:
	Python-3.11.5/python -m pip install -r requirements.txt

run:
	jupyter notebook --allow-root --no-browser --ip 0.0.0.0 --port 8888 --NotebookApp.token='' --NotebookApp.password=''

full: setup install run
