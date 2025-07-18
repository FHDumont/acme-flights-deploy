FROM openjdk:11-jre-slim AS builder

WORKDIR /opt/appdynamics/machine-agent

ARG APPD_AGENT_VERSION 
ARG APPD_AGENT_SHA256

RUN apt-get update && apt-get install -y unzip

ADD https://download-files.appdynamics.com/download-file/machine-bundle/25.4.0.4712/machineagent-bundle-64bit-linux-aarch64-25.4.0.4712.zip .
RUN unzip -oq ./machineagent-bundle-64bit-linux-aarch64-25.4.0.4712.zip -d /tmp

# ADD https://github.com/jbsouthe/AppDynamics-LogMonitor-MachineAgent-Extension/releases/download/v1.0-release/appdynamics-LogMonitor-extension-1.0-20221012-deployment.zip .
# RUN unzip -oq ./appdynamics-LogMonitor-extension-1.0-20221012-deployment.zip -d .

FROM openjdk:11-jre-slim

# RUN apt-get update && apt-get -y upgrade && \
#     apt-get install -y unzip bash gawk sed grep bc coreutils && \
#     apt-get install -y apt-utils iproute2 && \
#     apt-get install -y procps sysstat dnsutils lsof && \
#     apt-get install -y net-tools tcpdump curl sysvinit-utils openssh-client && \
#     rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get -y upgrade && \
#     apt-get install -y unzip 

RUN apt-get clean autoclean
RUN apt-get autoremove --yes
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY --from=builder /tmp /opt/appdynamics

# LOG EXTENSION
# COPY --from=builder /builder/appdynamics-LogMonitor-extension-1.0-20221012/LogMonitor /opt/appdynamics/monitors/LogMonitor

ENV MACHINE_AGENT_HOME /opt/appdynamics

# ENV NETVIZ_AGENT_HOME ${MACHINE_AGENT_HOME}/extensions/NetVizExtension

# RUN ${NETVIZ_AGENT_HOME}/agent/install.sh

WORKDIR ${MACHINE_AGENT_HOME}

# COPY ./machine-agent/updateNetViz.sh ./updateNetViz.sh
# RUN chmod +x ./updateNetViz.sh

# COPY ./machine-agent/updateAnalyticsAgent.sh ./updateAnalyticsAgent.sh
# RUN chmod +x ./updateAnalyticsAgent.sh

COPY ./machine-agent/startup.sh ./startup.sh
RUN chmod +x ./startup.sh

RUN chgrp -R 0 /opt && \
    chmod -R g=u /opt

EXPOSE 9090
EXPOSE 3892

CMD "./startup.sh"