docker cp diabetes.csv namenode:/tmp/
docker exec -it namenode hdfs dfs -put /tmp/diabetes.csv /
docker exec -it namenode hdfs dfs -ls /