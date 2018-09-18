#!/bin/bash

docker run --rm -v $(pwd):/zap/wrk/:rw -t zap-baseline-custom zap-baseline-custom.py -r testreport.html -g gen.conf -d -m 5 \
 -t http://www.example.com # \
# --auth_loginurl "https://{some-tenant}.auth0.com/login?state=..." \
# --auth_username "gjyoung1974@gmail.com" \
# --auth_password "SomePassword" \
# --auth_usernamefield j_username \
# --auth_passwordfield j_password \
# --auth_submitfield submit \
# --auth_exclude "https://dashboard.example.com/j_spring_security_logout,https://dashboard.example.com/j_spring_security_check.*" \
# --active_scan

# Uncomment the above to specificy credentials parameters ^^^
