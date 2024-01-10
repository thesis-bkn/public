setup:
	bash ./script/setup.sh

install:
	pip install -r requirements.txt

run:
	jupyter notebook --allow-root --no-browser --ip 0.0.0.0 --port 8888 --NotebookApp.token='' --NotebookApp.password=''

full: setup install run
