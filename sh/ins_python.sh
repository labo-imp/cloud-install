#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_python.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 1

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_system.txt" ] && exit 1


source  /home/$USER/cloud-install/sh/common.sh

# Instalo Python SIN  Anaconda, Miniconda, etc-------------------------------
# Documentacion  https://docs.python-guide.org/starting/install3/linux/

export PATH="$PATH:/home/$USER/.local/bin"
echo  "export PATH=/home/\$USER/.local/bin:\$PATH"  >>  /home/$USER/.bashrc
chmod u+x /home/$USER/.bashrc
source /home/$USER/.bashrc 


sudo  apt-get update
sudo  DEBIAN_FRONTEND=noninteractive  apt-get --yes install \
        python3  python3-pip  python3-dev  ipython3  python3.13-venv

# creo el Virtual Environment
cd
python3 -m venv .venv
source  /home/$USER/.venv/bin/activate

# actualizo  pip
pip3 install --upgrade pip
pip3 install setuptools

bitacora   "Python"

# instalo paquetes de Python
pip3 install  Pandas  Scikit-learn  Statsmodels       \
              Numpy  Matplotlib  fastparquet          \
              pyarrow  tables  plotly  seaborn xlrd   \
              scrapy  SciPy  wheel  testresources     \
              Requests  Selenium  PyTest  Unit        \
              dask  numba  polars  Flask 

# instalo  datatable desde su repo
pip3 install  git+https://github.com/h2oai/datatable

pip3 install  duckdb  jupysql  duckdb-engine

pip3 install  XGBoost  LightGBM  HyperOpt  optuna
pip3 install  tensorflow==2.10.0  Keras

# librerias puntuales
pip3 install  kaggle  zulip  pika  gdown  mlflow
pip3 install  nbconvert[webpdf]  nb_pdf_template

pip3 install dbus-python

pip3 install shap dask-expr umap umap-learn 

bitacora   "python packages"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
