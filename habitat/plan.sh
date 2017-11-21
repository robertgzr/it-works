pkg_name=it_works
pkg_origin=robertgzr
pkg_version="0.1.0"
pkg_license=('MIT')
pkg_maintainer="Robert Günzler <robertguenzler@kinvolk.io>"
pkg_upstream_url=https://github.com/robertgzr/it_works
pkg_bin_dirs=(bin)

pkg_svc_run="it_works"
pkg_svc_user=hab

do_build() {
    return 0
}

do_install() {
    mkdir -p $pkg_prefix/bin
    cp $PLAN_CONTEXT/../artifacts/it_works_linux_amd64 $pkg_prefix/bin/it_works
    chmod +x $pkg_prefix/bin/it_works
}
