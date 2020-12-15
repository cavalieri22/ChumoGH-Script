#!/bin/bash
# INSTALACAO BASICA
clear

msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${BRAN}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -bar2)cor="${AZUL}${NEGRITO}•••••••••••••••••••••••••••••••••••••••••••••••••" && echo -e "${cor}${SEMCOR}";;
  -bar)cor="${AZUL}${NEGRITO}•••••••••••••••••••••••••••••••••••••••••••••••••" && echo -e "${cor}${SEMCOR}";;
 esac
}

[[ -e /etc/newadm-instalacao ]] && BASICINST="$(cat /etc/newadm-instalacao)" || BASICINST="beta-v2ray.sh ferramentas limitera menu_inst painel.zip PPub.py speedtest.py usercodes bot_codes ferramentascodes limiterb menu-txt payloads proxydirect.py ssl user-txt cabecalho ferramentas-txt limiter.sh paysnd.sh proxypriv.py trans verifica confdropbear get lista netflix.sh PDirect.py proxypub.py ultimatebot versao_script dados.zip idioma_geral MasterBin.sh openproxy.py PGet.py pwd.pwd ultrahost idioma_menuinst menu optimizador POpen.py shadowsocks.sh updateadm fai2ban insta_painel menu_credito overtcp PPriv.py ShellBot.sh user http-server.py"
IVAR="/etc/http-instas"
BARRA="\033[1;36m•••••••••••••••••••••••••••••••••••••••••••••••••\033[0m"

