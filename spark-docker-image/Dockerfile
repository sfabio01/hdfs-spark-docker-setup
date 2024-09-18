FROM openjdk:11-jdk-slim

# Install required dependencies
RUN apt-get update && apt-get install -y curl wget python3 python3-pip procps

# Set environment variables
ENV SPARK_VERSION=3.5.2
ENV HADOOP_VERSION=3
ENV SCALA_VERSION=2.12.15
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin

# Download and install Spark
RUN wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /opt/spark && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Install Jupyter and other required Python packages
RUN pip3 install jupyter jupyterlab pyspark==${SPARK_VERSION} findspark pandas numpy matplotlib

# Install Scala kernel for Jupyter
# RUN curl -L -o coursier https://git.io/coursier-cli && \
#     chmod +x coursier && \
#     ./coursier launch --fork almond:0.13.2 --scala 3.3.3 -- --install && \
#     rm -f coursier

# Set up working directory
WORKDIR /notebooks

# Expose Jupyter port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]