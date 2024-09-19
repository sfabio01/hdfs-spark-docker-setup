# HDFS cluster and Spark Jupyter Notebook with Docker

## Getting Started
### Prerequisites
- docker
- docker-compose

### HDFS Setup
Start the HDFS cluster:
```bash
cd hdfs-docker-cluster
docker-compose up -d
```

You can access the HDFS Namenode web interface at http://localhost:9870.

Run the load_dataset_to_hdfs.sh script to load the dataset to HDFS.

### Spark Jupyter Notebook Setup
Build the Spark Jupyter Notebook image:
```bash
cd spark-docker-image
docker build -t spark-python-jupyter .
```

Start the Spark Jupyter Notebook:
```bash
docker run -it -p 8888:8888 -v .:/notebooks --network hdfs-docker-cluster_hdfs_network spark-python-jupyter
```
