#centos from dockerhub
FROM dokken/centos-stream-9:latest

#metadata
LABEL base.image="centos-stream-9:latest"
LABEL software="bclconvert"
LABEL software.version="4.3.6"
LABEL dockerfile.version="1"
LABEL description="BCL file convert to FASTQ file"
LABEL website="https://emea.support.illumina.com/sequencing/sequencing_software/bcl-convert/downloads.html"

#add bclconvert from local file
ADD /Users/thusor/Downloads/bcl-convert-4.3.6-2.el7.x86_64.rpm /tmp/bcl-convert.rpm

#update system and download necessary programs
RUN yum install -y gdb && \
    rpm -i /tmp/bcl-convert.rpm && \
    rm /tmp/bcl-convert.rpm && \
    yum clean all && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/usr/bin/bcl-convert"]
