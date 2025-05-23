FROM almalinux

# The crb repo provides the some Perl packages (namely perl-IPC-Run) which are dependencies of the postgresql devel packages
# redhat-rpm-config : provides "/usr/lib/rpm/redhat/redhat-hardened-cc1" needed by gcc when compiling extensions
RUN dnf install -y "https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-aarch64/pgdg-redhat-repo-latest.noarch.rpm" && \
  dnf install -y --enablerepo=crb postgresql17-server postgresql17-devel redhat-rpm-config && \
  dnf clean all

COPY ./src /workspace

WORKDIR /workspace

CMD [ "/workspace/build_extension.sh" ]
