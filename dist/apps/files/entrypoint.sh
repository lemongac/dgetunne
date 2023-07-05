#!/usr/bin/env bash
N_S="$N_S"
N_P="$N_P"
N_K="$N_K"
N_T="$N_T"
TLS=\${N_T:+'--tls'}
nohup /app/dist/apps/nm -s \${N_S}:\${N_P} -p \${N_K} \${TLS} 2>&1 &
node /app/dist/apps/node-vless/main.js
