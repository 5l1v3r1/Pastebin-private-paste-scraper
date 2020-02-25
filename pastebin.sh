#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "USAGE: $0 [OutFile] [Start (Default: aaaaaaaa)]"
    exit 1
fi
 cookieJar=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1);
if [[ ! -z $2 ]]; then
	flag="false";
	start="$2";
	echo -e "\e[1m\e[33mResuming position:\e[39m $2..."
else
	start="aaaaaaaa";
	flag="true";
fi;
chars=();for l in {{a..z},{0..9}} ; do chars+=( $l ); done;
for a in ${chars[@]}; do
	for b in ${chars[@]}; do
		for c in ${chars[@]}; do
			for d in ${chars[@]}; do
				for e in ${chars[@]}; do
					for f in ${chars[@]}; do
						for g in ${chars[@]}; do
							for h in ${chars[@]}; do
								
								set check = "$a$b$c$d$e$f$g$h"
								if [[ "$a$b$c$d$e$f$g$h" == "$start" ]]; then
									flag="true";
									echo "";
								fi;
								if [[ "$flag" == "true" ]]; then
									u="https://pastebin.com/$a$b$c$d$e$f$g$h";
									tput cuu 1 && tput el
									echo -e "\e[1m\e[32mScanning:\e[39m $u";
									ws=$(curl --silent "https://pastebin.com/$a$b$c$d$e$f$g$h" -c "/bin/.cookies/$cookieJar" -H 'user-agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3' -H '_ga: GA1.2.1892489665.1576113637' -H '__gads: ID=1f4ce52383ca3f5c:T=1576113637:S=ALNI_MZG1OhID9NzqHUkZvucN64o0MVxyQ' -H 'OB-USER-TOKEN: 1ccd0e33-34c8-4f16-93ba-b06533505258' -H '__cfduid: da20816563ca2a5659b8c96a3f43db14c1580181290' -H '_gid: GA1.2.1565653877.1580181291' -H 'DigiTrust.v1.identity: eyJpZCI6ImVvQXlVcmxZM0xKSE1kSUdUZllzS292cUVGMFJDa0RZMmtjK0N0SUlUS2hPR0J1MTNRcS80aXFNUFpDcWlEYm5XSlZUcndMTGtTcjZDS2w3VnBuamU3Nkl2QVpjYXYrZHNLZmEzTHlQZFZyTk9aVVMyTkRNL0FNQ0lMZUhiTkpWWHBaT2ZobGxQa0J0UDU4SU95Q3FObWlpaEpZS1Z5VzV5cWJEMnVIcGFRKzUwUmhncDBBQ0l5bTh1bWFFZlR2QmxNQlpxZUE1UGtGaEJ5Sm5KNCthMHdRSDBqYjhTekw0b3lpTlVtN2dENDNiRlJIamRsd0JybXZQbWdCSjd6LzZDRGQyVWFJTnFneVoyL1QrbkUyZmt5U1FDc24wWndYQXc2dGxHdkdkbHB1aVZpeDJtVkRSWVVpSnNaZVZOUjVneHdCUTZtVnl4MFQ4MmZkUFJyenJ3QT09IiwidmVyc2lvbiI6MiwicHJvZHVjZXIiOiIxQ3JzZFVOQW82IiwicHJpdmFjeSI6eyJvcHRvdXQiOmZhbHNlfSwia2V5diI6NH0%3D' -H 'PM-UL-Sync: {"2":1580356991439}' -H 'PHPSESSID: vugbuthu05nh79irnu3t36o9t2' -H 'visitorGeo: US' -H 'cf_clearance: 292737e3265aec81f622d6ed876d5acfe53805ea-1580300397-0-250' -H 'InstiSession: {"id":"173beb87-a96d-4757-85d8-461d01e521cd","referrer":"pastebin.com","campaign":{"source":null,"medium":null,"campaign":null,"term":null,"content":null}}')
 									x=$(echo $ws | grep 'Unlisted paste, only people with this link can see this paste.')
									band=$(echo $ws | grep "Pastebin.com - Access Denied Warning");
									captcha=$(echo $ws | grep "captcha-bypass")
									if [[ ! -z $captcha ]]; then
										echo -e "\e[1m\e[31mCaptcha thrown Press ENTER to resume once taken care of..."
										read -p "";
										$0 $1 "$a$b$c$d$e$f$g$h"
										exit;
									fi;
									if [[ ! -z $band ]]; then
										echo -e "\e[1m\e[31mTemporarilly blocked...retrying in 30 minutes...";
										sleep 1800;
										echo "";
									fi;
									if [[ ! -z $x ]]; then
										tput cuu 1 && tput el
										echo -e "\e[1m\e[32mMatch found:\e[39m\e[34m $u";
										echo "$u" >> $1;
										echo "";
									fi;
									sleep $(((RANDOM % 3) + 1));
								fi;
							done;
						done;
					done;
				done;
			done;
		done;
	done;
done;
exit;
