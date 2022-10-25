#!/bin/bash

SLEEP=300

echo "=============================================="
echo "INICIANDO TESTE DE DISCO, AGUARDE ${SLEEP} SEGUNDOS PARA FINALIZAR"
echo "=============================================="

SPACE=`awk '/^\/dev/ {print $4}' <(df -k .)`
SPACE_SPIKE=$((${SPACE} * 0,85 / 100))
echo "SPACE FREE [${SPACE}] SPACE TO USE [${SPACE_SPIKE}]"
head -c ${SPACE_SPIKE} /dev/urandom >dummy
rm -rf dummy

echo "=============================================="
echo "TESTE DE DISCO FINALIZADO"
echo "=============================================="
