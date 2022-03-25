MON_IP=<IP_ADDRESS_OF_FIRST_MONITOR>
FSID=$(uuidgen -r)
CEPH_IMAGE=<IMAGE_URL>
read -s svc_user && read -s svc_pass
podman login registry.redhat.io -u ${svc_user} -p ${svc_pass}
cephadm --image ${CEPH_IMAGE} bootstrap --mon-ip ${MON_IP} --allow-fqdn-hostname --fsid ${FSID} --skip-dashboard --skip-monitoring-stack
