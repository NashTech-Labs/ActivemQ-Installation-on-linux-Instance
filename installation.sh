#!/bin/bash

# **Prerequisites**

# 1. Ensure Java is installed 
if ! command -v java &> /dev/null; then
  echo "Java is not installed. Please install Java 8 or later and try again."
  exit 1
fi

# **Download and Extract ActiveMQ**

echo "Downloading ActiveMQ 5.18.4..."
wget -O activemq.tar.gz https://downloads.apache.org/activemq/5.18.4/apache-activemq-5.18.4-bin.tar.gz

if [ $? -ne 0 ]; then  # Check for successful download
  echo "Error downloading ActiveMQ. Please check the download URL or your internet connection."
  exit 1
fi

echo "Extracting ActiveMQ..."
tar -xf activemq.tar.gz
rm activemq.tar.gz

if [ -z "apache-activemq-5.18.4-bin.tar.gz" ]; then
  echo "Could not find the activemq binary. Extraction might have failed."
  exit 1
fi


# **Start ActiveMQ**
echo "Starting ActiveMQ..."
cd ./apache-activemq-5.18.4/bin
./activemq start 

echo "Installation complete!"
echo "ActiveMQ web console should be accessible at http://localhost:8161/admin (default credentials: admin/admin)"

