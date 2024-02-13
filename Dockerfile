FROM rockylinux:8-minimal

RUN microdnf --nodocs --disablerepo '*' --enablerepo=baseos install openssl-devel && \
    curl -s https://linux.dell.com/repo/hardware/dsu/bootstrap.cgi | bash && \
    microdnf --nodocs install srvadmin-idrac.x86_64 && \
    rm -rf /tmp/* && microdnf clean all

WORKDIR /tmp

ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm7"]
