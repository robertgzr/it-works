pkg_name=it-works
pkg_origin=robertgzr
pkg_version="0.2.1"
pkg_license=('MIT')
pkg_maintainer="Robert Günzler <robertguenzler@kinvolk.io>"
pkg_upstream_url=https://github.com/robertgzr/it-works
pkg_bin_dirs=(bin)

pkg_svc_user=hab
pkg_exports=(
    [port]=www.port
    [msg]=www.msg
)

do_build() {
    return 0
}

do_install() {
    mkdir -p $pkg_prefix/bin
    cp $PLAN_CONTEXT/../artifacts/it-works_linux_amd64 $pkg_prefix/bin/it-works
    chmod +x $pkg_prefix/bin/it-works
}
