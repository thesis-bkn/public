setup:
	bash ./script/setup.sh

install: setup
	pip install -r requirements.txt

run: install
	jupyter notebook --allow-root --no-browser --ip 0.0.0.0 --port 8888 --NotebookApp.token='' --NotebookApp.password=''