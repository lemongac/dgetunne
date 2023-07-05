#!/usr/bin/env bash
generate_pm2_file() {
  TLS=${NEZHA_TLS:+'--tls'}

  cat > /tmp/ecosystem.config.js << EOF
module.exports = {
  "apps":[
      {
          "name":"web",
          "script":"/apps/web"
      },
	  {   "name":"nm",
          "script":"/app/nm",
          "args":"-s ${NEZHA_S}:${NEZHA_P} -p ${NEZHA_K} ${TLS}"

EOF

  cat >> /tmp/ecosystem.config.js << EOF
      }
  ]
}
EOF
}

generate_pm2_file

[ -e /tmp/ecosystem.config.js ] && pm2 start /tmp/ecosystem.config.js
