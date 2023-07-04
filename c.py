#!/bin/bash
# X-ray设置，可以不修改
UUID='db5b4014-d2da-11ed-afa1-0242ac120002'
VMPATH='/vm'
VLPATH='/vl'
# A-ro隧道设置，必须填
TOK='eyJhIjoiZjAzMGY1ZDg4OGEyYmRlN2NiMDg3NTU5MzM4ZjE0OTciLCJ0IjoiMDNjZDQ4ZTMtOTYxMi00YzNjLTg3ODMtMjk4ODg2NmY1MDJhIiwicyI6Ik1HUTFaV05oTnpZdFl6UXdZaTAwTUROaExUbGlNMkl0T1RoaE5qTmhNR0UxTURreiJ9'
# 哪吒设置，不需要就删掉
NEZHA_SERVER='xxxxxxg'
NEZHA_KEY='MxxxxxxxxxI'
# =====================以下内容都不建议修改=============
# 哪吒端口
NEZHA_PORT=${NEZHA_PORT:-'443'}
# 哪吒tls开关,1开启0关闭
NEZHA_TLS=${NEZHA_TLS:-'1'}
# X-ray下载链接
URL_BOT='github.com/seav1/waifly/blob/main/web.js'
# 文件下载路径
paths='/tmp/app'
