FROM continuumio/miniconda3
EXPOSE 80
RUN /opt/conda/bin/conda config --add channels conda-forge \
	&& /opt/conda/bin/conda config --set channel_priority strict \
	&& /opt/conda/bin/conda update -y conda \
    && /opt/conda/bin/conda install -y pytest Hypothesis rasterstats rasterio fiona geopandas gdal proj contextily matplotlib geoplot \
	&& /opt/conda/bin/conda install jupyter -y --quiet \
	&& mkdir /opt/notebooks 


WORKDIR /app

COPY . .

CMD jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root
