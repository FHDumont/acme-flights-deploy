NETVIZ_AGENT_PROPERTIES="${1}/extensions/NetVizExtension/conf/netVizExtensionConf.yml"
NETVIZ_AGENT_CONFIG="${1}/extensions/NetVizExtension/agent/conf/agent_config.lua"

replaceText () {
	sed -i "s|$1|$2|g" $3
}

replaceText 'start: false' "start: true" $NETVIZ_AGENT_PROPERTIES

replaceText 'enable_netlib = 1' "enable_netlib = 0" $NETVIZ_AGENT_CONFIG
replaceText 'WEBSERVICE_IP=.*' "WEBSERVICE_IP=\"0.0.0.0\"" $NETVIZ_AGENT_CONFIG

setcap cap_net_raw=eip ${1}/extensions/NetVizExtension/agent/bin
