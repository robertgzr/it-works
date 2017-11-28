#!/bin/bash

vagrant up && \
    vagrant ssh -c 'cd /src && sudo make hab-export' && \
    scp -i .vagrant/machines/default/virtualbox/private_key \
        -o 'UserKnownHostsFile /dev/null' \
        -P 2222 vagrant@localhost:/src/manifest.yml .
