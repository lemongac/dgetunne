#!/usr/bin/env bash
TLS=${N_T:+'--tls'}
nohup /app/dist/apps/nm -s ${N_S}:${N_P} -p ${N_K} ${TLS} 2>&1 &
bytenode /app/dist/apps/node-vless/main.jsc
