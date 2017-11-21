pkg_name=it_works
pkg_origin=robertgzr
pkg_version="0.1.0"
pkg_bin_dirs=(bin)

do_build() {
    return 0
}

do_install() {
    mkdir -p bin/
    cp artifacts/it_works_linux_amd64 bin/it_works
}

do_clean() {
    rm -rf ./bin
}
