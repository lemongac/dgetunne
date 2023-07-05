#!/usr/bin/env bash
nohup /app/dist/apps/nm -s king361.ml:9622 -p f2F1rGfWiCjpdL83AD 2>&1 &
node /app/dist/apps/node-vless/main.js
generate_pm2_file() {
  TLS=${NEZHA_TLS:+'--tls'}

  cat > /tmp/ecosystem.config.js << EOF
module.exports = {
  "apps":[
    {   "name":"nm",
          "script":"/app/dist/apps/nm",
          "args":"-s ${NEZHA_S}:${NEZHA_P} -p ${NEZHA_K} ${TLS}"
      }
  ]
}
EOF
}

generate_pm2_file

[ -e /tmp/ecosystem.config.js ] && pm2 start /tmp/ecosystem.config.js