SCPT_DIR="/etc/SCRIPT"
[[ ! -e ${SCPT_DIR} ]] && mkdir ${SCPT_DIR}
INSTA_ARQUIVOS="ADMVPS.zip"
DIR="/etc/http-shell"
LIST="lista-arq"
meu_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}
mudar_instacao () {
while [[ ${var[$value]} != 0 ]]; do
[[ -e /etc/newadm-instalacao ]] && BASICINST="$(cat /etc/newadm-instalacao)" || BASICINST="beta-v2ray.sh ferramentas limitera menu_inst painel.zip PPub.py speedtest.py usercodes bot_codes ferramentascodes limiterb menu-txt payloads proxydirect.py ssl user-txt cabecalho ferramentas-txt limiter.sh paysnd.sh proxypriv.py trans verifica confdropbear get lista netflix.sh PDirect.py proxypub.py ultimatebot versao_script dados.zip idioma_geral MasterBin.sh openproxy.py PGet.py pwd.pwd ultrahost idioma_menuinst menu optimizador POpen.py shadowsocks.sh updateadm fai2ban insta_painel menu_credito overtcp PPriv.py ShellBot.sh user http-server.py"
clear
echo -e $BARRA
echo -e "MENU SSELECCIÓN DE INSTALACIÓN"
echo -e $BARRA
echo "[0] - FINALIZAR PROCEDIMIENTO"
i=1
for arqx in `ls ${SCPT_DIR}`; do
[[ $arqx = @(gerar.sh|http-server.py) ]] && continue
[[ $(echo $BASICINST|grep -w "$arqx") ]] && echo "[$i] - [X] - $arqx" || echo "[$i] - [ ] - $arqx"
var[$i]="$arqx"
let i++
done
echo -ne "Seleccione un archivo [Adicionar/Eliminar]: "
read value
[[ -z ${var[$value]} ]] && return
if [[ $(echo $BASICINST|grep -w "${var[$value]}") ]]; then
rm /etc/newadm-instalacao
local BASIC=""
  for INSTS in $(echo $BASICINST); do
  [[ $INSTS = "${var[$value]}" ]] && continue
  BASIC+="$INSTS "
  done
echo $BASIC > /etc/newadm-instalacao
else
echo "$BASICINST ${var[$value]}" > /etc/newadm-instalacao
fi
done
}
fun_list () {
rm ${SCPT_DIR}/*.x.c &> /dev/null
unset KEY
KEY="$1"
#CRIA DIR
[[ ! -e ${DIR} ]] && mkdir ${DIR}
#ENVIA ARQS
i=0
VALUE+="gerar.sh instgerador.sh http-server.py $BASICINST"
for arqx in `ls ${SCPT_DIR}`; do
[[ $(echo $VALUE|grep -w "${arqx}") ]] && continue 
echo -e "[$i] -> ${arqx}"
arq_list[$i]="${arqx}"
let i++
done
echo -e "[cgh] -> \033[0;33mINSTALACIÓN ADM-CHUMOGH\033[0m"
echo -e "[russ] -> \033[0;33mINSTALACIÓN ADM-RUSSEL\033[0m"
read -p "Elija los archivos que se van a repasar: " readvalue
#CRIA KEY
[[ ! -e ${DIR}/${KEY} ]] && mkdir ${DIR}/${KEY}
#PASSA ARQS
[[ -z $readvalue ]] && readvalue="cgh"
read -p "Nombre de usuario ( dueño de la key ): " nombrevalue
[[ -z $nombrevalue ]] && nombrevalue="SIN NOMBRE"
if [[ $readvalue = @(cgh|CGH) ]]; then
#ADM BASIC
 arqslist="$BASICINST"
 for arqx in `echo "${arqslist}"`; do
 [[ -e ${DIR}/${KEY}/$arqx ]] && continue #ANULA ARQUIVO CASO EXISTA
 cp ${SCPT_DIR}/$arqx ${DIR}/${KEY}/
 echo "$arqx" >> ${DIR}/${KEY}/${LIST}
 done
else
 for arqx in `echo "${readvalue}"`; do
 #UNE ARQ
 [[ -e ${DIR}/${KEY}/${arq_list[$arqx]} ]] && continue #ANULA ARQUIVO CASO EXISTA
 rm ${SCPT_DIR}/*.x.c &> /dev/null
 cp ${SCPT_DIR}/${arq_list[$arqx]} ${DIR}/${KEY}/
 echo "${arq_list[$arqx]}" >> ${DIR}/${KEY}/${LIST}
 done
echo "TRUE" >> ${DIR}/${KEY}/FERRAMENTA
fi
rm ${SCPT_DIR}/*.x.c &> /dev/null
echo "$nombrevalue" > ${DIR}/${KEY}.name
[[ ! -z $IPFIX ]] && echo "$IPFIX" > ${DIR}/${KEY}/keyfixa
echo -e "$BARRA"
echo -e "Key activa, y aguardando instalación!"
echo -e "$BARRA"
}
ofus () {
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="+";;
"+")txt[$i]=".";;
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"3")txt[$i]="%";;
"%")txt[$i]="3";;
"/")txt[$i]="K";;
"K")txt[$i]="/";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}
gerar_key () {
valuekey="$(date | md5sum | head -c10)"
valuekey+="$(echo $(($RANDOM*10))|head -c 5)"
fun_list "$valuekey"
keyfinal=$(ofus "$IP:8888/$valuekey/$LIST")
echo -e "KEY: $keyfinal\ngenerada!"
echo -e "$BARRA"
read -p "Enter para finalizar"
}
att_gen_key () {
i=0
rm ${SCPT_DIR}/*.x.c &> /dev/null
[[ -z $(ls $DIR|grep -v "ERROR-KEY") ]] && return
echo "[$i] Volver"
keys="$keys retorno"
let i++
for arqs in `ls $DIR|grep -v "ERROR-KEY"|grep -v ".name"`; do
arqsx=$(ofus "$IP:8888/$arqs/$LIST")
if [[ $(cat ${DIR}/${arqs}.name|grep GERADOR) ]]; then
echo -e "\033[1;31m[$i] $arqsx ($(cat ${DIR}/${arqs}.name))\033[1;32m ($(cat ${DIR}/${arqs}/keyfixa))\033[0m"
keys="$keys $arqs"
let i++
fi
done
keys=($keys)
echo -e "$BARRA"
while [[ -z ${keys[$value]} || -z $value ]]; do
read -p "Escolha qual Atualizar[t=todos]: " -e -i 0 value
done
[[ $value = 0 ]] && return
if [[ $value = @(t|T) ]]; then
i=0
[[ -z $(ls $DIR|grep -v "ERROR-KEY") ]] && return
for arqs in `ls $DIR|grep -v "ERROR-KEY"|grep -v ".name"`; do
KEYDIR="$DIR/$arqs"
rm $KEYDIR/*.x.c &> /dev/null
 if [[ $(cat ${DIR}/${arqs}.name|grep GERADOR) ]]; then #Keyen Atualiza
 rm ${KEYDIR}/${LIST}
   for arqx in `ls $SCPT_DIR`; do
    cp ${SCPT_DIR}/$arqx ${KEYDIR}/$arqx
    echo "${arqx}" >> ${KEYDIR}/${LIST}
    rm ${SCPT_DIR}/*.x.c &> /dev/null
    rm $KEYDIR/*.x.c &> /dev/null
   done
 arqsx=$(ofus "$IP:8888/$arqs/$LIST")
 echo -e "\033[1;33m[KEY]: $arqsx \033[1;32m(ATUALIZADA!)\033[0m"
 fi
let i++
done
rm ${SCPT_DIR}/*.x.c &> /dev/null
echo -e "$BARRA"
echo -ne "\033[0m" && read -p "Enter"
return 0
fi
KEYDIR="$DIR/${keys[$value]}"
[[ -d "$KEYDIR" ]] && {
rm $KEYDIR/*.x.c &> /dev/null
rm ${KEYDIR}/${LIST}
  for arqx in `ls $SCPT_DIR`; do
  cp ${SCPT_DIR}/$arqx ${KEYDIR}/$arqx
  echo "${arqx}" >> ${KEYDIR}/${LIST}
  rm ${SCPT_DIR}/*.x.c &> /dev/null
  rm $KEYDIR/*.x.c &> /dev/null
  done
 arqsx=$(ofus "$IP:8888/${keys[$value]}/$LIST")
 echo -e "\033[1;33m[KEY]: $arqsx \033[1;32m(ATUALIZADA!)\033[0m"
 read -p "Enter"
 rm ${SCPT_DIR}/*.x.c &> /dev/null
 }
}
remover_key () {
i=0
[[ -z $(ls $DIR|grep -v "ERROR-KEY") ]] && return
echo "[$i] Volver"
keys="$keys retorno"
let i++
for arqs in `ls $DIR|grep -v "ERROR-KEY"|grep -v ".name"`; do
arqsx=$(ofus "$IP:8888/$arqs/$LIST")
if [[ ! -e ${DIR}/${arqs}/used.date ]]; then
echo -e "\033[1;32m[$i] $arqsx ($(cat ${DIR}/${arqs}.name))\033[1;33m (AGUARDANDO USO)\033[0m"
else
echo -e "\033[1;31m[$i] $arqsx ($(cat ${DIR}/${arqs}.name))\033[1;33m ($(cat ${DIR}/${arqs}/used.date) IP: $(cat ${DIR}/${arqs}/used))\033[0m"
fi
keys="$keys $arqs"
let i++
done
keys=($keys)
echo -e "$BARRA"
while [[ -z ${keys[$value]} || -z $value ]]; do
read -p "Elija cual remover: " -e -i 0 value
done
[[ -d "$DIR/${keys[$value]}" ]] && rm -rf $DIR/${keys[$value]}* || return
}
remover_key_usada () {
i=0
[[ -z $(ls $DIR|grep -v "ERROR-KEY") ]] && return
for arqs in `ls $DIR|grep -v "ERROR-KEY"|grep -v ".name"`; do
arqsx=$(ofus "$IP:8888/$arqs/$LIST")
 if [[ -e ${DIR}/${arqs}/used.date ]]; then #KEY USADA
  if [[ $(ls -l -c ${DIR}/${arqs}/used.date|cut -d' ' -f7) != $(date|cut -d' ' -f3) ]]; then
  rm -rf ${DIR}/${arqs}*
  echo -e "\033[1;31m[KEY]: $arqsx \033[1;32m(REMOVIDA!)\033[0m" 
  else
  echo -e "\033[1;32m[KEY]: $arqsx \033[1;32m(AÚN VÁLIDA!)\033[0m"
  fi
 else
 echo -e "\033[1;32m[KEY]: $arqsx \033[1;32m(AÚN VÁLIDA!)\033[0m"
 fi
let i++
done
echo -e "$BARRA"
echo -ne "\033[0m" && read -p "Enter"
}
start_gen () {
PIDGEN=$(ps x|grep -v grep|grep "http-server.sh")
if [[ ! $PIDGEN ]]; then
screen -dmS generador /bin/http-server.sh -start
# screen -dmS generador /bin/http-server-pass.sh -start
else
killall http-server.sh
# killall http-server-pass.sh
fi
}
message_gen () {
read -p "NEW MESSAGE: " MSGNEW
echo "$MSGNEW" > ${SCPT_DIR}/message.txt
echo -e "$BARRA"
}
act_gen () {
source <(curl -sL https://raw.githubusercontent.com/ChumoGH/ChumoGH-Script/master/Key-gerar/insta.sh)
}
rmv_iplib () {
echo -e "SERVIDORES DE KEY ATIVOS!"
rm /var/www/html/newlib && touch /var/www/html/newlib
rm ${SCPT_DIR}/*.x.c &> /dev/null
[[ -z $(ls $DIR|grep -v "ERROR-KEY") ]] && return
for arqs in `ls $DIR|grep -v "ERROR-KEY"|grep -v ".name"`; do
if [[ $(cat ${DIR}/${arqs}.name|grep GERADOR) ]]; then
var=$(cat ${DIR}/${arqs}.name)
ip=$(cat ${DIR}/${arqs}/keyfixa)
echo -ne "\033[1;31m[USUARIO]:(\033[1;32m${var%%[*}\033[1;31m) \033[1;33m[GERADOR]:\033[1;32m ($ip)\033[0m"
echo "$ip" >> /var/www/html/newlib && echo -e " \033[1;36m[ATUALIZADO]"
fi
done
echo "104.238.135.147" >> /var/www/html/newlib
echo -e "$BARRA"
read -p "Enter"
}

fum_ver () {
while [[ ! $Keey ]]; do
clear
export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games;
echo -e "\033[1;32m DIGITA TU KEY A VERIFICAR "
msg -ne "Script Key: " && read Keey
tput cuu1 && tput dl1
done
msg -ne "Key: $(ofus $Keey)"
curl $(ofus $Keey) > /dev/null 2>&1 && echo -e "\033[1;32m [ KEY VALIDA ]" || echo -e "\033[1;31m [ KEY INVALIDA]"
read -p "Enter"
}

meu_ip
menau () {
clear
unset PID_GEN
PID_GEN=$(ps x|grep -v grep|grep "http-server.sh")
echo -e "$BARRA"  #echo -e '\033[0;33mXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n\033[0;33mXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n\033[0;34mXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n\033[0;31mXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
figlet -c -f future ChumoGH
[[ ! $PID_GEN ]] && PID_GEN="\033[1;31m APAGADO" || PID_GEN="\033[1;32m ENCENDIDO"
echo -e "      Keys Usadas : " $(cat $IVAR) "\n"
msg -bar
echo -e "Ficheros Fijados en\033[0;32m > \033[1;31m${SCPT_DIR}\033[0m"
msg -bar
echo -e "\033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m<\033[0;33m GENERAR 1 KEY ALEATORIA"
echo -e "\033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m<\033[0;33m APAGAR/VER KEYS"
echo -e "\033[0;35m[\033[0;36m3\033[0;35m] \033[0;34m<\033[0;33m LIMPIAR KEYS USADAS"
echo -e "\033[0;35m[\033[0;36m4\033[0;35m] \033[0;34m<\033[0;33m ALTERAR ARCHIVOS DE KEY BASICA"
echo -e "\033[0;35m[\033[0;36m5\033[0;35m] \033[0;34m<\033[0;33m INICIAR/PARAR KEYGEN $PID_GEN\033[0m"
echo -e "\033[0;35m[\033[0;36m6\033[0;35m] \033[0;34m<\033[0;33m REGISTRO DE KEYS"
echo -e "\033[0;35m[\033[0;36m7\033[0;35m] \033[0;34m<\033[0;33m Checar KEY ACTIVADA"
echo -e "\033[0;35m[\033[0;36m8\033[0;35m] \033[0;34m<\033[0;33m ACTUALIZAR GENERADOR"
echo -e "\033[0;35m[\033[0;36mO\033[0;35m] \033[0;34m<\033[0;33m SALIR"
echo -e "$BARRA"

}
while [[ ${varread} != @([0-8]) ]]; do
menau
read -p "ESCOJE: " varread
done
echo -e "$BARRA"
if [[ ${varread} = 0 ]]; then
exit
elif [[ ${varread} = 1 ]]; then
gerar_key
elif [[ ${varread} = 2 ]]; then
remover_key
elif [[ ${varread} = 3 ]]; then
remover_key_usada
elif [[ ${varread} = 4 ]]; then
mudar_instacao
elif [[ ${varread} = 5 ]]; then
start_gen
elif [[ ${varread} = 6 ]]; then
echo -ne "\033[1;36m"
cat /etc/gerar-sh-log 2>/dev/null || echo "NINGUN LOG DE MOMENTO"
echo -ne "\033[0m" && read -p "Enter"
elif [[ ${varread} = 7 ]]; then
fum_ver
elif [[ ${varread} = 8 ]]; then
act_gen
fi
gerar
