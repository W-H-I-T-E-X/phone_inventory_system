
#!/bin/bash

entry(){

echo "
███████╗███╗   ██╗████████╗██████╗ ██╗   ██╗
██╔════╝████╗  ██║╚══██╔══╝██╔══██╗╚██╗ ██╔╝
█████╗  ██╔██╗ ██║   ██║   ██████╔╝ ╚████╔╝
██╔══╝  ██║╚██╗██║   ██║   ██╔══██╗  ╚██╔╝
███████╗██║ ╚████║   ██║   ██║  ██║   ██║
╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝
	
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
" |lolcat
echo ""
echo "

1) ℙ 𝕌 ℝ ℂ ℍ 𝔸 𝕊 𝔼 
	
2) 𝕊 𝔸 𝕃 𝔼 𝕊

3) 𝔽 𝕌 ℕ 𝔻 𝕊
	
4) ℂ 𝕌 𝕊 𝕋 𝕆 𝕄 𝔼 ℝ 𝕊
	
5) 𝕊 - 𝔸 ℂ ℂ 𝔼 𝕊 𝕊 𝕆 ℝ 𝕀 𝔼 𝕊
	
6) ℙ - 𝔸 ℂ ℂ 𝔼 𝕊 𝕊 𝕆 ℝ 𝕀 𝔼 𝕊
	
7) 𝔼 𝕏 ℙ 𝔸 ℕ 𝕊 𝔼 𝕊
	
8) ℝ 𝔼 ℙ 𝔸 𝕀 ℝ

9) 𝔹 𝔸 ℕ 𝕂  ℂ ℍ 𝔸 ℝ 𝔾 𝔼 𝕊

10) 𝕊 𝔸 𝕃 𝔸 ℝ 𝕐

11) ℙ 𝔸 ℝ 𝕋 𝕊

12) ℙ 𝔼 𝕋 ℝ 𝕆 𝕃

13) 𝔸 ℂ ℂ _ 𝕊 𝕋 𝕆 ℂ 𝕂
"|lolcat -t --spread=10 --freq=0.2	
#10)  𝕃 𝔸 ℙ 𝕋 𝕆 ℙ   𝕊 𝕋 𝕆 ℂ 𝕂
	
#11) 𝕃 𝔸 ℙ 𝕋 𝕆 ℙ   ℙ 𝕌 ℝ ℂ ℍ 𝔸 𝕊 𝔼
	
#12) 𝕃 𝔸 ℙ 𝕋 𝕆 ℙ  𝕊 𝔸 𝕃 𝔼 𝕊

echo ""
read -p "===> " n
	
case $n in
		
		1)
			p_entry
			;;

		2)	
			s_entry
			;;

		3)
			funds
			;;
		4)
			cp_entry
			;;
		5)
			s_acc_entry
			;;
		6)
			p_acc_entry
			;;
		7)
			exp_entry
			;;
		8)
			repair_entry
			;;
		9)
			charge
			;;
		10) 
			sal
			;;
		11)
			parts
			;;
		12)
			petrol
			;;
		13)
			acc_stock
			;;
		
#		10)
#			laptop_stock_entry
#			;;
#		11)
#			laptop_pur_entry
#			;;
#		12)
#			laptop_sale_entry
#			;;
		.)	
			start
			;;
		*)
			echo "INVALID CHOICE"
			;;
	esac
}


petrol(){

echo " "
echo " "
echo -e "
██████╗ ███████╗████████╗██████╗  ██████╗ ██╗     
██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║     
██████╔╝█████╗     ██║   ██████╔╝██║   ██║██║     
██╔═══╝ ██╔══╝     ██║   ██╔══██╗██║   ██║██║     
██║     ███████╗   ██║   ██║  ██║╚██████╔╝███████╗
╚═╝     ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝
                                                  
"|lolcat

echo " "
echo " "
echo -e -n "DATE => "|lolcat
read da
echo -e -n "NAME => "|lolcat
read n
echo -e -n "START => "|lolcat
read s
echo -e -n "END => "|lolcat
read e
k=$(( e - s ))
t=$(( k * 3 ))
mo=$(date +%m)
d="${mo}-${da}"


sudo mariadb -D cashphones -e "insert into petrol values ('2025-${d}','${n}','${s}',${e},'${k}','${t}');"
sudo mariadb -D cashphones -e "select * from petrol where DATE LIKE '2025-${d}';" 
echo " "
echo ""
echo "1) REPEAT"|lolcat
echo ""
echo "2) TOTAL PETROL"|lolcat
echo ""

read -p "⋟⋟⋟⋟ " n

case $n in
	1)
		petrol
		;;
	2)
		echo -e -n "START DATE => "|lolcat
		read sd
		echo -e -n "END DATE => "|lolcat
		read ed
		echo -e -n "NAME => "|lolcat
		read na
				
		sudo mariadb -D cashphones -e "select sum(TOTAL) AS TOTAL_PETROL_AMT,MIN(DATE) AS START_DATE,MAX(DATE) AS END_DATE FROM petrol WHERE DATE BETWEEN '2025-${sd}' AND '2025-${ed}' and NAME='${na}'"; 
		;;
	*)
		echo "INVALID CHOICE"
		;;
esac

}

acc_stock(){

echo " "
echo " "
echo " "
echo -e -n "DATE => "|lolcat
read da
sudo mariadb -D cashphones -e "select * from acc_stock order by ORDER_ID DESC LIMIT 1;"
echo -e -n "ORDER_ID => "|lolcat
read o
echo -e -n "NAME => "|lolcat
read n
echo -e -n "P_PRICE => "|lolcat
read p
echo -e -n "QNTY => "|lolcat
read q
mo=$(date +%m)
d="${mo}-${da}"


sudo mariadb -D cashphones -e "insert into acc_stock (DATE,ORDER_ID,NAME,P_PRICE,QNTY) values('2025-${d}',${o},'${n}',${p},${q})"
sudo mariadb -D cashphones -e "select * from acc_stock where DATE LIKE '2025-${d}';" 
acc_stock
}



p_entry(){

echo "
██████╗ ██╗   ██╗██████╗  ██████╗██╗  ██╗ █████╗ ███████╗███████╗    ███████╗███╗   ██╗████████╗██████╗ ██╗   ██╗
██╔══██╗██║   ██║██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝██╔════╝    ██╔════╝████╗  ██║╚══██╔══╝██╔══██╗╚██╗ ██╔╝
██████╔╝██║   ██║██████╔╝██║     ███████║███████║███████╗█████╗      █████╗  ██╔██╗ ██║   ██║   ██████╔╝ ╚████╔╝
██╔═══╝ ██║   ██║██╔══██╗██║     ██╔══██║██╔══██║╚════██║██╔══╝      ██╔══╝  ██║╚██╗██║   ██║   ██╔══██╗  ╚██╔╝
██║     ╚██████╔╝██║  ██║╚██████╗██║  ██║██║  ██║███████║███████╗    ███████╗██║ ╚████║   ██║   ██║  ██║   ██║
╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝    ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo -e -n "NAME => "|lolcat
read n
echo -e -n "STORAGE => "|lolcat
read s
echo -e -n "C_NAME => "|lolcat
read c
echo -e -n "IMEI => "|lolcat
read i
echo -e -n "DATE => "|lolcat
read da
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read ic
ic=${ic:-0}
echo -e -n "CASHIFY DELHI => "|lolcat
read cd
cd=${cd:-0}
echo -e -n "CASHIFY JAIPUR => "|lolcat
read cl
cl=${cl:-0}
echo -e -n "CASH => "|lolcat
read ca
ca=${ca:-0}
mo=$(date +%m)
d="${mo}-${da}"
m=$(date +%B)
t=$(echo "$a + $ic + 0 + $cd + $cl + $ca" | bc)
sudo mariadb -D cashphones -e "insert into stock values ('${o}','${n}','${s}','0',${t},'${i}','${m}');"

sudo mariadb -D cashphones  -e "insert into p_table (ORDER_ID, NAME, STORAGE, QNTY, C_NAME, IMEI, DATE, AXIS, ICICI, HDFC, CASHIFY_DEL, CASHIFY_LUK,CASHIFY_JAI, CASH, TOTAL) values ('${o}','${n}','${s}',1,'${c}','${i}','2025-${d}',${a},${ic},0,${cd},0,${cl},${ca},${t});"
echo " "
echo " "
echo "PURCHASE TABLE"
echo "--------------"
echo " "
sudo mariadb -D cashphones -e "select * from p_table where ORDER_ID = '${o}';"
echo " "
echo "STOCK TABLE"
echo "--------------"
echo " "
sudo mariadb -D cashphones -e "select * from stock where ORDER_ID = '${o}';"
echo " "
echo " "
p_entry
}

s_entry(){

echo "
███████╗ █████╗ ██╗     ███████╗███████╗    ███████╗███╗   ██╗████████╗██████╗ ██╗   ██╗
██╔════╝██╔══██╗██║     ██╔════╝██╔════╝    ██╔════╝████╗  ██║╚══██╔══╝██╔══██╗╚██╗ ██╔╝
███████╗███████║██║     █████╗  ███████╗    █████╗  ██╔██╗ ██║   ██║   ██████╔╝ ╚████╔╝
╚════██║██╔══██║██║     ██╔══╝  ╚════██║    ██╔══╝  ██║╚██╗██║   ██║   ██╔══██╗  ╚██╔╝
███████║██║  ██║███████╗███████╗███████║    ███████╗██║ ╚████║   ██║   ██║  ██║   ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝    ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo " "
echo "P TABLE"
echo "-------"
sudo mariadb -D cashphones -e "select * from p_table where ORDER_ID = '${o}';"
echo " "
echo -e -n "C_NAME => "|lolcat
read c
echo -e -n "DATE => "|lolcat
read da
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read ic
ic=${ic:-0}
echo -e -n "CASH => "|lolcat
read ca
ca=${ca:-0}
echo -e -n "PENDING => "|lolcat
read p
p=${p:-0}
t=$(( a + ic + 0 + ca + p ))
mo=$(date +%m)
d="${mo}-${da}"


sudo mariadb -D cashphones -e "insert into s_table (ORDER_ID, NAME, STORAGE, QNTY, C_NAME, IMEI, DATE,  AXIS, ICICI, HDFC, CASH, PENDING, TOTAL) select '${o}',NAME,STORAGE,1,'${c}',IMEI,'2025-${d}',${a},${ic},0,${ca},${p},${t} FROM p_table where ORDER_ID='${o}';"
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from s_table where ORDER_ID = '${o}';"
echo " "
echo " "
echo "STOCK TABLE"
echo "--------------"
echo " "
sudo mariadb -D cashphones -e "select * from stock where ORDER_ID = '${o}';" 
echo " "
sudo mariadb -D cashphones -e "set foreign_key_checks=0;delete from stock where QNTY=0;"
echo " "
s_entry
}

funds(){

echo "
███████╗██╗   ██╗███╗   ██╗██████╗ ███████╗
██╔════╝██║   ██║████╗  ██║██╔══██╗██╔════╝
█████╗  ██║   ██║██╔██╗ ██║██║  ██║███████╗
██╔══╝  ██║   ██║██║╚██╗██║██║  ██║╚════██║
██║     ╚██████╔╝██║ ╚████║██████╔╝███████║
╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚══════╝
                                           
"|lolcat
echo " "
echo ""
echo "1) FUNDS ADD"|lolcat
echo ""
echo "2) FUNDS SUBTRACT"|lolcat
echo ""

read -p "⋟⋟⋟⋟ " n

case $n in
	1)
		fadd
		;;
	2)
		fsub
		;;
	*)
		echo "INVALID CHOICE"
		;;
esac
}

fadd(){

echo "
███████╗██╗   ██╗███╗   ██╗██████╗ ███████╗     █████╗ ██████╗ ██████╗ 
██╔════╝██║   ██║████╗  ██║██╔══██╗██╔════╝    ██╔══██╗██╔══██╗██╔══██╗
█████╗  ██║   ██║██╔██╗ ██║██║  ██║███████╗    ███████║██║  ██║██║  ██║
██╔══╝  ██║   ██║██║╚██╗██║██║  ██║╚════██║    ██╔══██║██║  ██║██║  ██║
██║     ╚██████╔╝██║ ╚████║██████╔╝███████║    ██║  ██║██████╔╝██████╔╝
╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚═════╝ ╚═════╝ 
                                                                       
"|lolcat
echo " "
echo -e -n "DATE => "|lolcat
read ma
echo -e -n "NAME => "|lolcat
read n
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "HDFC => "|lolcat
read h
h=${h:-0}
echo -e -n "ICICI => "|lolcat
read i
i=${i:-0}
echo -e -n "CASHIFY_DEL => "|lolcat
read d
d=${d:-0}
echo -e -n "CASHIFY_JAI => "|lolcat
read l
l=${l:-0}
t=$(( c + a + h + i + d + l ))

mo=$(date +%m)
m="${mo}-${ma}"

sudo mariadb -D cashphones -e "insert into fund_add (DATE, NAME, CASH, AXIS, HDFC, ICICI, CASHIFY_DEL, CASHIFY_LUK,CASHIFY_JAI, TOTAL) values ('2025-${m}','${n}',${c},${a},${h},${i},${d},0,${l},${t})";
echo " "
echo "
███████╗██╗   ██╗███╗   ██╗██████╗ ███████╗    ███████╗██╗   ██╗██████╗ ████████╗██████╗  █████╗  ██████╗████████╗
██╔════╝██║   ██║████╗  ██║██╔══██╗██╔════╝    ██╔════╝██║   ██║██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝
█████╗  ██║   ██║██╔██╗ ██║██║  ██║███████╗    ███████╗██║   ██║██████╔╝   ██║   ██████╔╝███████║██║        ██║   
██╔══╝  ██║   ██║██║╚██╗██║██║  ██║╚════██║    ╚════██║██║   ██║██╔══██╗   ██║   ██╔══██╗██╔══██║██║        ██║   
██║     ╚██████╔╝██║ ╚████║██████╔╝███████║    ███████║╚██████╔╝██████╔╝   ██║   ██║  ██║██║  ██║╚██████╗   ██║   
╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚══════╝    ╚══════╝ ╚═════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   
                                                                                                                                                                                       
"|lolcat
echo " "
echo -e -n "NAME => "|lolcat
read nn
echo -e -n "CASH => "|lolcat
read cc
cc=${cc:-0}
echo -e -n "AXIS => "|lolcat
read aa
aa=${aa:-0}
echo -e -n "ICICI => "|lolcat
read ii
ii=${ii:-0}
tt=$(( cc + aa  + ii  ))
sudo mariadb -D cashphones -e "insert into fund_sub (DATE, NAME, CASH, AXIS, HDFC, ICICI, CASHIFY_DEL, CASHIFY_LUK,CASHIFY_JAI, TOTAL) values ('2025-${m}','${nn}',${cc},${aa},0,${ii},0,0,0,${tt})";
echo " "
echo "[FUND ADD]"
echo " "
sudo mariadb -D cashphones -e "select * from fund_add where DATE LIKE '2025-${m}'";
echo " "
echo "[FUND SUB]"
echo " "
sudo mariadb -D cashphones -e "select * from fund_sub where DATE LIKE '2025-${m}'";
echo " "

funds
}

fsub(){

echo "
███████╗██╗   ██╗███╗   ██╗██████╗ ███████╗    ███████╗██╗   ██╗██████╗ ████████╗██████╗  █████╗  ██████╗████████╗
██╔════╝██║   ██║████╗  ██║██╔══██╗██╔════╝    ██╔════╝██║   ██║██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝
█████╗  ██║   ██║██╔██╗ ██║██║  ██║███████╗    ███████╗██║   ██║██████╔╝   ██║   ██████╔╝███████║██║        ██║   
██╔══╝  ██║   ██║██║╚██╗██║██║  ██║╚════██║    ╚════██║██║   ██║██╔══██╗   ██║   ██╔══██╗██╔══██║██║        ██║   
██║     ╚██████╔╝██║ ╚████║██████╔╝███████║    ███████║╚██████╔╝██████╔╝   ██║   ██║  ██║██║  ██║╚██████╗   ██║   
╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚══════╝    ╚══════╝ ╚═════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   
                                                                                                                                                                                       
"|lolcat
echo " "
echo -e -n "DATE => "|lolcat
read ma
echo -e -n "NAME => "|lolcat
read n
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "HDFC => "|lolcat
read h
h=${h:-0}
echo -e -n "ICICI => "|lolcat
read i
i=${i:-0}
echo -e -n "CASHIFY_DEL => "|lolcat
read d
d=${d:-0}
echo -e -n "CASHIFY_LUK => "|lolcat
read l
l=${l:-0}
t=$(( c + a + h + i + d + l ))
#echo -e -n "TORAL_PRICE => "|lolcat
#read t
mo=$(date +%m)
m="${mo}-${ma}"

sudo mariadb -D cashphones -e "insert into fund_sub (DATE, NAME, CASH, AXIS, HDFC, ICICI, CASHIFY_DEL, CASHIFY_LUK, TOTAL) values ('2025-${m}','${n}',${c},${a},${h},${i},${d},${l},${t})";
echo " "
sudo mariadb -D cashphones -e "select * from fund_sub";
echo " "
funds
}

cp_entry(){

echo "
██████╗        ██████╗██╗   ██╗███████╗████████╗ ██████╗ ███╗   ███╗███████╗██████╗ ███████╗
██╔══██╗      ██╔════╝██║   ██║██╔════╝╚══██╔══╝██╔═══██╗████╗ ████║██╔════╝██╔══██╗██╔════╝
██████╔╝█████╗██║     ██║   ██║███████╗   ██║   ██║   ██║██╔████╔██║█████╗  ██████╔╝███████╗
██╔═══╝ ╚════╝██║     ██║   ██║╚════██║   ██║   ██║   ██║██║╚██╔╝██║██╔══╝  ██╔══██╗╚════██║
██║           ╚██████╗╚██████╔╝███████║   ██║   ╚██████╔╝██║ ╚═╝ ██║███████╗██║  ██║███████║
╚═╝            ╚═════╝ ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo "
██████╗ ███████╗████████╗ █████╗ ██╗██╗     ███████╗
██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██║██║     ██╔════╝
██║  ██║█████╗     ██║   ███████║██║██║     ███████╗
██║  ██║██╔══╝     ██║   ██╔══██║██║██║     ╚════██║
██████╔╝███████╗   ██║   ██║  ██║██║███████╗███████║
╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
echo -e -n "ID => "|lolcat
read o
echo " "
sudo mariadb -D cashphones -e "select * from p_table where ORDER_ID = '${o}';"
echo " "
echo -e -n "IMEI => "|lolcat
read i
echo -e -n "CUSTOMER NAME => "|lolcat
read c
echo -e -n "PHONE NO => "|lolcat
read n
echo -e -n "ADHAR => "|lolcat
read a
echo -e -n "PAN => "|lolcat
read p


sudo mariadb -D cashphones -e "insert into cp values (${o},'${i}','${c}',${n},'${a}','${p}');" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from cp where IMEI = '${i}';"
echo " "
echo " "
cp_entry
}

s_acc_entry(){

echo " "
echo "
███████╗     █████╗  ██████╗ ██████╗
██╔════╝    ██╔══██╗██╔════╝██╔════╝
███████╗    ███████║██║     ██║
╚════██║    ██╔══██║██║     ██║
███████║    ██║  ██║╚██████╗╚██████╗
╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat

echo ""
echo -e -n "DATE EXAMPLE = 02-22" |lolcat
echo ""
echo -e -n "SCH NAME => "|lolcat
read sn
echo " "
sudo mariadb -D cashphones -e "select * from acc_stock where NAME LIKE '%${sn}%';"
echo " "
echo -e -n "DATE => "|lolcat
read da
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo ""
echo -e -n "QNTY => "|lolcat
read q
echo ""
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read i
i=${i:-0}
echo ""
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}
echo ""
#echo -e -n "P_PRICE => "|lolcat
#read p
#echo ""
mo=$(date +%m)
d="${mo}-${da}"

#tp=$(( a  + i + c - p ))
#t=$(( a  + i + c ))
sudo mariadb -D cashphones -e "update acc_stock set QNTY= QNTY - ${q} where ORDER_ID=${o};"
echo ""
echo ""
sudo mariadb -D cashphones -e "insert into s_acc (DATE,ORDER_ID,NAME,QNTY,AXIS,ICICI,CASH,P_PRICE,TOTAL_PROFIT)  select '2025-${d}',${o},NAME,${q},${a},${i},${c},P_PRICE,${a}+${i}+${c}-P_PRICE from acc_stock where ORDER_ID=${o};"
echo " "
echo " "
echo "SALE ACC TABLE"
sudo mariadb -D cashphones -e "select * from s_acc where ORDER_ID=${o};"
echo " "
echo " STOCK ACC TABLE"
sudo mariadb -D cashphones -e "select * from acc_stock where ORDER_ID=${o};"
echo " "
echo " "

s_acc_entry
}

p_acc_entry(){
echo " "
echo "
██████╗      █████╗  ██████╗ ██████╗
██╔══██╗    ██╔══██╗██╔════╝██╔════╝
██████╔╝    ███████║██║     ██║
██╔═══╝     ██╔══██║██║     ██║
██║         ██║  ██║╚██████╗╚██████╗
╚═╝         ╚═╝  ╚═╝ ╚═════╝ ╚═════╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat

echo " "
echo "DATE EXAMPLE = 02-22"
echo " "
echo -e -n "SCH NAME => "|lolcat
read sn
echo " "
sudo mariadb -D cashphones -e "select * from acc_stock where NAME LIKE '%${sn}%';"

echo " "
echo -e -n "DATE => "|lolcat
read da
echo -e -n "ORDER_ID => "|lolcat
read o
echo -e -n "QNTY => "|lolcat
read q
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read i
i=${i:-0}
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}
echo -e -n "PENDING => "|lolcat
read p
p=${p:-0}
mo=$(date +%m)
d="${mo}-${da}"

t=$(( a + 0 + i + c ))
sudo mariadb -D cashphones -e "update acc_stock set QNTY= QNTY + ${q} where ORDER_ID=${o};"
echo ""
sudo mariadb -D cashphones -e "insert into p_acc (DATE,ORDER_ID,NAME,QNTY,AXIS,ICICI,CASH,PENDING,TOTAL)  select '2025-${d}',${o},NAME,${q},${a},${i},${c},${p},${a}+${i}+${c} from acc_stock where ORDER_ID=${o};"
echo " "
echo " "
echo "P ACC TABLE"
sudo mariadb -D cashphones -e "select * from p_acc where ORDER_ID=${o};"
echo " "
echo " STOCK ACC TABLE"
sudo mariadb -D cashphones -e "select * from acc_stock where ORDER_ID=${o};"
echo " "

echo " "
echo " "

p_acc_entry
}

exp_entry(){

echo " "
echo "
███████╗██╗  ██╗██████╗ ███████╗███╗   ██╗███████╗███████╗███████╗
██╔════╝╚██╗██╔╝██╔══██╗██╔════╝████╗  ██║██╔════╝██╔════╝██╔════╝
█████╗   ╚███╔╝ ██████╔╝█████╗  ██╔██╗ ██║███████╗█████╗  ███████╗
██╔══╝   ██╔██╗ ██╔═══╝ ██╔══╝  ██║╚██╗██║╚════██║██╔══╝  ╚════██║
███████╗██╔╝ ██╗██║     ███████╗██║ ╚████║███████║███████╗███████║
╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝╚══════╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat

echo " "
echo "DATE EXAMPLE = 22"
echo " "
echo -e -n "DATE => "|lolcat
read oa
echo -e -n "NAME => "|lolcat
read n
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read h
h=${h:-0}
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}
mo=$(date +%m)
o="${mo}-${oa}"

#t=$(( a + h + 0 + c ))
t=$(echo "$a + $h  + $c" | bc)



sudo mariadb -D cashphones -e "insert into exp values ('2025-${o}','${n}',${a},${h},${c},${t});" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from exp where DATE like '%2025-${o}%';"
echo " "
echo " "

exp_entry
}

repair_entry(){

echo " "
echo "
██████╗ ███████╗██████╗  █████╗ ██╗██████╗
██╔══██╗██╔════╝██╔══██╗██╔══██╗██║██╔══██╗
██████╔╝█████╗  ██████╔╝███████║██║██████╔╝
██╔══██╗██╔══╝  ██╔═══╝ ██╔══██║██║██╔══██╗
██║  ██║███████╗██║     ██║  ██║██║██║  ██║
╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat

echo " "
echo "DATE EXAMPLE = 22"
echo " "
echo -e -n "DATE => "|lolcat
read oa
echo -e -n "NAME => "|lolcat
read n
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read ic
ic=${ic:-0}
echo -e -n "CASH => "|lolcat
read ca
ca=${ca:-0}
mo=$(date +%m)
o="${mo}-${oa}"

t=$(echo $a + $ic + 0 + $ca  |bc)

sudo mariadb -D cashphones -e "insert into repair (DATE,NAME,AXIS,ICICI,CASH) values ('2025-${o}','${n}',${a},${ic},${ca});"
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from repair where DATE like  '%2025-${o}%';" 
echo " "
echo " "

repair_entry
}

charge(){
echo " "
echo "
██████╗  █████╗ ███╗   ██╗██╗  ██╗     ██████╗██╗  ██╗ █████╗ ██████╗  ██████╗ ███████╗███████╗
██╔══██╗██╔══██╗████╗  ██║██║ ██╔╝    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔════╝ ██╔════╝██╔════╝
██████╔╝███████║██╔██╗ ██║█████╔╝     ██║     ███████║███████║██████╔╝██║  ███╗█████╗  ███████╗
██╔══██╗██╔══██║██║╚██╗██║██╔═██╗     ██║     ██╔══██║██╔══██║██╔══██╗██║   ██║██╔══╝  ╚════██║
██████╔╝██║  ██║██║ ╚████║██║  ██╗    ╚██████╗██║  ██║██║  ██║██║  ██║╚██████╔╝███████╗███████║
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
                                                                                               
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat

echo " "
echo "DATE EXAMPLE = 01-22"
echo " "
echo -e -n "DATE => "|lolcat
read oa
echo -e -n "NAME => "|lolcat
read n
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read h
h=${h:-0}
t=$(echo "$a + $h " | bc)
mo=$(date +%m)
o="${mo}-${oa}"




sudo mariadb -D cashphones -e "insert into charges values ('2025-${o}','${n}',${a},${h},${t});"
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from charges where DATE like '%2025-${o}%';"
echo " "
echo " "

charge
}

sal(){

echo " "
echo "
███████╗ █████╗ ██╗      █████╗ ██████╗ ██╗   ██╗
██╔════╝██╔══██╗██║     ██╔══██╗██╔══██╗╚██╗ ██╔╝
███████╗███████║██║     ███████║██████╔╝ ╚████╔╝ 
╚════██║██╔══██║██║     ██╔══██║██╔══██╗  ╚██╔╝  
███████║██║  ██║███████╗██║  ██║██║  ██║   ██║   
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   
                                                 
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat

echo " "
echo "DATE EXAMPLE = 01-22"
echo " "
echo -e -n "DATE => "|lolcat
read da
echo -e -n "NAME => "|lolcat
read n
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read h
h=${h:-0}
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}
mo=$(date +%m)
d="${mo}-${da}"

#t=$(( a + h + 0 + c ))
t=$(echo "$a + $h + $c" | bc)



sudo mariadb -D cashphones -e "insert into sal values ('2025-${d}','${n}',${a},${h},${c},${t});"
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from sal where DATE like '%2025-${o}%';" 
echo " "
echo " "

sal
}

parts(){

echo " "
echo "
██████╗  █████╗ ██████╗ ████████╗███████╗
██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝
██████╔╝███████║██████╔╝   ██║   ███████╗
██╔═══╝ ██╔══██║██╔══██╗   ██║   ╚════██║
██║     ██║  ██║██║  ██║   ██║   ███████║
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
                                                                                      
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat

echo " "
echo "DATE EXAMPLE = 01-22"
echo " "
echo -e -n "DATE => "|lolcat
read da
echo " "
echo -e -n "NAME => "|lolcat
read n
echo " "
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo " "
echo -e -n "ICICI => "|lolcat
read h
h=${h:-0}
echo " "
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}
mo=$(date +%m)
d="${mo}-${da}"

#t=$(( a + h + 0 + c ))
t=$(echo "$a + $h + $c" | bc)



sudo mariadb -D cashphones -e "insert into parts values ('2025-${d}','${n}',${a},${h},${c},${t});"
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from parts where DATE like '%2025-${o}%';" 
echo " "
echo " "

parts
}


search(){

echo "
███████╗███████╗ █████╗ ██████╗  ██████╗██╗  ██╗
██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║  ██║
███████╗█████╗  ███████║██████╔╝██║     ███████║
╚════██║██╔══╝  ██╔══██║██╔══██╗██║     ██╔══██║
███████║███████╗██║  ██║██║  ██║╚██████╗██║  ██║
╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo ""
echo "
1) 𝕆 ℝ 𝔻 𝔼 ℝ _ 𝕀 𝔻

2) 𝔻 𝔸 𝕋 𝔼 

3) 𝔸 𝕃 𝕃

"|lolcat -t --spread=10 --freq=0.2
echo ""
read -p "===> " n

case $n in
	1)
		p_id
		;;
	2)
		p_date
		;;
	3)
		sall
		;;
	.)
		start
		;;
	*)
		echo "INVALID CHOICE"
		;;
	esac
}


p_id(){

echo "
 ██████╗ ██████╗ ██████╗ ███████╗██████╗         ██╗██████╗ 
██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗        ██║██╔══██╗
██║   ██║██████╔╝██║  ██║█████╗  ██████╔╝        ██║██║  ██║
██║   ██║██╔══██╗██║  ██║██╔══╝  ██╔══██╗        ██║██║  ██║
╚██████╔╝██║  ██║██████╔╝███████╗██║  ██║███████╗██║██████╔╝
 ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═════╝ 
                                                            
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
echo -e -n "ID => "|lolcat
read n
echo "STOCK TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from stock where ORDER_ID = ${n};"
echo " "
echo "PURCHASE TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from p_table where ORDER_ID = ${n};" 
echo " "
echo "SALES TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from s_table where ORDER_ID = ${n};"
echo " "
echo " "
p_id
}

p_date(){

echo "
 ██████╗  █████╗ ████████╗███████╗
 ██╔══██╗██╔══██╗╚══██╔══╝██╔════╝
 ██║  ██║███████║   ██║   █████╗
 ██║  ██║██╔══██║   ██║   ██╔══╝
 ██████╔╝██║  ██║   ██║   ███████╗
 ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo "FORMAT EXAMPLE => 01-01 "
echo " "
echo -e -n "DATE => "|lolcat
read n
echo "PURCHASE TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from p_table where DATE LIKE '2025-${n}%';"
echo " "
echo "SALES TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from s_table where DATE LIKE '2025-${n}%';" 
echo " "
echo "P_ACC TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from p_acc where DATE LIKE '2025-${n}%';" 
echo " "
echo "S_ACC TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from s_acc where DATE LIKE '2025-${n}%';" 
echo " "
echo "EXP TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from exp where DATE LIKE '2025-${n}%';" 
echo " "
echo "PENDING_REC TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from pen_rec where DATE LIKE '2025-${n}%';" 
echo " "
echo " "
echo "PENDING TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from pen_h where DATE LIKE '2025-${n}%';" 
echo " "
echo " "
echo "SALARY TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from sal where DATE LIKE '2025-${n}%';" 
echo " "
echo " "
echo "PARTS TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from parts where DATE LIKE '2025-${n}%';" 
echo " "
echo " "
echo "REPAIR"
echo " "
sudo mariadb -D cashphones -e "select * from repair where DATE LIKE '2025-${n}%';" 
echo " "
echo " "
echo "BANK CHARGES TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from charges where DATE LIKE '2025-${n}%';" 
echo " "
echo " "
echo "CASH BALANCE TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from bal where DATE LIKE '2025-${n}%';" 
echo " "
echo " "
echo "AXIS BAL TABLE"
echo " "
sudo mariadb -D cashphones -e "select * from axis where DATE LIKE '2025-${n}%';" 
echo " "
echo " "
p_date
}

sall(){

#!/bin/bash

DB="cashphones"

echo -e "FETCHING TABLES FROM '$DB'..." | lolcat
echo " "

# Get all tables
tables=$(sudo mariadb -D $DB -sN -e "SHOW TABLES;")
PS3=$'\n'"CHOOSE A TABLE => "

select table in $tables; do
  if [[ -n "$table" ]]; then
    break
  else
    echo "Invalid selection. Try again."
  fi
done

echo " "
echo -e "COLUMNS IN '$table':" | lolcat
echo " "

# Get and list column names
columns=$(sudo mariadb -D $DB -sN -e "SHOW COLUMNS FROM ${table};" | awk '{print $1}')
PS3=$'\n'"CHOOSE A COLUMN TO SEARCH => "

select col in $columns; do
  if [[ -n "$col" ]]; then
    break
  else
    echo "Invalid selection. Try again."
  fi
done

# Ask for search value
echo " "
echo -e -n "ENTER VALUE TO SEARCH IN '$col' (partial match) => " | lolcat
read value

echo " "
echo -e "SEARCHING FOR '$value' IN COLUMN '$col' OF TABLE '$table'..." | lolcat
echo " "

# Run the search using LIKE
sudo mariadb -D $DB -e "SELECT * FROM ${table} WHERE ${col} LIKE '%${value}%';"

echo " "
echo -e "✅ SEARCH COMPLETED" | lolcat

}



full(){

echo "
███████╗██╗   ██╗██╗     ██╗         ██╗   ██╗██╗███████╗██╗    ██╗
██╔════╝██║   ██║██║     ██║         ██║   ██║██║██╔════╝██║    ██║
█████╗  ██║   ██║██║     ██║         ██║   ██║██║█████╗  ██║ █╗ ██║
██╔══╝  ██║   ██║██║     ██║         ╚██╗ ██╔╝██║██╔══╝  ██║███╗██║
██║     ╚██████╔╝███████╗███████╗     ╚████╔╝ ██║███████╗╚███╔███╔╝
╚═╝      ╚═════╝ ╚══════╝╚══════╝      ╚═══╝  ╚═╝╚══════╝ ╚══╝╚══╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "

DB="cashphones"
YEAR="2025"

# Get all tables
echo -e "📦 TABLES IN DATABASE '$DB':" | lolcat
tables=$(sudo mariadb -D $DB -sN -e "SHOW TABLES;")
PS3=$'\n'"CHOOSE A TABLE => "

select table in $tables; do
  if [[ -n "$table" ]]; then
    break
  else
    echo "Invalid table. Try again."
  fi
done

# Month list
months=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
PS3=$'\n'"CHOOSE A MONTH => "

select month in "${months[@]}"; do
  case $REPLY in
    1) MM="01"; break ;;
    2) MM="02"; break ;;
    3) MM="03"; break ;;
    4) MM="04"; break ;;
    5) MM="05"; break ;;
    6) MM="06"; break ;;
    7) MM="07"; break ;;
    8) MM="08"; break ;;
    9) MM="09"; break ;;
   10) MM="10"; break ;;
   11) MM="11"; break ;;
   12) MM="12"; break ;;
    *) echo "Invalid month. Try again." ;;
  esac
done

# Construct date range
START="${YEAR}-${MM}-01"
END="${YEAR}-${MM}-31"

# Confirm date column exists in the table
has_date=$(sudo mariadb -D $DB -sN -e "SHOW COLUMNS FROM ${table} LIKE 'DATE';")

if [[ -z "$has_date" ]]; then
  echo -e "❌ The table '$table' does not have a 'DATE' column." | lolcat
  exit 1
fi

# Display rows in date range
echo " "
echo -e "🗓️  DISPLAYING ROWS FROM '$table' WHERE DATE BETWEEN '$START' AND '$END'" | lolcat
echo " "
sudo mariadb -D $DB -e "SELECT * FROM ${table} WHERE DATE BETWEEN '${START}' AND '${END}';"

echo " "
echo -e -n "1) REPEAT" | lolcat
echo -e -n " "
echo -e -n "2) BACK" |lolcat
echo " "
echo -e -n "==> "
read b
case $b in
	1)
	
		full
		;;
	2)
		start
		;;
esac
}

update(){

echo "
██╗   ██╗██████╗ ██████╗  █████╗ ████████╗██╗███╗   ██╗ ██████╗
██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██║████╗  ██║██╔════╝
██║   ██║██████╔╝██║  ██║███████║   ██║   ██║██╔██╗ ██║██║  ███╗
██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██║██║╚██╗██║██║   ██║
╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ██║██║ ╚████║╚██████╔╝
 ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
echo -e "CHOOSE TABLE NAME:" | lolcat
select n in p_table s_table p_acc s_acc repair exp parts charges sal; do
  if [[ -n "$n" ]]; then
    break
  else
    echo "Invalid selection. Try again."
  fi
done

# Step 1: Get all columns
columns=$(sudo mariadb -D cashphones -sN -e "SHOW COLUMNS FROM ${n};" | awk '{print $1}')
echo " "

# Step 2: Ask which column to use for identifying the row (ID/DATE/etc.)
echo -e "CHOOSE IDENTIFIER COLUMN TO SEARCH BY:" | lolcat
select id_column in $columns; do
  if [[ -n "$id_column" ]]; then
    break
  else
    echo "Invalid column. Try again."
  fi
done

# Step 3: Get the ID value
echo -e -n "VALUE OF '$id_column' => " | lolcat
read id_value
echo " "
echo -e "MATCHING ROW BEFORE UPDATE:" | lolcat
sudo mariadb -D cashphones -e "SELECT * FROM ${n} WHERE ${id_column} = '${id_value}';"
echo " "

# Step 4: Ask which column to update
echo -e "CHOOSE COLUMN TO UPDATE:" | lolcat
select c in $columns; do
  if [[ -n "$c" ]]; then
    break
  else
    echo "Invalid column. Try again."
  fi
done

# Step 5: Get new value
echo -e -n "NEW VALUE FOR '$c' => " | lolcat
read v

# Step 6: Perform the update
sudo mariadb -D cashphones -e "UPDATE ${n} SET ${c}='${v}' WHERE ${id_column} = '${id_value}';"

# Step 7: Show updated row based on the correct logic
echo " "
echo -e "UPDATED RESULT:" | lolcat
if [[ "$c" == "$id_column" ]]; then
  echo -e "→ Identifier column was updated, using new value to fetch row." | lolcat
  sudo mariadb -D cashphones -e "SELECT * FROM ${n} WHERE ${c} = '${v}';"
else
  sudo mariadb -D cashphones -e "SELECT * FROM ${n} WHERE ${id_column} = '${id_value}';"
fi

# Step 8: Ask to repeat or go back
echo " "
echo -e "1) REPEAT" | lolcat
echo -e "2) BACK" | lolcat
echo " "
echo -e -n "==> "
read b
case $b in
  1)
    exec "$0"
    ;;
  2)
    start
    ;;
  *)
    echo "Invalid option"
    ;;
esac
}

delete(){

echo "
██████╗ ███████╗██╗     ███████╗████████╗███████╗██╗███╗   ██╗ ██████╗
██╔══██╗██╔════╝██║     ██╔════╝╚══██╔══╝██╔════╝██║████╗  ██║██╔════╝
██║  ██║█████╗  ██║     █████╗     ██║   █████╗  ██║██╔██╗ ██║██║  ███╗
██║  ██║██╔══╝  ██║     ██╔══╝     ██║   ██╔══╝  ██║██║╚██╗██║██║   ██║
██████╔╝███████╗███████╗███████╗   ██║   ███████╗██║██║ ╚████║╚██████╔╝
╚═════╝ ╚══════╝╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "

DB="cashphones"

echo -e "🗃️ TABLES IN DATABASE '$DB':" | lolcat
tables=$(sudo mariadb -D $DB -sN -e "SHOW TABLES;")
PS3=$'\n'"CHOOSE A TABLE => "

select table in $tables; do
  if [[ -n "$table" ]]; then
    break
  else
    echo "Invalid selection. Try again."
  fi
done

echo " "
echo -e "📋 COLUMNS IN '$table':" | lolcat
columns=$(sudo mariadb -D $DB -sN -e "SHOW COLUMNS FROM ${table};" | awk '{print $1}')
count=1
for col in $columns; do
  echo "$count) $col"
  ((count++))
done

# --------- First column match ----------
echo " "
echo -e -n "🔎 ENTER FIRST COLUMN NUMBER TO MATCH => " | lolcat
read col1_num
col1=$(echo "$columns" | sed -n "${col1_num}p")

if [[ -z "$col1" ]]; then
  echo -e "❌ Invalid column number" | lolcat
  exit 1
fi

echo -e -n "✏️ ENTER VALUE FOR '$col1' (LIKE) => " | lolcat
read val1

# --------- Second column match ----------
echo " "
echo -e -n "🔎 ENTER SECOND COLUMN NUMBER TO MATCH => " | lolcat
read col2_num
col2=$(echo "$columns" | sed -n "${col2_num}p")

if [[ -z "$col2" ]]; then
  echo -e "❌ Invalid column number" | lolcat
  exit 1
fi

echo -e -n "✏️ ENTER VALUE FOR '$col2' (LIKE) => " | lolcat
read val2

# --------- Show matching rows ----------
echo " "
echo -e "🔍 MATCHING ROWS TO DELETE FROM '$table':" | lolcat
query="SELECT * FROM ${table} WHERE ${col1} LIKE '%${val1}%' AND ${col2} LIKE '%${val2}%';"
echo -e "📝 $query" | lolcat
sudo mariadb -D $DB -e "$query"

# --------- Confirm and delete ----------
echo " "
echo -e -n "⚠️ ARE YOU SURE YOU WANT TO DELETE THESE ROWS? (yes/no): " | lolcat
read confirm

if [[ "$confirm" == "yes" ]]; then
  del_query="DELETE FROM ${table} WHERE ${col1} LIKE '%${val1}%' AND ${col2} LIKE '%${val2}%';"
  sudo mariadb -D $DB -e "$del_query"
  echo -e "\n🗑️ ROWS DELETED WHERE ${col1} LIKE '%${val1}%' AND ${col2} LIKE '%${val2}%'" | lolcat

  echo -e "\n📂 REMAINING MATCHING ROWS (IF ANY):" | lolcat
  sudo mariadb -D $DB -e "$query"
else
  echo -e "\n❎ DELETE CANCELLED." | lolcat
fi

echo " "

echo -e -n "1) REPEAT" | lolcat
echo -e -n " "
echo -e -n "2) BACK" |lolcat
echo " "
echo " "
echo -e -n "==> "
read b
case $b in
	1)
	
		delete
		;;
	2)
		start
		;;
esac
}


pending(){

echo "
███████╗██╗  ██╗ ██████╗ ██╗    ██╗    ██╗███████╗███╗   ██╗████████╗██████╗ ██╗   ██╗
██╔════╝██║  ██║██╔═══██╗██║    ██║   ██╔╝██╔════╝████╗  ██║╚══██╔══╝██╔══██╗╚██╗ ██╔╝
███████╗███████║██║   ██║██║ █╗ ██║  ██╔╝ █████╗  ██╔██╗ ██║   ██║   ██████╔╝ ╚████╔╝
╚════██║██╔══██║██║   ██║██║███╗██║ ██╔╝  ██╔══╝  ██║╚██╗██║   ██║   ██╔══██╗  ╚██╔╝
███████║██║  ██║╚██████╔╝╚███╔███╔╝██╔╝   ███████╗██║ ╚████║   ██║   ██║  ██║   ██║
╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚═╝    ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo ""
echo ""
echo "
1) SHOW

2) ENTRY

3) S_PENDING

4) ADVANCE

5) P_DELAY

6) P_SEND"|lolcat
echo ""
echo " "
read -p "⋟⋟⋟⋟ " n

case $n in
	1)
		pending_show
		;;
	2)
		pending_entry
		;;
	3)
		pen_h
		;;
	4)
		pen_a
		;;
	5)
		p_delay
		;;
	6)
		p_send
		;;
	
	.)
		start
		;;
	*)
		echo "INVALID CHOICE"
		;;
esac
}

pending_show(){

echo "
███████╗██╗   ██╗██╗     ██╗         ██╗   ██╗██╗███████╗██╗    ██╗
██╔════╝██║   ██║██║     ██║         ██║   ██║██║██╔════╝██║    ██║
█████╗  ██║   ██║██║     ██║         ██║   ██║██║█████╗  ██║ █╗ ██║
██╔══╝  ██║   ██║██║     ██║         ╚██╗ ██╔╝██║██╔══╝  ██║███╗██║
██║     ╚██████╔╝███████╗███████╗     ╚████╔╝ ██║███████╗╚███╔███╔╝
╚═╝      ╚═════╝ ╚══════╝╚══════╝      ╚═══╝  ╚═╝╚══════╝ ╚══╝╚══╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from pending union select '---------------','------------------------','-----------------------' from pending union select 'PENDING','TOTAL',sum(PENDING) from pending;"
echo " "
echo -e -n "ID => "|lolcat
read n

sudo mariadb -D cashphones -e "select * from s_table where ORDER_ID=${n};" 
sudo mariadb -D cashphones -e "select * from pending where ORDER_ID=${n};"

pending_show
}

pending_entry(){

echo " "
echo -e "
██████╗ ███████╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗
██╔══██╗██╔════╝████╗  ██║██╔══██╗██║████╗  ██║██╔════╝
██████╔╝█████╗  ██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗
██╔═══╝ ██╔══╝  ██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║
██║     ███████╗██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝
╚═╝     ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat

echo " "
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo " "
sudo mariadb -D cashphones -e "select * from s_table where ORDER_ID = '${o}';" 
echo " "

sudo mariadb -D cashphones -e "insert into pending (ORDER_ID,NAME,PENDING) select '${o}',NAME,PENDING FROM s_table where ORDER_ID='${o}';" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from pending where ORDER_ID = '${o}';" 
echo " "
echo " "

pending
}

pen_rec(){

echo "
██████╗ ███████╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗     ██████╗ ███████╗ ██████╗
██╔══██╗██╔════╝████╗  ██║██╔══██╗██║████╗  ██║██╔════╝     ██╔══██╗██╔════╝██╔════╝
██████╔╝█████╗  ██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗    ██████╔╝█████╗  ██║     
██╔═══╝ ██╔══╝  ██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║    ██╔══██╗██╔══╝  ██║     
██║     ███████╗██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝    ██║  ██║███████╗╚██████╗
╚═╝     ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═╝╚══════╝ ╚═════╝
" |lolcat
echo " "
echo -e -n "DATE => "|lolcat
read d
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo " "
sudo mariadb -D cashphones -e "select * from s_table where ORDER_ID = '${o}';"
echo " "
echo -e -n "NAME => "|lolcat
read n
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read i
i=${i:-0}
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}

t=$(echo "$a + $i + $c" |bc )
sudo mariadb -D cashphones -e "insert into pen_rec values ('2025-${d}','${o}','${n}',${a},${i},${c},${t});" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from pen_rec where ORDER_ID = '${o}';" 
echo " "
echo " "
pen_rec
}

pen_a(){

echo "
 █████╗ ██████╗ ██╗   ██╗ █████╗ ███╗   ██╗ ██████╗███████╗
██╔══██╗██╔══██╗██║   ██║██╔══██╗████╗  ██║██╔════╝██╔════╝
███████║██║  ██║██║   ██║███████║██╔██╗ ██║██║     █████╗  
██╔══██║██║  ██║╚██╗ ██╔╝██╔══██║██║╚██╗██║██║     ██╔══╝  
██║  ██║██████╔╝ ╚████╔╝ ██║  ██║██║ ╚████║╚██████╗███████╗
╚═╝  ╚═╝╚═════╝   ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
                                                           
                                                                                                                  
" |lolcat
echo " "
echo -e -n "DATE => "|lolcat
read d
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo "PURCHASE"
sudo mariadb -D cashphones -e "select * from p_table where ORDER_ID = '${o}';"
echo "SALE"
sudo mariadb -D cashphones -e "select * from s_table where ORDER_ID = '${o}';"
echo " "
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read i
i=${i:-0}
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}

sudo mariadb -D cashphones -e "insert into pen_h (DATE,ORDER_ID,NAME,PENDING,AXIS,ICICI,CASH) select '2025-${d}','${o}',NAME,0,${a},${i},${c} FROM s_table where ORDER_ID='${o}';" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from pen_h where ORDER_ID = '${o}';" 
echo " "
echo " "
echo "
 █████╗ ██████╗ ██╗   ██╗ █████╗ ███╗   ██╗ ██████╗███████╗    ██████╗ ███████╗ ██████╗
██╔══██╗██╔══██╗██║   ██║██╔══██╗████╗  ██║██╔════╝██╔════╝    ██╔══██╗██╔════╝██╔════╝
███████║██║  ██║██║   ██║███████║██╔██╗ ██║██║     █████╗      ██████╔╝█████╗  ██║     
██╔══██║██║  ██║╚██╗ ██╔╝██╔══██║██║╚██╗██║██║     ██╔══╝      ██╔══██╗██╔══╝  ██║     
██║  ██║██████╔╝ ╚████╔╝ ██║  ██║██║ ╚████║╚██████╗███████╗    ██║  ██║███████╗╚██████╗
╚═╝  ╚═╝╚═════╝   ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝    ╚═╝  ╚═╝╚══════╝ ╚═════╝
                                                                                       
" |lolcat
echo " "
echo -e -n "DATE => "|lolcat
read da
echo " "

t=$(echo "$a + $i + $c" |bc )
sudo mariadb -D cashphones -e "insert into pen_rec (DATE,ORDER_ID,NAME,AXIS,ICICI,CASH,TOTAL) select '2025-${da}','${o}',NAME,${a},${i},${c},${t} FROM s_table where ORDER_ID='${o}';" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from pen_rec where ORDER_ID = '${o}';" 
echo " "
pen_a
}


pen_h(){

echo "
██████╗ ███████╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗     ██╗  ██╗██╗███████╗████████╗ ██████╗ ██████╗ ██╗   ██╗
██╔══██╗██╔════╝████╗  ██║██╔══██╗██║████╗  ██║██╔════╝     ██║  ██║██║██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗╚██╗ ██╔╝
██████╔╝█████╗  ██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗    ███████║██║███████╗   ██║   ██║   ██║██████╔╝ ╚████╔╝ 
██╔═══╝ ██╔══╝  ██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║    ██╔══██║██║╚════██║   ██║   ██║   ██║██╔══██╗  ╚██╔╝  
██║     ███████╗██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝    ██║  ██║██║███████║   ██║   ╚██████╔╝██║  ██║   ██║   
╚═╝     ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═╝╚═╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
                                                                                                                  
" |lolcat
echo " "

echo -e -n "ORDER_ID => "|lolcat
read o
echo "PURCHASE"
sudo mariadb -D cashphones -e "select * from p_table where ORDER_ID = '${o}';"
echo "SALE"
sudo mariadb -D cashphones -e "select * from s_table where ORDER_ID = '${o}';"
echo " "
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read i
i=${i:-0}
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}

sudo mariadb -D cashphones -e "insert into pen_h (DATE,ORDER_ID,NAME,PENDING,AXIS,ICICI,CASH) select DATE,'${o}',NAME,0,${a},${i},${c} FROM s_table where ORDER_ID='${o}';" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from pen_h where ORDER_ID = '${o}';" 
echo " "
echo " "
echo "
██████╗ ███████╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗     ██████╗ ███████╗ ██████╗
██╔══██╗██╔════╝████╗  ██║██╔══██╗██║████╗  ██║██╔════╝     ██╔══██╗██╔════╝██╔════╝
██████╔╝█████╗  ██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗    ██████╔╝█████╗  ██║     
██╔═══╝ ██╔══╝  ██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║    ██╔══██╗██╔══╝  ██║     
██║     ███████╗██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝    ██║  ██║███████╗╚██████╗
╚═╝     ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═╝╚══════╝ ╚═════╝
" |lolcat
echo " "
echo -e -n "DATE => "|lolcat
read da
echo " "
mo=$(date +%m)
d="${mo}-${da}"
m=$(date +%B)

t=$(echo "$a + $i + $c" |bc )
sudo mariadb -D cashphones -e "insert into pen_rec (DATE,ORDER_ID,NAME,AXIS,ICICI,CASH,TOTAL) select '2025-${d}','${o}',NAME,${a},${i},${c},${t} FROM s_table where ORDER_ID='${o}';" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from pen_rec where ORDER_ID = '${o}';" 
echo " "
sudo mariadb -D cashphones -e "DELETE from pending where ORDER_ID = '${o}';"
echo " "
sudo mariadb -D cashphones -e "UPDATE s_table set PENDING=0 where ORDER_ID = '${o}';"
sudo mariadb -D cashphones -e "UPDATE s_table set CASH=CASH+${c},AXIS=AXIS+${a},ICICI=ICICI+${i} where ORDER_ID = '${o}';"
sudo mariadb -D cashphones -e "UPDATE s_table SET TOTAL = CASH  + AXIS  + ICICI  WHERE ORDER_ID='${o}';"
sudo mariadb -D cashphones -e "select * from s_table where ORDER_ID = '${o}';"
pen_h
}



p_delay(){

echo "
██████╗       ██████╗ ███████╗██╗      █████╗ ██╗   ██╗
██╔══██╗      ██╔══██╗██╔════╝██║     ██╔══██╗╚██╗ ██╔╝
██████╔╝█████╗██║  ██║█████╗  ██║     ███████║ ╚████╔╝ 
██╔═══╝ ╚════╝██║  ██║██╔══╝  ██║     ██╔══██║  ╚██╔╝  
██║           ██████╔╝███████╗███████╗██║  ██║   ██║   
╚═╝           ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   
                                                        
                                                                                                                  
" |lolcat
echo " "
echo -e -n "DATE => "|lolcat
read d
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo " "
sudo mariadb -D cashphones -e "select * from p_table where ORDER_ID = '${o}';" cashphones
echo " "
echo -e -n "NAME => "|lolcat
read n
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read i
i=${i:-0}

sudo mariadb -D cashphones -e "insert into p_delay values ('2025-${d}','${o}','${n}',${c},${a},${i});" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from p_delay where ORDER_ID = '${o}';" 
echo " "
echo " "
echo "
██████╗       ███████╗███████╗███╗   ██╗██████╗ 
██╔══██╗      ██╔════╝██╔════╝████╗  ██║██╔══██╗
██████╔╝█████╗███████╗█████╗  ██╔██╗ ██║██║  ██║
██╔═══╝ ╚════╝╚════██║██╔══╝  ██║╚██╗██║██║  ██║
██║           ███████║███████╗██║ ╚████║██████╔╝
╚═╝           ╚══════╝╚══════╝╚═╝  ╚═══╝╚═════╝ 
                                                
                                                                                                                  
" |lolcat
echo " "
echo -e -n "DATE => "|lolcat
read da
echo " "
sudo mariadb -D cashphones -e "insert into p_send values ('2025-${da}','${o}','${n}',${c},${a},${i});" 
echo " "
sudo mariadb -D cashphones -e "select * from p_send where ORDER_ID = '${o}';" 
echo " "
p_delay
}

p_send(){

echo "
██████╗       ███████╗███████╗███╗   ██╗██████╗ 
██╔══██╗      ██╔════╝██╔════╝████╗  ██║██╔══██╗
██████╔╝█████╗███████╗█████╗  ██╔██╗ ██║██║  ██║
██╔═══╝ ╚════╝╚════██║██╔══╝  ██║╚██╗██║██║  ██║
██║           ███████║███████╗██║ ╚████║██████╔╝
╚═╝           ╚══════╝╚══════╝╚═╝  ╚═══╝╚═════╝ 
                                                
                                                                                                                  
" |lolcat
echo " "
echo -e -n "DATE => "|lolcat
read d
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo " "
sudo mariadb -D cashphones -e "select * from p_table where ORDER_ID = '${o}';" 
echo " "
echo -e -n "NAME => "|lolcat
read n
echo -e -n "CASH => "|lolcat
read c
c=${c:-0}
echo -e -n "AXIS => "|lolcat
read a
a=${a:-0}
echo -e -n "ICICI => "|lolcat
read i
i=${i:-0}

sudo mariadb -D cashphones -e "insert into p_send values ('2025-${d}','${o}','${n}',${c},${a},${i});" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from p_send where ORDER_ID = '${o}';" 
echo " "
echo " "
p_send
}

total(){

echo "
████████╗ ██████╗ ████████╗ █████╗ ██╗
╚══██╔══╝██╔═══██╗╚══██╔══╝██╔══██╗██║
   ██║   ██║   ██║   ██║   ███████║██║
   ██║   ██║   ██║   ██║   ██╔══██║██║
   ██║   ╚██████╔╝   ██║   ██║  ██║███████╗
   ╚═╝    ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo ""
echo "

1) FULL TOTAL

2) TOTAL STOCK

3) TOTAL S_P
"|lolcat
echo " "
read -p "⋟⋟⋟⋟ " n

case $n in
	
	1)
		full_total
		;;
	
	2)
		stock_total
		;;
	3)
		sp_full
		;;
	.)
		start
		;;
	*)
		echo "INVALID CHOICE"
		;;
esac
}



full_total(){

echo "
███████╗██╗   ██╗██╗     ██╗         ████████╗ ██████╗ ████████╗ █████╗ ██╗     
██╔════╝██║   ██║██║     ██║         ╚══██╔══╝██╔═══██╗╚══██╔══╝██╔══██╗██║     
█████╗  ██║   ██║██║     ██║            ██║   ██║   ██║   ██║   ███████║██║     
██╔══╝  ██║   ██║██║     ██║            ██║   ██║   ██║   ██║   ██╔══██║██║     
██║     ╚██████╔╝███████╗███████╗       ██║   ╚██████╔╝   ██║   ██║  ██║███████╗
╚═╝      ╚═════╝ ╚══════╝╚══════╝       ╚═╝    ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝
                                                                                
"|lolcat
echo " "
echo " "
echo -e -n "MONTH => "|lolcat
read n

sudo mariadb -D cashphones -e "SELECT s.TOTAL_PHONE_SALE, sq.TOTAL_S_QNTY,p.TOTAL_PHONE_PURCHASE,pq.TOTAL_P_QNTY FROM (SELECT SUM(TOTAL) AS TOTAL_PHONE_SALE FROM s_table WHERE DATE LIKE '2025-${n}-%') s,(SELECT SUM(QNTY) AS TOTAL_S_QNTY FROM s_table WHERE DATE LIKE '2025-${n}-%') sq,(SELECT SUM(TOTAL) AS TOTAL_PHONE_PURCHASE FROM p_table WHERE DATE LIKE '2025-${n}-%') p ,(SELECT SUM(QNTY) AS TOTAL_P_QNTY FROM p_table WHERE DATE LIKE '2025-${n}-%') pq ;" 
echo " "
sudo mariadb -D cashphones -e "SELECT s.TOTAL_SALE_ACC,p.TOTAL_PURCHASE_ACC FROM (SELECT SUM(TOTAL) AS TOTAL_SALE_ACC FROM s_acc WHERE DATE LIKE '2025-${n}-%') s,(SELECT SUM(TOTAL) AS TOTAL_PURCHASE_ACC FROM p_acc WHERE DATE LIKE '2025-${n}-%') p ;" 
echo " "
sudo mariadb -D cashphones -e "SELECT s.TOTAL_REPAIR,p.TOTAL_PARTS FROM (SELECT SUM(TOTAL) AS TOTAL_REPAIR FROM repair WHERE DATE LIKE '2025-${n}-%') s,(SELECT SUM(TOTAL) AS TOTAL_PARTS FROM parts WHERE DATE LIKE '2025-${n}-%') p ;" 
echo " "

sudo mariadb -D cashphones -e "SELECT t.TOTAL_TEA,s.TOTAL_SALARY,r.TOTAL_RENT,p.TOTAL_PETROL,c.TOTAL_CONVENCE,b.TOTAL_BILL,o.OTHER_EXP FROM (SELECT SUM(TOTAL) AS TOTAL_TEA FROM exp WHERE DATE LIKE '2025-${n}-%' and (NAME LIKE '%TEA%' OR NAME LIKE '%COFF%')) t,(SELECT SUM(TOTAL) AS TOTAL_SALARY FROM sal WHERE DATE LIKE '2025-${n}-%') s,(SELECT SUM(TOTAL) AS TOTAL_RENT FROM exp WHERE DATE LIKE '2025-${n}-%' AND NAME LIKE '%RENT%') r,(SELECT SUM(TOTAL) AS TOTAL_PETROL FROM exp WHERE DATE LIKE '2025-${n}-%' AND NAME LIKE '%PETROL%') p,(SELECT SUM(TOTAL) AS TOTAL_CONVENCE FROM exp WHERE DATE LIKE '2025-${n}-%' AND (NAME LIKE '%POT%' OR NAME LIKE '%CONVEN%')) c,(SELECT SUM(TOTAL) AS TOTAL_BILL FROM exp WHERE DATE LIKE '2025-${n}-%' AND NAME LIKE '%BILL%') b,(SELECT SUM(TOTAL) AS OTHER_EXP FROM exp WHERE DATE LIKE '2025-${n}-%' AND LOWER(NAME) NOT LIKE '%TEA%' AND LOWER(NAME) NOT LIKE '%COF%' AND LOWER(NAME) NOT LIKE '%RENT%' AND LOWER(NAME) NOT LIKE '%PETROL%' AND LOWER(NAME) NOT LIKE '%POT%' AND LOWER(NAME) NOT LIKE '%CONV%' AND LOWER(NAME) NOT LIKE '%BILL%') o ;" 
echo " "

sudo mariadb -D cashphones -e "SELECT (SELECT SUM(TOTAL) FROM sal WHERE DATE LIKE '2025-${n}-%') + (SELECT SUM(TOTAL) FROM exp WHERE DATE LIKE '2025-${n}-%') AS EXP_GRAND_TOTAL ;"
echo " "

echo " "

total
}
stock_total(){

echo "
███████╗████████╗ ██████╗  ██████╗██╗  ██╗    ████████╗ ██████╗ ████████╗ █████╗ ██╗         ██████╗ ██████╗ ██╗ ██████╗███████╗
██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██║ ██╔╝    ╚══██╔══╝██╔═══██╗╚══██╔══╝██╔══██╗██║         ██╔══██╗██╔══██╗██║██╔════╝██╔════╝
███████╗   ██║   ██║   ██║██║     █████╔╝        ██║   ██║   ██║   ██║   ███████║██║         ██████╔╝██████╔╝██║██║     █████╗  
╚════██║   ██║   ██║   ██║██║     ██╔═██╗        ██║   ██║   ██║   ██║   ██╔══██║██║         ██╔═══╝ ██╔══██╗██║██║     ██╔══╝  
███████║   ██║   ╚██████╔╝╚██████╗██║  ██╗       ██║   ╚██████╔╝   ██║   ██║  ██║███████╗    ██║     ██║  ██║██║╚██████╗███████╗
╚══════╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝  ╚═╝       ╚═╝    ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚═╝     ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
                                                                                                                                

"|lolcat
#echo "EXAMPLE  04-30"
mo=$(date +%m)
o=$(date +%d)
today="2025-${mo}-${o}"

echo " "
#echo -e -n "DATE FOR PRINTOUT => "|lolcat
#read n
echo " "
sudo mariadb -D cashphones -e "select ROW_NUMBER() OVER (ORDER BY NAME) AS S_NO,ORDER_ID,NAME,P_PRICE,QNTY from stock  union SELECT '============','============','======================================','==========','=====' FROM stock union all select '$today','STOCK TABLE','<--------------> TOTAL <-------------->',SUM(P_PRICE),SUM(QNTY) FROM stock"; 
echo " "
echo " "
}

sp_full(){

echo "
███████╗      ██████╗     ████████╗ ██████╗ ████████╗ █████╗ ██╗         ██████╗ ██████╗ ██╗ ██████╗███████╗
██╔════╝      ██╔══██╗    ╚══██╔══╝██╔═══██╗╚══██╔══╝██╔══██╗██║         ██╔══██╗██╔══██╗██║██╔════╝██╔════╝
███████╗█████╗██████╔╝       ██║   ██║   ██║   ██║   ███████║██║         ██████╔╝██████╔╝██║██║     █████╗  
╚════██║╚════╝██╔═══╝        ██║   ██║   ██║   ██║   ██╔══██║██║         ██╔═══╝ ██╔══██╗██║██║     ██╔══╝  
███████║      ██║            ██║   ╚██████╔╝   ██║   ██║  ██║███████╗    ██║     ██║  ██║██║╚██████╗███████╗
╚══════╝      ╚═╝            ╚═╝    ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚═╝     ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
                                                                                                            
"|lolcat
echo " "
echo -e -n "1) SALE => " |lolcat
echo " "
echo -e -n "2) PURCHASE => " |lolcat
echo " "
read -p "==>" n
echo " "
case $n in
	1)
		echo -e -n "MONTH => "|lolcat
		read m
		sudo mariadb -D cashphones -e "select ROW_NUMBER() OVER (ORDER BY NAME) AS S_NO,DATE,ORDER_ID,NAME,TOTAL,QNTY from s_table WHERE DATE LIKE '2025-${m}-%' union select '=======','===========','======','============================','========','=====' from s_table union all SELECT '---->','SALES','TABLE','<---------> TOTAL <--------->',SUM(TOTAL),SUM(QNTY) FROM s_table WHERE DATE LIKE '2025-${m}-%';"
		;;
	2)
		echo -e -n "MONTH => "|lolcat
		read m
		sudo mariadb -D cashphones -e "select ROW_NUMBER() OVER (ORDER BY NAME) AS S_NO,DATE,ORDER_ID,NAME,TOTAL,QNTY from p_table WHERE DATE LIKE '2025-${m}-%' union select '=======','===========','=======','===================================','========','====' from p_table union all SELECT '---->','PURCHASE','TABLE','<------------> TOTAL <------------>',SUM(TOTAL),SUM(QNTY) FROM p_table WHERE DATE LIKE '2025-${m}-%';"
		;;		
esac
echo " "

echo " "
}

profit(){

echo "
██████╗ ██████╗  ██████╗ ███████╗██╗████████╗
██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║╚══██╔══╝
██████╔╝██████╔╝██║   ██║█████╗  ██║   ██║   
██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║   ██║   
██║     ██║  ██║╚██████╔╝██║     ██║   ██║   
╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝   ╚═╝   
"|lolcat
echo " "
echo " "
echo "EXAMPLE = 01"
echo ""
echo -e -n "ENTER THE MONTH NUMBER = "
read m
echo " "
echo "PHONE TABLE"
echo "-----------"
echo " "
sudo mariadb -D cashphones -e "select ROW_NUMBER() OVER (ORDER BY NAME) AS S_NO,s.ORDER_ID,s.NAME,s.TOTAL AS SALE_AMOUNT,p.TOTAL AS PURCHASE_AMOUNT,(s.TOTAL - p.TOTAL) AS PROFIT_AMOUNT FROM s_table s join p_table p on s.ORDER_ID = p.ORDER_ID where s.DATE like '2025-${m}%';" 
echo " "
sudo mariadb -D cashphones  -e "select sum(s.TOTAL) as TOTAL_SALE,SUM(p.TOTAL) AS TOTAL_PUR,SUM(s.TOTAL - p.TOTAL) AS PROFIT FROM s_table s join p_table p on s.ORDER_ID = p.ORDER_ID where s.DATE like '2025-${m}%';"
echo " "
sudo mariadb -D cashphones  -e "SELECT 'TABLE' AS Category, 'PROFIT' AS Value UNION SELECT ' ', ' ' UNION SELECT 'PHONES', SUM(s.TOTAL - p.TOTAL) FROM s_table s JOIN p_table p ON s.ORDER_ID = p.ORDER_ID WHERE s.DATE LIKE '2025-${m}%' UNION SELECT '  ', '  ' UNION SELECT 'S_ACC', SUM(TOTAL_PROFIT) FROM s_acc WHERE DATE LIKE '2025-${m}%' UNION SELECT '   ', '   ' UNION SELECT 'REPAIR',         (SELECT SUM(TOTAL) FROM repair WHERE DATE LIKE '2025-${m}%') -        (SELECT SUM(TOTAL) FROM parts WHERE DATE LIKE '2025-${m}%') UNION SELECT '    ', '    ' UNION SELECT 'EXPANSE', SUM(TOTAL) FROM exp WHERE DATE LIKE '2025-${m}%' UNION SELECT '           ', '           ' UNION SELECT 'SALARY', SUM(TOTAL) FROM sal WHERE DATE LIKE '2025-${m}%' UNION SELECT '         ', '         ' UNION SELECT 'BANK CHARGES', SUM(TOTAL) FROM charges WHERE DATE LIKE '2025-${m}%' UNION SELECT '--------------------', '-----------' UNION SELECT 'GRAND PROFIT/LOSS',        (SELECT SUM(s.TOTAL - p.TOTAL)         FROM s_table s         JOIN p_table p ON s.ORDER_ID = p.ORDER_ID         WHERE s.DATE LIKE '2025-${m}%')        +        (SELECT SUM(TOTAL_PROFIT) FROM s_acc WHERE DATE LIKE '2025-${m}%')        +        (SELECT SUM(TOTAL) FROM repair WHERE DATE LIKE '2025-${m}%') -        (SELECT SUM(TOTAL) FROM parts WHERE DATE LIKE '2025-${m}%')        -        (SELECT SUM(TOTAL) FROM exp WHERE DATE LIKE '2025-${m}%')        -        (SELECT SUM(TOTAL) FROM sal WHERE DATE LIKE '2025-${m}%')        -        (SELECT SUM(TOTAL) FROM charges WHERE DATE LIKE '2025-${m}%');"
}

#refresh(){

#sudo mariadb -D cashphones -e "set foreign_key_checks=0;delete from stock where QNTY=0;"

#start
#}


cash_bal(){
echo "
██████╗  █████╗ ██╗      █████╗ ███╗   ██╗ ██████╗███████╗
██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔════╝██╔════╝
██████╔╝███████║██║     ███████║██╔██╗ ██║██║     █████╗  
██╔══██╗██╔══██║██║     ██╔══██║██║╚██╗██║██║     ██╔══╝  
██████╔╝██║  ██║███████╗██║  ██║██║ ╚████║╚██████╗███████╗
╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
                                                          
"|lolcat
echo " "
echo " "
echo -e -n "MONTH NUM => "|lolcat
read mo
echo -e -n "DATE => "|lolcat
read o
echo " "
echo " "

mo=$(printf "%02d" $((10#$mo)))
o=$(printf "%02d" $((10#$o)))
tes="$mo"
# Determine correct previous date
if [ "$o" == "01" ]; then
  # If date is 01, subtract one month and get last day of that month
  prev_date=$(date -d "2025-${mo}-01 -1 day" +%Y-%m-%d)
else
  # Any other day: subtract one day from entered date
  prev_date=$(date -d "2025-${mo}-${o} -1 day" +%Y-%m-%d)
fi
sudo mariadb -D cashphones -e "SELECT * FROM bal WHERE DATE = '$prev_date';" 
echo " "
#echo -e -n "BAL => "|lolcat
#read b
echo " "
echo "P-PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,CASH from p_table where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo "P_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,CASH from p_acc where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo "EXPANSES"
echo "--------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,CASH from exp where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo " "
echo "FUND SUBTRACT"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,CASH from fund_sub where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo " "
echo "PENDING"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,CASH from pen_h where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo " "
echo "PURCHASE-PAYMENT-SEND"
echo "---------------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,CASH from p_send where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo " "
echo "SALARY"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,CASH from sal where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo " "
echo "PARTS"
echo "-----"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,CASH from parts where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo " "
echo "S_PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,CASH from s_table where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo " "
echo "REPAIR"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,CASH from repair where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo " "
echo "S_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,CASH from s_acc where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo " "
echo "FUNDS ADD"
echo "---------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,CASH from fund_add where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo " "
echo " "
echo "PENDING REC"
echo "-----------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,CASH from pen_rec where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo "PURCHASE-PAYMENT-DELAY"
echo "----------------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,CASH from p_delay where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo " "
sudo mariadb -D cashphones -e "select ' ' AS NAME ,' ' as CASH  UNION select 'PURCHASE_PHONE',IFNULL((select SUM(CASH) FROM p_table WHERE DATE='2025-${mo}-${o}'),0) UNION select 'P_ACCESSORIES',IFNULL((select SUM(CASH) FROM p_acc WHERE DATE='2025-${mo}-${o}'),0) UNION select 'EXPANSES',IFNULL((select SUM(CASH) FROM exp WHERE DATE='2025-${mo}-${o}'),0) UNION select 'FUND_SUB',IFNULL((select SUM(CASH) FROM fund_sub WHERE DATE='2025-${mo}-${o}'),0) UNION select 'PENDING',IFNULL((select SUM(CASH) FROM pen_h WHERE DATE='2025-${mo}-${o}'),0) UNION select 'P_PAYMENT_SEND',IFNULL((select SUM(CASH) FROM p_send WHERE DATE='2025-${mo}-${o}'),0) UNION select 'SALARY',IFNULL((select SUM(CASH) FROM sal WHERE DATE='2025-${mo}-${o}'),0) UNION select 'REPAIR PARTS',IFNULL((select SUM(CASH) FROM parts WHERE DATE='2025-${mo}-${o}'),0)  UNION select 'SALE_PHONE',IFNULL((select SUM(CASH) FROM s_table WHERE DATE='2025-${mo}-${o}'),0) UNION select 'REPAIR',IFNULL((select SUM(CASH) FROM repair WHERE DATE='2025-${mo}-${o}'),0) UNION select 'S_ACCESSORIES',IFNULL((select SUM(CASH) FROM s_acc WHERE DATE='2025-${mo}-${o}'),0) UNION select 'FUND_ADD',IFNULL((select SUM(CASH) FROM fund_add WHERE DATE='2025-${mo}-${o}'),0) UNION select 'PENDING_REC',IFNULL((select SUM(CASH) FROM pen_rec WHERE DATE='2025-${mo}-${o}'),0) UNION select 'P_PAYMENT_DELAY',IFNULL((select SUM(CASH) FROM p_delay WHERE DATE='2025-${mo}-${o}'),0)  union select  '----------------','--------' union select '2025-${mo}-${o} BALANCE',IFNULL((select CLOSING_BAL from bal WHERE DATE='$prev_date'),0)+IFNULL((select SUM(CASH) FROM s_table WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM repair WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM s_acc WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM fund_add WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM pen_rec WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM p_delay WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM p_table WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM p_acc WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM exp WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM fund_sub WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM pen_h WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM p_send WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM sal WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM parts WHERE DATE='2025-${mo}-${o}'),0);"
echo " "
echo " "
today="2025-${mo}-${o}"
echo "
1) BACK" |lolcat
echo " "
read -p "===>" n
n=${n:-2}
case $n in
	1) 
		bal
		;;
	2)
	
	# Query all required cash values directly using SQL
			read b p a e fs pp ps sa pa s r sac fa pr pd <<<$(sudo mariadb -N -D cashphones -e "
			SELECT
			IFNULL((select CLOSING_BAL from bal WHERE DATE='$prev_date'), 0), 
	  		IFNULL((SELECT SUM(CASH) FROM p_table     WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM p_acc       WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM exp         WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM fund_sub    WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM pen_h       WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM p_send      WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM sal         WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM parts       WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM s_table     WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM repair      WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM s_acc       WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM fund_add    WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM pen_rec     WHERE DATE = '$today'), 0),
	  		IFNULL((SELECT SUM(CASH) FROM p_delay     WHERE DATE = '$today'), 0);
			")
	
	
	# Calculate final balance
			t=$(( b + s + r + sac + fa + pr + pd - p - a - e - fs - pp - ps - sa - pa ))
	
	# Insert into `bal` table
			sudo mariadb -D cashphones -e "
			INSERT INTO bal VALUES('$today', ${b}, ${p}, ${a}, ${e}, ${fs}, ${pp}, ${ps}, ${sa}, ${pa}, ${s}, ${r}, ${sac}, ${fa}, ${pr}, ${pd}, ${t});
			"
			sudo mariadb -D cashphones -e "select * from bal where DATE LIKE '2025-${tes}-%'";
			bal
			;;
	esac

}


axis_bal(){

echo "
 █████╗ ██╗  ██╗██╗███████╗    ██████╗  █████╗ ██╗      █████╗ ███╗   ██╗ ██████╗███████╗
██╔══██╗╚██╗██╔╝██║██╔════╝    ██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔════╝██╔════╝
███████║ ╚███╔╝ ██║███████╗    ██████╔╝███████║██║     ███████║██╔██╗ ██║██║     █████╗  
██╔══██║ ██╔██╗ ██║╚════██║    ██╔══██╗██╔══██║██║     ██╔══██║██║╚██╗██║██║     ██╔══╝  
██║  ██║██╔╝ ██╗██║███████║    ██████╔╝██║  ██║███████╗██║  ██║██║ ╚████║╚██████╗███████╗
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
                                                                                         
"|lolcat
echo " "
echo " "
echo -e -n "MONTH NUM => "|lolcat
read mo
echo -e -n "DATE => "|lolcat
read o
echo " "
mo=$(printf "%02d" $((10#$mo)))
o=$(printf "%02d" $((10#$o)))

tes="$mo"


echo " "


# Determine correct previous date
if [ "$o" == "01" ]; then
  # If date is 01, subtract one month and get last day of that month
  prev_date=$(date -d "2025-${mo}-01 -1 day" +%Y-%m-%d)
else
  # Any other day: subtract one day from entered date
  prev_date=$(date -d "2025-${mo}-${o} -1 day" +%Y-%m-%d)
fi

sudo mariadb -D cashphones -e "select * from axis where DATE='$prev_date'";
echo " "
#echo -e -n "AXIS BAL => "|lolcat
#read b
echo " "
echo "P-PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from p_table where DATE='2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo "P_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from p_acc where DATE='2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo "EXPANSES"
echo "--------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from exp where DATE='2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "FUND SUBTRACT"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from fund_sub where DATE='2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "PENDING"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select * from pen_h where DATE='2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo " "
echo "PURCHASE-PAYMENT-SEND"
echo "---------------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,AXIS from p_send where DATE='2025-${mo}-${o}' AND AXIS <> 0"; 
echo " "
echo "BANK CHARGES"
echo "------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from charges where DATE='2025-${mo}-${o}' AND AXIS <> 0";
echo " "
echo " "
echo "SALARY"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from sal where DATE='2025-${mo}-${o}' AND AXIS <> 0"; 
echo " "
echo " "
echo "PARTS"
echo "-----"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from parts where DATE='2025-${mo}-${o}' AND AXIS <> 0"; 
echo " "
echo " "
echo "S_PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from s_table where DATE='2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo " "
echo "REPAIR"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from repair where DATE='2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo " "
echo "S_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from s_acc where DATE='2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo " "
echo "FUNDS ADD"
echo "---------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from fund_add where DATE='2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo " "
echo "PENDING-REC"
echo "-----------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,AXIS from pen_rec where DATE='2025-${mo}-${o}' AND AXIS <> 0";
echo " "
echo " "
echo "PURCHASE-PAYMENT-DELAY"
echo "----------------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,AXIS from p_delay where DATE='2025-${mo}-${o}' AND AXIS <> 0";
echo " "
echo " "
sudo mariadb -D cashphones -e "select ' ' AS NAME, ' ' as AXIS UNION  select 'PURCHASE_PHONE', IFNULL((select SUM(AXIS) FROM p_table WHERE DATE='2025-${mo}-${o}%'), 0) UNION  select 'P_ACCESSORIES', IFNULL((select SUM(AXIS) FROM p_acc WHERE DATE='2025-${mo}-${o}%'), 0) UNION  select 'EXPANSES', IFNULL((select SUM(AXIS) FROM exp WHERE DATE='2025-${mo}-${o}%'), 0) UNION  select 'FUND_SUB', IFNULL((select SUM(AXIS) FROM fund_sub WHERE DATE='2025-${mo}-${o}%'), 0) UNION  select 'PENDING', IFNULL((select SUM(AXIS) FROM pen_h WHERE DATE='2025-${mo}-${o}%'), 0) UNION  select 'P_PAYMENT_SEND', IFNULL((select SUM(AXIS) FROM p_send WHERE DATE='2025-${mo}-${o}%'), 0) UNION  select 'BANK CHARGES', IFNULL((select SUM(AXIS) FROM charges WHERE DATE='2025-${mo}-${o}%'),0) UNION select 'SALARY',IFNULL((select SUM(AXIS) FROM sal WHERE DATE='2025-${mo}-${o}'),0) UNION select 'REPAIR PARTS',IFNULL((select SUM(AXIS) FROM parts WHERE DATE='2025-${mo}-${o}'),0)  UNION  select 'S_PHONE', IFNULL((select SUM(AXIS) FROM s_table WHERE DATE='2025-${mo}-${o}%'), 0) UNION  select 'REPAIR', IFNULL((select SUM(AXIS) FROM repair WHERE DATE='2025-${mo}-${o}%'), 0) UNION  select 'S_ACC', IFNULL((select SUM(AXIS) FROM s_acc WHERE DATE='2025-${mo}-${o}%'), 0) UNION  select 'FUND_ADD', IFNULL((select SUM(AXIS) FROM fund_add WHERE DATE='2025-${mo}-${o}%'), 0) UNION  select 'PEN_REC', IFNULL((select SUM(AXIS) FROM pen_rec WHERE DATE='2025-${mo}-${o}%'),0) UNION  select 'P_PAYMENT_DELAY', IFNULL((select SUM(AXIS) FROM p_delay WHERE DATE='2025-${mo}-${o}%'), 0)  union select '------------','--------' union select 'GRAND_TOTAL',IFNULL((select CLOSING_BAL from axis WHERE DATE='$prev_date'),0)+IFNULL((select SUM(AXIS) FROM s_table WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM repair WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM s_acc WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM fund_add WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM pen_rec WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM p_delay WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_table WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_acc WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM exp WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM fund_sub WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM pen_h WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_send WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM charges WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM sal WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM parts WHERE DATE='2025-${mo}-${o}%'),0)";
echo " "
echo " "
today="2025-${mo}-${o}"
echo "
1) BACK" |lolcat
echo " "
read -p "===>" n
n=${n:-2}
case $n in
	1) 
		bal
		;;
	2)
		read b p a e fs pp ps bc sa pa s r sac fa pr pd <<<$(sudo mariadb -N -D cashphones -e "
				SELECT
				IFNULL((select CLOSING_BAL from axis WHERE DATE='$prev_date'), 0), 
		  		IFNULL((SELECT SUM(AXIS) FROM p_table     WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM p_acc       WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM exp         WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM fund_sub    WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM pen_h       WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM p_send      WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM charges      WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM sal         WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM parts       WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM s_table     WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM repair      WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM s_acc       WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM fund_add    WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM pen_rec     WHERE DATE = '$today'), 0),
		  		IFNULL((SELECT SUM(AXIS) FROM p_delay     WHERE DATE = '$today'), 0);
				")
		
		
		# Calculate final balance
				#t=$(( b + s + r + sac + fa + pr + pd - p - a - e - fs - pp - ps - sa - pa ))
		t=$(echo $b + $s + $r + $sac + $fa + $pr + $pd - $p - $a - $e - $fs - $pp - $ps - $bc - $sa - $pa |bc)
		# Insert into `bal` table
		sudo mariadb -D cashphones -e "
		INSERT INTO axis VALUES('$today', ${b}, ${p}, ${a}, ${e}, ${fs}, ${pp}, ${ps}, ${bc}, ${sa}, ${pa}, ${s}, ${r}, ${sac}, ${fa}, ${pr}, ${pd}, ${t});
		"
		
	#	sudo mariadb -D cashphones -e "insert into axis values('2025-${mo}-${o}',${b},${p},${a},${e},${fs},${pp},${ps},${bc},${sa},${pa},${s},${r},${sac},${fa},${pr},${pd},${t})";
		echo " "
		echo " "
		sudo mariadb -D cashphones -e "select * from axis where DATE LIKE '2025-${tes}-%'"; 

		bal
		;;
	esac
}

icici_bal(){

echo "
██╗ ██████╗██╗ ██████╗██╗    ██████╗  █████╗ ██╗      █████╗ ███╗   ██╗ ██████╗███████╗
██║██╔════╝██║██╔════╝██║    ██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔════╝██╔════╝
██║██║     ██║██║     ██║    ██████╔╝███████║██║     ███████║██╔██╗ ██║██║     █████╗  
██║██║     ██║██║     ██║    ██╔══██╗██╔══██║██║     ██╔══██║██║╚██╗██║██║     ██╔══╝  
██║╚██████╗██║╚██████╗██║    ██████╔╝██║  ██║███████╗██║  ██║██║ ╚████║╚██████╗███████╗
╚═╝ ╚═════╝╚═╝ ╚═════╝╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
                                                                                       
"|lolcat

echo " "
echo " "

echo -e -n "MONTH NUM => "|lolcat
read mo
echo -e -n "DATE => "|lolcat
read o
echo " "
mo=$(printf "%02d" $((10#$mo)))
o=$(printf "%02d" $((10#$o)))

tes="$mo"
echo " "


# Determine correct previous date
if [ "$o" == "01" ]; then
  # If date is 01, subtract one month and get last day of that month
  prev_date=$(date -d "2025-${mo}-01 -1 day" +%Y-%m-%d)
else
  # Any other day: subtract one day from entered date
  prev_date=$(date -d "2025-${mo}-${o} -1 day" +%Y-%m-%d)
fi
sudo mariadb -D cashphones -e "select * from icici where DATE='$prev_date'";
echo " "
#echo -e -n "ICICI BAL => "|lolcat
#read b
echo " "
echo "P-PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,ICICI from p_table where DATE = '2025-${mo}-${o}%' AND ICICI <> 0";
echo " "
echo "P_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from p_acc where DATE = '2025-${mo}-${o}%' AND ICICI <> 0";
echo " "
echo "EXPANSES"
echo "--------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from exp where DATE = '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "FUND SUBTRACT"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from fund_sub where DATE = '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "PENDING"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select * from pen_h where DATE = '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "PURCHASE-PAYMENT-SEND"
echo "---------------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,ICICI from p_send where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo "BANK CHARGES"
echo "------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from charges where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo "SALARY"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from sal where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo " "
echo "PARTS"
echo "-----"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from parts where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo " "
echo "S_PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,ICICI from s_table where DATE = '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "REPAIR"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from repair where DATE = '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "S_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from s_acc where DATE = '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "FUNDS ADD"
echo "---------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from fund_add where DATE = '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "PENDING-REC"
echo "-----------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,ICICI from pen_rec where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo " "
echo "PURCHASE-PAYMENT-DELAY"
echo "----------------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,ICICI from p_delay where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo " "
sudo mariadb -D cashphones -e "select ' ' AS NAME, ' ' as ICICI UNION  select 'PURCHASE_PHONE', IFNULL((select SUM(ICICI) FROM p_table WHERE DATE='2025-${mo}-${o}'), 0) UNION  select 'P_ACCESSORIES', IFNULL((select SUM(ICICI) FROM p_acc WHERE DATE='2025-${mo}-${o}'), 0) UNION  select 'EXPANSES', IFNULL((select SUM(ICICI) FROM exp WHERE DATE='2025-${mo}-${o}'), 0) UNION  select 'FUND_SUB', IFNULL((select SUM(ICICI) FROM fund_sub WHERE DATE='2025-${mo}-${o}'), 0) UNION  select 'PENDING', IFNULL((select SUM(ICICI) FROM pen_h WHERE DATE='2025-${mo}-${o}'), 0) UNION  select 'P_PAYMENT_SEND', IFNULL((select SUM(ICICI) FROM p_send WHERE DATE='2025-${mo}-${o}'), 0) UNION  select 'BANK CHARGES', IFNULL((select SUM(ICICI) FROM charges WHERE DATE='2025-${mo}-${o}'),0) UNION select 'SALARY',IFNULL((select SUM(ICICI) FROM sal WHERE DATE='2025-${mo}-${o}'),0) UNION select 'REPAIR PARTS',IFNULL((select SUM(ICICI) FROM parts WHERE DATE='2025-${mo}-${o}'),0)  UNION  select 'S_PHONE', IFNULL((select SUM(ICICI) FROM s_table WHERE DATE='2025-${mo}-${o}'), 0) UNION  select 'REPAIR', IFNULL((select SUM(ICICI) FROM repair WHERE DATE='2025-${mo}-${o}'), 0) UNION  select 'S_ACC', IFNULL((select SUM(ICICI) FROM s_acc WHERE DATE='2025-${mo}-${o}'), 0) UNION  select 'FUND_ADD', IFNULL((select SUM(ICICI) FROM fund_add WHERE DATE='2025-${mo}-${o}'), 0) UNION  select 'PEN_REC', IFNULL((select SUM(ICICI) FROM pen_rec WHERE DATE='2025-${mo}-${o}'),0) UNION  select 'P_PAYMENT_DELAY', IFNULL((select SUM(ICICI) FROM p_delay WHERE DATE='2025-${mo}-${o}'), 0)  union select '------------','--------' union select 'GRAND_TOTAL',IFNULL((select CLOSING_BAL from icici WHERE DATE='$prev_date'),0)+IFNULL((select SUM(ICICI) FROM s_table WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(ICICI) FROM repair WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(ICICI) FROM s_acc WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(ICICI) FROM fund_add WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(ICICI) FROM pen_rec WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(ICICI) FROM p_delay WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(ICICI) FROM p_table WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(ICICI) FROM p_acc WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(ICICI) FROM exp WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(ICICI) FROM fund_sub WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(ICICI) FROM pen_h WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(ICICI) FROM p_send WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(ICICI) FROM charges WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(ICICI) FROM sal WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(ICICI) FROM parts WHERE DATE='2025-${mo}-${o}'),0)"; 
echo " "
echo " "
today="2025-${mo}-${o}"
echo "
1) BACK" |lolcat
echo " "
read -p "===>" n
n=${n:-2}
case $n in
	1) 
		bal
		;;
	2)
		read b p a e fs pp ps bc sa pa s r sac fa pr pd <<<$(sudo mariadb -N -D cashphones -e "
						SELECT
						IFNULL((select CLOSING_BAL from icici WHERE DATE='$prev_date'), 0), 
				  		IFNULL((SELECT SUM(ICICI) FROM p_table     WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM p_acc       WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM exp         WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM fund_sub    WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM pen_h       WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM p_send      WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM charges      WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM sal         WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM parts       WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM s_table     WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM repair      WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM s_acc       WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM fund_add    WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM pen_rec     WHERE DATE = '$today'), 0),
				  		IFNULL((SELECT SUM(ICICI) FROM p_delay     WHERE DATE = '$today'), 0);
						")
				
				
				# Calculate final balance
						#t=$(( b + s + r + sac + fa + pr + pd - p - a - e - fs - pp - ps - sa - pa ))
				t=$(echo $b + $s + $r + $sac + $fa + $pr + $pd - $p - $a - $e - $fs - $pp - $ps - $bc - $sa - $pa |bc)
				# Insert into `bal` table
				sudo mariadb -D cashphones -e "
				INSERT INTO icici VALUES('$today', ${b}, ${p}, ${a}, ${e}, ${fs}, ${pp}, ${ps}, ${bc}, ${sa}, ${pa}, ${s}, ${r}, ${sac}, ${fa}, ${pr}, ${pd}, ${t});
				"
			#	sudo mariadb -D cashphones -e "insert into axis values('2025-${mo}-${o}',${b},${p},${a},${e},${fs},${pp},${ps},${bc},${sa},${pa},${s},${r},${sac},${fa},${pr},${pd},${t})";
				echo " "
				echo " "
				sudo mariadb -D cashphones -e "select * from icici where DATE like '2025-${tes}%'"; 
		
				bal
				;;
			esac
}

merge(){

echo "
███╗   ███╗███████╗██████╗  ██████╗ ███████╗    ██████╗ ███████╗██████╗  ██████╗ ██████╗ ████████╗
████╗ ████║██╔════╝██╔══██╗██╔════╝ ██╔════╝    ██╔══██╗██╔════╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝
██╔████╔██║█████╗  ██████╔╝██║  ███╗█████╗      ██████╔╝█████╗  ██████╔╝██║   ██║██████╔╝   ██║   
██║╚██╔╝██║██╔══╝  ██╔══██╗██║   ██║██╔══╝      ██╔══██╗██╔══╝  ██╔═══╝ ██║   ██║██╔══██╗   ██║   
██║ ╚═╝ ██║███████╗██║  ██║╚██████╔╝███████╗    ██║  ██║███████╗██║     ╚██████╔╝██║  ██║   ██║   
╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
                                                                                                  
"|lolcat
echo ""
echo ""
echo "CASH BALANCE DETAIL"
echo "-------------------"
echo " "
echo " "
echo -e -n "MONTH NUM => "|lolcat
read mo
echo -e -n "DATE => "|lolcat
read o
echo " "
#uo=$(printf "%02d" "$o")
echo " "
mo=$(printf "%02d" $((10#$mo)))
o=$(printf "%02d" $((10#$o)))


# Determine correct previous date
if [ "$o" == "01" ]; then
  # If date is 01, subtract one month and get last day of that month
  prev_date=$(date -d "2025-${mo}-01 -1 day" +%Y-%m-%d)
else
  # Any other day: subtract one day from entered date
  prev_date=$(date -d "2025-${mo}-${o} -1 day" +%Y-%m-%d)
fi
echo "CASH"
echo "----"
sudo mariadb -D cashphones  -e "select * from bal where DATE='$prev_date'"; 
echo " "
echo "AXIS"
echo "----"
sudo mariadb -D cashphones  -e "select * from axis where DATE='$prev_date'"; 
echo " "
echo "ICICI"
echo "----"
sudo mariadb -D cashphones  -e "select * from icici where DATE='$prev_date'";
echo " "
echo "P-PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones  -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,CASH from p_table where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo "P_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,CASH from p_acc where DATE='2025-${mo}-${o}' AND CASH <> 0";
echo " "
echo "EXPANSES"
echo "--------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,CASH from exp where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo "FUND SUBTRACT"
echo "-------------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,CASH from fund_sub where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo "PENDING"
echo "-------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,ORDER_ID,NAME,CASH from pen_h where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo "PURCHASE-PAYMENT-SEND"
echo "---------------------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,ORDER_ID,NAME,CASH from p_send where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo "SALARY"
echo "------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,CASH from sal where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo "PARTS"
echo "-----"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,CASH from parts where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo "S_PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones  -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,CASH from s_table where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo "REPAIR"
echo "------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,CASH from repair where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo "S_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,CASH from s_acc where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo "FUNDS ADD"
echo "---------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,CASH from fund_add where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo " "
echo "PENDING REC"
echo "-----------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,ORDER_ID,NAME,CASH from pen_rec where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "
echo "PURCHASE-PAYMENT-DELAY"
echo "----------------------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,ORDER_ID,NAME,CASH from p_delay where DATE='2025-${mo}-${o}' AND CASH <> 0"; 
echo " "
echo " "


echo "AXIS BALANCE DETAIL"
echo "-------------------"
echo " "
echo "P-PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones  -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from p_table where DATE='2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo "P_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,AXIS from p_acc where DATE='2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo "EXPANSES"
echo "--------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,AXIS from exp where DATE='2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "FUND SUBTRACT"
echo "-------------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,AXIS from fund_sub where DATE='2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "PENDING"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select * from pen_h where DATE='2025-${mo}-${o}%'"; 
echo " "
echo " "
echo "PURCHASE-PAYMENT-SEND"
echo "---------------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,AXIS from p_send where DATE='2025-${mo}-${o}' AND AXIS <> 0"; 
echo " "
echo " "
echo "BANK CHARGES"
echo "------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from charges where DATE='2025-${mo}-${o}' AND AXIS <> 0"; 
echo " "
echo " "
echo "SALARY"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from sal where DATE='2025-${mo}-${o}' AND AXIS <> 0"; 
echo " "
echo " "
echo "PARTS"
echo "-----"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from parts where DATE='2025-${mo}-${o}' AND AXIS <> 0"; 
echo " "
echo " "
echo "S_PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from s_table where DATE='2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "REPAIR"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from repair where DATE='2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "S_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from s_acc where DATE='2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "FUNDS ADD"
echo "---------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from fund_add where DATE='2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "PENDING-REC"
echo "-----------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,AXIS from pen_rec where DATE='2025-${mo}-${o}' AND AXIS <> 0"; 
echo " "
echo " "
echo "PURCHASE-PAYMENT-DELAY"
echo "----------------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,AXIS from p_delay where DATE='2025-${mo}-${o}' AND AXIS <> 0"; 
echo " "
echo " "



echo "ICICI BALANCE DETAIL"
echo "-------------------"
echo " "
echo "P-PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from p_table where DATE='2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo "P_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from p_acc where DATE='2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo "EXPANSES"
echo "--------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from exp where DATE='2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "FUND SUBTRACT"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from fund_sub where DATE='2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "PENDING"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select * from pen_h where DATE='2025-${mo}-${o}%'"; 
echo " "
echo " "
echo "PURCHASE-PAYMENT-SEND"
echo "---------------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,AXIS from p_send where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo " "
echo "BANK CHARGES"
echo "------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from charges where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo " "
echo "SALARY"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from sal where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo " "
echo "PARTS"
echo "-----"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from parts where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo " "
echo "S_PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from s_table where DATE='2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "REPAIR"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from repair where DATE='2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "S_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from s_acc where DATE='2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "FUNDS ADD"
echo "---------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from fund_add where DATE='2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "PENDING-REC"
echo "-----------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,AXIS from pen_rec where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo " "
echo "PURCHASE-PAYMENT-DELAY"
echo "----------------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,ORDER_ID,NAME,AXIS from p_delay where DATE='2025-${mo}-${o}' AND ICICI <> 0"; 
echo " "
echo " "



sudo mariadb -D cashphones -e "select ' ' AS NAME ,' ' as CASH,' ' as AXIS,' ' as ICICI  UNION select 'PURCHASE_PHONE',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM p_table WHERE DATE='2025-${mo}-${o}' UNION select 'P_ACCESSORIES',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM p_acc WHERE DATE='2025-${mo}-${o}' UNION select 'EXPANSES',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM exp WHERE DATE='2025-${mo}-${o}' UNION select 'FUND_SUB',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM fund_sub WHERE DATE='2025-${mo}-${o}' UNION select 'PENDING',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM pen_h WHERE DATE='2025-${mo}-${o}' UNION select 'P_PAYMENT_SEND',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM p_send WHERE DATE='2025-${mo}-${o}' UNION select 'BANK CHARGES',IFNULL(SUM(0),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM charges WHERE DATE='2025-${mo}-${o}' UNION select 'SALARY',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM sal WHERE DATE='2025-${mo}-${o}' UNION select 'REPAIR PARTS',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM parts WHERE DATE='2025-${mo}-${o}'  UNION select 'SALE_PHONE',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM s_table WHERE DATE='2025-${mo}-${o}' UNION select 'REPAIR',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM repair WHERE DATE='2025-${mo}-${o}' UNION select 'S_ACCESSORIES',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM s_acc WHERE DATE='2025-${mo}-${o}' UNION select 'FUND_ADD',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM fund_add WHERE DATE='2025-${mo}-${o}' UNION select 'PENDING_REC',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM pen_rec WHERE DATE='2025-${mo}-${o}' UNION select 'P_PAYMENT_DELAY',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM p_delay WHERE DATE='2025-${mo}-${o}'  union select  '----------------','---------','---------','---------' union select '2025-${mo}-${o} BALANCE',IFNULL((select CLOSING_BAL from bal WHERE DATE='$prev_date'),0)+IFNULL((select SUM(CASH) FROM s_table WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM repair WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM s_acc WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM fund_add WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM pen_rec WHERE DATE='2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM p_delay WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM p_table WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM p_acc WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM exp WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM fund_sub WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM pen_h WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(0) FROM charges WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM sal WHERE DATE='2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM parts WHERE DATE='2025-${mo}-${o}'),0),IFNULL((select CLOSING_BAL from axis WHERE DATE='$prev_date'),0)+IFNULL((select SUM(AXIS) FROM s_table WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM repair WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM s_acc WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM fund_add WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM pen_rec WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM p_delay WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_table WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_acc WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM exp WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM fund_sub WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM pen_h WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_send WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM charges WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM sal WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM parts WHERE DATE='2025-${mo}-${o}%'),0),IFNULL((select CLOSING_BAL from icici WHERE DATE='$prev_date'),0)+IFNULL((select SUM(ICICI) FROM s_table WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM repair WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM s_acc WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM fund_add WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM pen_rec WHERE DATE='2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM p_delay WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM p_table WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM p_acc WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM exp WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM fund_sub WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM pen_h WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM p_send WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM charges WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM sal WHERE DATE='2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM parts WHERE DATE='2025-${mo}-${o}%'),0);" 
echo " "
echo " "
bal
}

count(){
	#!/bin/bash
	
	echo
	echo -e -n "MONTH NUM => " | lolcat
	read mo
	
	echo -e -n "START DATE => " | lolcat
	read o
	
	echo -e -n "END DATE => " | lolcat
	read e
	echo
	
	# Pad month and day values
	mo=$(printf "%02d" $((10#$mo)))
	o=$(printf "%02d" $((10#$o)))
	e=$(printf "%02d" $((10#$e)))
	
	#mo=$(printf "%02d" "$mo")
	#o=$(printf "%02d" "$o")
	#e=$(printf "%02d" "$e")
	
	# Determine balance base day using real date math
	balance_date=$(date -d "2025-${mo}-${o} -1 day" +%Y-%m-%d)
	range_start="2025-${mo}-${o}"
	range_end="2025-${mo}-${e}"
	echo
	sudo mariadb -D cashphones -e "SELECT * FROM bal WHERE DATE = '$balance_date';"
	echo
	
	echo "P-PHONE"
	echo "-------"
	echo
	sudo mariadb -D cashphones -e "SELECT ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,CASH FROM p_table WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "P_ACCESSORIES"
	echo "-------------"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,NAME,CASH FROM p_acc WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "EXPANSES"
	echo "--------"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,NAME,CASH FROM exp WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "FUND SUBTRACT"
	echo "-------------"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,NAME,CASH FROM fund_sub WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "PENDING"
	echo "-------"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,ORDER_ID,NAME,CASH FROM pen_h WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "PURCHASE-PAYMENT-SEND"
	echo "---------------------"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,ORDER_ID,NAME,CASH FROM p_send WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "SALARY"
	echo "------"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,NAME,CASH FROM sal WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "PARTS"
	echo "-----"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,NAME,CASH FROM parts WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "S_PHONE"
	echo "-------"
	echo
	sudo mariadb -D cashphones -e "SELECT ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,CASH FROM s_table WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "REPAIR"
	echo "------"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,NAME,CASH FROM repair WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "S_ACCESSORIES"
	echo "-------------"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,NAME,CASH FROM s_acc WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "FUNDS ADD"
	echo "---------"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,NAME,CASH FROM fund_add WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "PENDING REC"
	echo "-----------"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,ORDER_ID,NAME,CASH FROM pen_rec WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	echo "PURCHASE-PAYMENT-DELAY"
	echo "----------------------"
	echo
	sudo mariadb -D cashphones -e "SELECT DATE,ORDER_ID,NAME,CASH FROM p_delay WHERE DATE BETWEEN '$range_start' AND '$range_end' AND CASH <> 0;"
	echo
	
	# Summary
	sudo mariadb -D cashphones -e "
	  SELECT ' ' AS NAME, ' ' AS CASH
	  UNION SELECT 'PURCHASE_PHONE', IFNULL(SUM(CASH),0) FROM p_table WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'P_ACCESSORIES', IFNULL(SUM(CASH),0) FROM p_acc WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'EXPANSES', IFNULL(SUM(CASH),0) FROM exp WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'FUND_SUB', IFNULL(SUM(CASH),0) FROM fund_sub WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'PENDING', IFNULL(SUM(CASH),0) FROM pen_h WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'P_PAYMENT_SEND', IFNULL(SUM(CASH),0) FROM p_send WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'SALARY', IFNULL(SUM(CASH),0) FROM sal WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'REPAIR PARTS', IFNULL(SUM(CASH),0) FROM parts WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'SALE_PHONE', IFNULL(SUM(CASH),0) FROM s_table WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'REPAIR', IFNULL(SUM(CASH),0) FROM repair WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'S_ACCESSORIES', IFNULL(SUM(CASH),0) FROM s_acc WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'FUND_ADD', IFNULL(SUM(CASH),0) FROM fund_add WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'PENDING_REC', IFNULL(SUM(CASH),0) FROM pen_rec WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT 'P_PAYMENT_DELAY', IFNULL(SUM(CASH),0) FROM p_delay WHERE DATE BETWEEN '$range_start' AND '$range_end'
	  UNION SELECT '----------------', '--------'
	  UNION SELECT '${range_start} BALANCE',
	    IFNULL((SELECT CLOSING_BAL FROM bal WHERE DATE = '$balance_date'),0)
	    + IFNULL((SELECT SUM(CASH) FROM s_table WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    + IFNULL((SELECT SUM(CASH) FROM repair WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    + IFNULL((SELECT SUM(CASH) FROM s_acc WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    + IFNULL((SELECT SUM(CASH) FROM fund_add WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    + IFNULL((SELECT SUM(CASH) FROM pen_rec WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    + IFNULL((SELECT SUM(CASH) FROM p_delay WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    - IFNULL((SELECT SUM(CASH) FROM p_table WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    - IFNULL((SELECT SUM(CASH) FROM p_acc WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    - IFNULL((SELECT SUM(CASH) FROM exp WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    - IFNULL((SELECT SUM(CASH) FROM fund_sub WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    - IFNULL((SELECT SUM(CASH) FROM pen_h WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    - IFNULL((SELECT SUM(CASH) FROM p_send WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    - IFNULL((SELECT SUM(CASH) FROM sal WHERE DATE BETWEEN '$range_start' AND '$range_end'),0)
	    - IFNULL((SELECT SUM(CASH) FROM parts WHERE DATE BETWEEN '$range_start' AND '$range_end'),0);
	"
	
}

bal(){

echo "
██████╗  █████╗ ██╗      █████╗ ███╗   ██╗ ██████╗███████╗
██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔════╝██╔════╝
██████╔╝███████║██║     ███████║██╔██╗ ██║██║     █████╗  
██╔══██╗██╔══██║██║     ██╔══██║██║╚██╗██║██║     ██╔══╝  
██████╔╝██║  ██║███████╗██║  ██║██║ ╚████║╚██████╗███████╗
╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
                                                          
"|lolcat
echo " "
echo ""
echo "
1) CASH BALANCE

2) AXIS BALANCE

3) ICICI BALANCE

4) MERGE BALANCE

5) CASH COUNT"|lolcat
echo ""
read -p "⋟⋟⋟⋟ " n

case $n in
	1)
		cash_bal
		;;
	2)
		axis_bal
		;;
	3)
		icici_bal
		;;
	4)
		merge
		;;
	5)  count
		;;
	*)
		echo "INVALID CHOICE"
		;;
esac
}

bill(){
	cat <<EOF > temp.py

from PIL import Image, ImageDraw, ImageFont
import subprocess
import os
import base64

# Write embedded image to temp file
with open("temp_bg.png", "wb") as f:
    f.write(base64.b64decode("""
    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
    7xi1nXSeMZNfS9WgpAC5OHDF9goQkij6sSVLm6xfZVVOLFRVu1q1ng7wXH0PVfWoSxKSgqiFoiEh
    ilWeS0pvNiOqYLAqKNm4IC793t3Y4j2hxLUwziU19kEsCVnczossNWtrk1i38Y6XxAKQCVBxDmj+
    EMSR8khpW+RdAoTQMv5ww4HI9n43jF2LfTIN4xHC8dZGO5wHalt43hsaj/BERFVlUMf2Ga9WUR+A
    WEuSU4UyU5OpMqlJPyJx0bZXiiBunkCFKJ3qjIuJNJZbFG/hnk5YJinEA4nFh5vPRnK8zblXxLuZ
    R03qn2zeSanFkRo0YzPSJZNpMF/vWpmeEhUYC0714jQ1mDbPlgiZ7QY4/WtHIR4RR4yoRaK4KI7j
    p8XNrD1PKgC3tJqltcy4EQawCVHD2K2Yhc0wdj/39cWqcXzmHf/MXNDK/kKppWfnrLnhhVLb8YCy
    M7UAMi8fSg5q7SRtX9naHEa8vXnqqNaYjrJTrfdK1TqZ/LZzDtVCyWUvbZ2w6pFG2b9aEqT/Na1G
    bSI007XVkzsqQdr277bqGYaxu7DPpmEYn4/W9r/7W+HwVfOf+qq11zCMz4VZ2AzjK0wyGXYXX3Np
    dF7Lsv1cg0dW1QHsXkPWfsGx9uuyu7+80wAkd/fGl938/bfZVlSGYXy5MMFmGF9h7m1V4N03c6rP
    dPtv1HjmXnP4QqCWf9zrpffQ/t2r1tB4IwzD+PKxq18yhmHsCj77e+J+A/UahmEYTTHBZhiPgK+M
    jjGbjmEYxheCCTbDeASYjrk3vjLC1jAM4y6YYDOMR8KXWopotvr6AJtiwvbBcPdb9qV+Pg3jVxJb
    dGAYj4QvtRSpWzX6pW7JV5S73zO7q4ax2zALm2EYhmEYxi7HBJthGIZhGMYuxwSbYRiGYRjGLscE
    m2EYhmEYxi7HBJthGIZhGMYuxwSbYRiGYRjGLscEm2EYhmEYxi7HBJthGIZhGMYuxwSbYRiGYRjG
    LscEm2EYhmEYxi7HBJthGIZhGMYuxwSbYRiGYRjGLscEm2EYhmEYxi7HBJthGIZhGMYuxwSbYRiG
    YRjGLscEm2EYhmEYxi7HBJthGIZhGMYuxwSbYRiGYRjGLscEm2EYhmEYxi7HBJthGIZhGMYuxwSb
    YRiGYRjGLscEm2EYhmEYxi7HBJthGIZhGMYuxwSbYRiGYRjGLscEm2EYhmEYxi7HBJthGIZhGMYu
    xwSbYRiGYRjGLscEm2EYhmEYxi7HBJthGIZhGMYuxwSbYRiGYRjGLscEm2EYhmEYxi7HBJthGIZh
    GMYuxwSbYRiGYRjGLscEm2EYhmEYxi7HBJthGIZhGMYuxwSbYRiGYRjGLscEm2EYhmEYxi7HBJth
    GIZhGMYuxwSbYRiGYRjGLscEm2EYhmEYxi7HBJthGIZhGMYuxwSbYRiGYRjGLscEm2EYhmEYxi7H
    BJthGIZhGMYuxwSbYRiGYRjGLscEm2EYhmEYxi7HBJthGIZhGMYuxwSbYRi7DNVHXPyjLX8X8JXv
    AMPYhQSPugKGYRj10KPVC/RIS3+E6Fe36YbxJcAsbIZh7DZMNzwSqMlvhmHsFkywGcYD5FGZimxK
    y/gMmE4zjF2MCTbDMAzDMIxdjgk2w3iAPCqTxQMq9/Ma7u7jepXPWdbnKNswDGP3YYLN+DJig++j
    4eHpT/nCy2qa330+SPbc7U7svhhfCUywGV9C9D4H81/p97nii7ZFPTju/b7xZ7lpct89cX8P0q/0
    c7Sdz9nYL7Sv7nZjW9zGr9T9Mr4CmGAzvoQ0vJ/v8mbOpv9CXuL3IwwetJyi5p/ihzVY6T0Wppmf
    9wJ9hncTf8732d1qRw/Hwti0GjvU7cHEjfusbdX4/y+0q+77xsYd0roOJuWMLyMWh834VeA+Rocv
    ZCC5n/HjEX0pelizl3SPhVHt5/0aSB8au6ReTauxQ912SbUTCLugRnerwCOvoGF8BszCZnylsG/W
    n5EvsuMe8Wh5302pTcg9wMfnyzOvvftJLY62Y4Xxq4UJNuMrxS75Zv1lGZ1rA95D7rgH2UH1TbmH
    Kd3ahNyD6wW5r6x37fNz/wqsLzQiAAAgAElEQVTpM2qqHbXYQ5q6NoyHjAk2w3jofHFzgg/FhHD/
    vvxfInae0n0I/fsrZQW6/wc7veLefCGrCe5Jk5luM361MMFmfKn5rN/P7zObL3pQ3cmD/L4Keyij
    /ef15f8sRX6BeWX76H6l5+ce8u/1BvF93cld+95ubMW9tqtBODe98D7vhyk241eKXfvBN4wvmOwk
    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
    jYiIiCiTXBs2XZlhlSgRERFRNhkFQiPlSgUQ1ogSERERZY8RwEKhDNaIiIiIssk9JSoaKurPHhAR
    ERFRdhgAUFiNnjfgYwdEREREGWMAGCPJu99ZwkZERESUMVGkZuKSNZawEREREWWMAWAtWLRGRERE
    lFWuhE3tl5wMIiIiIurEADDWC+OqUBa0EREREWWMWXsUIiIiIvoyNQdsfOiAiIiIKGNYwkZERESU
    cQzYiIiIiDKOARsRERFRxjFgIyIiIsq4JGDj0wZERERE2cQSNiIiIqKMY8BGRERElHEM2IiIiIgy
    jgEbERERUcYxYCMiIiLKOAZsRERERBnHgI2IiIgo4xiwEREREWUcAzYiIiKijGPARkRERJRxDNiI
    iIiIMo4BGxEREVHGMWAjIiIiyjgGbEREREQZx4CNPq7wwAAAIABJREFUiIiIKOMYsBERERFlHAM2
    IiIiooxjwEZERESUcQzYiIiIiDKOARsRERFRxjFgIyIiIso4BmxEREREGceAjYiIiCjjGLARERER
    ZRwDNiIiIqKMY8BGRERElHEM2IiIiIgyjgEbERERUcYxYCMiIiLKOAZsRERERBnHgI2IiIgo4xiw
    EREREWUcAzYiIiKijGPARkRERJRxDNiIiIiIMo4BGxEREVHGMWAjIiIiyjgGbEREREQZx4CNiIiI
    KOMYsBERERFlHAM2IiIiooxjwEZERESUcQzYiIiIiDKOARsRERFRxjFgIyIiIso4BmxEREREGceA
    jYiIiCjjGLARERERZRwDNiIiIqKMY8BGRERElHEM2IiIiIgyzgCQLzsRRERERNQZS9iIiIiIMo4B
    GxEREVHGMWAjIiIiyjgGbEREREQZx4CNiIiIKOMYsBERERFlHAM2IiIiooxjwEZERESUcQzYiIiI
    iDKOARsRERFRxjFgIyIiIso4BmxEREREGceAjYiIiCjjGLARERERZRwDNiIiIqKMY8BGRERElHEM
    2IiIiIgyjgEbERERUcYxYCMiIiLKOAZsRERERBnHgI2IiIgo4xiwEREREWUcAzYiIiKijGPARkRE
    RJRxDNiIiIiIMo4BGxEREVHGMWAjIiIiyjgGbEREREQZx4CNiIiIKOMYsBERERFlHAM2IiIiooxj
    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
    wQZ8VDYZAB+GYAMA6JxgAz6mZkYU+DjsEgU+JhOiwAdihA0AoHOCDQCgc4INAKBzgg0AoHOCDQCg
    c4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0A
    oHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBz
    gg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4IN
    AKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCg
    c4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0A
    oHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBz
    gg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4IN
    AKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCg
    c4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0A
    oHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBz
    gg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4IN
    AKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCg
    c4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0A
    oHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBz
    gg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4IN
    AKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCg
    c4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0A
    oHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBz
    gg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4IN
    AKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCg
    c4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0A
    oHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBz
    gg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4IN
    AKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCg
    c4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0A
    oHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBz
    gg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4IN
    AKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCg
    c4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzYDTCYAAAIABJREFUgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0A
    oHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBz
    gg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4IN
    AKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCg
    c4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0A
    oHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBz
    gg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4IN
    AKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCg
    c4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0A
    oHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBz
    gg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4IN
    AKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCg
    c4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOC
    DQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0A
    oHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBz
    gg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc4IN
    AKBzgg0AoHOCDQCgc4INAKBzgg0AoHOCDQCgc39FsOVf8EwAgH8tI2wAAJ0TbAAAnRNsAACdE2wA
    AJ0TbAAAnRNsAACdE2wAAJ0TbAAAnRNsAACdE2wAAJ0TbAAAnRNsAACdE2wAAJ0TbAAAnRNsAACd
    E2wAAJ0TbAAAnRNsAACdE2wAAJ0TbAAAnRNsAACdE2wAAP8/e3cWJMd92Hn++/9n1tn3jcbVQOMg
    DhIkSAI8JVISddqybI1GmrW9sRHeDYd3YuZh3vZx92WeHLGx69iI2Znd8YTX11i2LI8OX6JI8RB4
    Ewdxo9EAutF3o++urqrM/38fsqq7AQo6cSTZv08E2eiqrMys6qqs3/9OOQU2ERERkZRTYBMRERFJ
    OQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMR
    ERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRT
    YBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERER
    kZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2
    ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJ
    OQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMR
    ERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRT
    YBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERER
    kZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJuTsd2Mwd3p+IiIjIhqcaNhER
    EZGUU2ATERERSTkFNhEREZGUU2C7g9SBT0RERO4GBTYRERGRlFNgu1NUvSYiIiJ3iQKbiIiknsrE
    stEpsImIiIiknAKbiIiISMopsImIiIiknAKbiIiISMopsImIiIiknAKbiIiISMopsImIiIiknAKb
    iIiISMopsImIiIiknAKbiIiISMopsImIiIiknAKbiIiISMopsImIiIiknAKbiIiISMopsImIiIik
    nAKbiIiISMopsImIiIiknAKbiIiISMopsImIiIiknAKbiIiISMopsImIiIiknAKbiIiISMopsImI
    iIiknAKbiIiISMpZwNzvkxARERGR21MNm4iIiEjKKbCJiIiIpJwCm4iIiEjKKbCJiIiIpJwCm4iI
    iEjKKbCJiIiIpJwCm4iIiEjKKbCJiIiIpJwCm4iIiEjKKbB9vGjVChERkY8hBTYRERGRlFNgExGR
    lFPjgYgCm4iIiEjKKbCJiIiIpJwCm4iIiEjKKbCJiIiIpJwCm4iIiEjKKbCJiIiIpJwCm4iIiEjK
    KbCJiIiIpJwCm4iIiEjKKbCJiIiIpJwCm4iIiEjKKbCJiIiIpJwCm4iIiEjKKbCJiIiIpJwCm4iI
    iEjKKbCJiIiIpJwCm4iIiEjKKbCJiIiIpJwCm4iIiEjKKbCJiIiIpJwCm4iIiEjKKbCJiIiIpJwC
    m4j8Isz9PgERkY1IgU1EREQk5RTYRERERFJOgU1EREQk5RTYRERERFJOgU1EREQk5RTYRERERFJO
    gU1EREQk5RTYRERERFJOgU1ERD4SNGuzbGQKbCIiIiIpp8AmIiIiknIKbCIiIiIpp8AmIiIiknIK
    bHeUusSKiIjInafAdocoqomIiMjdosAmIiIiknIKbCIiIiIpp8AmIiIiknJ3JbCpP5eIiIjInaMa
    NhEREZGUU2ATERERSTkFNhEREZGUU2ATERERSTkFNhEREZGUU2ATERERSTkFNhEREZGUU2ATERER
    STkFNhEREZGUU2C7k7TEg4iIiNwFCmwiIiIiKafAJiIiIpJyCmwiIiIiKafAJiI/J3XSFBG5XxTY
    RERERFJOgU1EREQk5RTYRERERFJOgU1EREQk5RTYRERERFJOgU1EREQk5RTYRERERFJOgU1EREQk
    5RTYRERERFJuNbBpDnMRERGRdFINm4iIiEjKKbCJiIiIpJwF8O5+n4aIiIiIrPHgwtXfLGAw6sEm
    IiIikjK+/g81iYqIiIik02qNWvjTthIRERGR+2Wtz5pq2ERERERSToFNREREJOUU2ERERETSaN0s
    HhbweH/bbUVERETk/rIAoQ+U2ERERERSw7C+IdRSq3DTTGwiIiIi6VSPblrrQERERCSl7C0/RURE
    RCRlVoNafD/PQkRERERutm5QqK39pyo2ERERkXRZ7bK2OuhAndhERERE0slSGyAa3OcT+cgz932g
    7f0+vojIXWJu+Skb3kZ5K6ybdM16cM7F7pbbf3nW+Y3XvJq8cvZ+1lN6HKotlbvLGqL7fQ6yAcXg
    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
    ykZj6v/foB9wkV+MWf3fx1nSAeeedZIwt/z8+DNgI0xcWzJj7dabfoqIiIjIfXNzq28yStppXiUR
    ERGRtLKwQRqDRURERD5K3FrT561NoiIiIiKSBsbctOSXx7OhlpMSERER+WhIEpoFrNHoRhEREZG0
    WR15UI9qGnMgIiIikipr8awW2NQgKiIiIpIeBiy2vu5lLbB97Fd4EBEREflo8fh6JZslqW9TLzYR
    ERGRlFJQExEREUk5BTYRERGRlFNgExEREUk5BTYRERGRlNO0HiIiIiKptDaLh6b1EBEREUkju9YS
    qiZRERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMR
    ERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRT
    YBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERERkZRTYBMRERFJOQU2ERGp
    8eDv9zmIyE+iwCYiIjUGzP0+BxH5SRTYRERERFJOgU1EREQk5RTYRERERFJOgU1EREQk5RTYRERE
    RFJOgU1EREQk5RTYRERERFJOgU1E7hC/fsrVW6ZfdX7tZr/uTu/B1bb27pYHJxt6j4c4udn5+mFu
    Olry2817WbfB6k1r51Db9+1OPxHfdOfaea9u+aGHrJt41rmfcOf6U1jd+sPP5Nbz8ev+f1e5e3Qc
    EflFKbCJyB1iVqdcjW+ZftVjDd655GazeqfHGLBgiCLM6vXI4L33GAwOY/AQAMZjTf0wxtSjlweM
    8R4DHmOTCOiNWc19Frz33huon4PBENVOxNd3mMSVtbwSADh8/bmZ2uEMeEdyxHr2q595chZ4rL01
    +hjwZjVSGpwheYarr5P3Pnm69adUe4LJbfdgSlvLvTmOiPyiFNhE5I4LSKrD6r8nacfam2qKkuBD
    lGwVhni3VhNnTC2XWXCrF6pakqjU6tJq0cvgk0jlIQlpNklYZvVR3pvaHi3gcTgHYVJp5g2Adw5b
    z5DrWWpJrr6f5NRt7YhJ9qP+lHzteRkX8aHokyQvY2sBzOI9q2ly7Vmb5BTrKTH5cQ8WjVLNmkiK
    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
    UNeMuJA5AAAAAElFTkSuQmCC
    """))

# Write embedded font to temp file
with open("temp_font.ttf", "wb") as f:
    f.write(base64.b64decode("""
    AAEAAAASAQAABAAgRFNJRwAAAAIAAFnkAAAACEdERUYAFABEAABL0AAAABZHUE9TKH9FiAAAS+gA
    AA1kR1NVQo4bje4AAFlMAAAAmE9TLzIxMCybAAABqAAAAGBjbWFwBikJcQAAAxgAAAF0Y3Z0IARZ
    AWQAAAZgAAAAGGZwZ20GWZw3AAAEjAAAAXNnYXNwAAAAEAAAS8gAAAAIZ2x5Zrkaiq8AAAZ4AABB
    hGhlYWQlKB/ZAAABLAAAADZoaGVhBsYC4AAAAWQAAAAkaG10eIkVCIAAAAIIAAABEGxvY2ECVfLy
    AABH/AAAAIptYXhwAlICBQAAAYgAAAAgbmFtZY+QMGwAAEiIAAACiXBvc3Slpz/qAABLFAAAALJw
    cmVwArCYVQAABgAAAABgAAEAAAABAACixiHiXw889QAbA+gAAAAA4UNulgAAAADhQ26WAAD/BQNy
    AsUAAAAGAAIAAAAAAAAAAQAAAu7/BgBkA5UAAAAAA3IAAQAAAAAAAAAAAAAAAAAAAEQAAQAAAEQA
    RgADAAAAAAABAAAAAAAKAAACAAG+AAAAAAAEAgsCWAAFAAQCigJYAAAASwKKAlgAAAFeADIBLAAA
    AAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAgICAgAMAAAAB6Au7/BgBkAu4A+gAAAAEAAAAAAfQC
    vAAAACAAAwD6AAAAAAAAAPoAAAD6AAACMAAiAhcAIgIxACICQAAiAcIAIgHCACICTAAiAkIAIgDJ
    ACIBngAiAfUAIgHCACIDHAAiAsIAIgMBACICGwAiAwEAIgIbACICLAAjAiAAIgI6ACICMAAiA5UA
    IgJYACICMQAiAlAAIgCuACICDAAiAmoAIgHQACICagAiAkkAHQGPACICJAAiAhQAIgDLACMBngAi
    Ae4AIgDJACIDXwAiAhQAIgJDACICagAiAmoAIgFXACIB/wAjAaYAIgIUACICMAAiAxcAIgInACIC
    MgAkAm4AIgDAACICZwAiAQoAIgIrACIBtwAiArYAIgIrACICRQAiAlAAIgIBACICRQAiAAAAAwAA
    AAMAAAEcAAEAAAAAABwAAwABAAABHAAGAQAAAAAAAHsAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    AAACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMAAAAAAAAAAAAAAAAAAAAA
    AAAAAAAAADkAAAAeAAAAOgA7ADwAPQA+AD8AQABBAEIAQwAAAAAAAAAAAAAAAAAAAAQABQAGAAcA
    CAAJAAoACwAMAA0ADgAPABAAEQASABMAFAAVABYAFwAYABkAGgAbABwAHQAAAAAAAAAAAAAAAAAf
    ACAAIQAiACMAJAAlACYAJwAoACkAKgArACwALQAuAC8AMAAxADIAMwA0ADUANgA3ADgABABYAAAA
    EgAQAAMAAgAAAA0AIAAsAC4AOQBaAHr//wAAAAAADQAgACwALgAwAEEAYf//AAH/9f/jAA3/8AAK
    /8P/vgABAAAAAAAAAAAAAAAAAAAAAAAAuAAALEu4AAlQWLEBAY5ZuAH/hbgARB25AAkAA19eLbgA
    ASwgIEVpRLABYC24AAIsuAABKiEtuAADLCBGsAMlRlJYI1kgiiCKSWSKIEYgaGFksAQlRiBoYWRS
    WCNlilkvILAAU1hpILAAVFghsEBZG2kgsABUWCGwQGVZWTotuAAELCBGsAQlRlJYI4pZIEYgamFk
    sAQlRiBqYWRSWCOKWS/9LbgABSxLILADJlBYUViwgEQbsEBEWRshISBFsMBQWLDARBshWVktuAAG
    LCAgRWlEsAFgICBFfWkYRLABYC24AAcsuAAGKi24AAgsSyCwAyZTWLBAG7AAWYqKILADJlNYIyGw
    gIqKG4ojWSCwAyZTWCMhuADAioobiiNZILADJlNYIyG4AQCKihuKI1kgsAMmU1gjIbgBQIqKG4oj
    WSC4AAMmU1iwAyVFuAGAUFgjIbgBgCMhG7ADJUUjISMhWRshWUQtuAAJLEtTWEVEGyEhWS0AuAAA
    KwC6AAEAAgACKwG6AAMAAQACKwG/AAMAHAAXABIADQAIAAAACCsAvwABADcALAAiABkADwAAAAgr
    vwACADMALAAiABkADwAAAAgrALoABAAEAAcruAAAIEV9aRhEAAoAZQBsAMYAAAAA/zMALQH0AAwC
    vAAAAAIAIgAAAg4CvAACAAoAQrgAACsAuAAARVi4AAQvG7kABAAKPlm4AABFWLgAAy8buQADAAQ+
    WbgAAEVYuAAGLxu5AAYABD5ZugABAAgAAyswMTczCwETMxMjJyMH1YxH+Jq8locZpSDwAU39wwK8
    /USKigAAAwAiAAAB9QK8AAcADwAoAMC4AAArALgAAEVYuAARLxu5ABEACj5ZuAAARVi4ABAvG7kA
    EAAEPlm6AAoAHAADK7gAEBC4AADcuAAcELgABty4ABEQuAAI3AG4ACkvuAAEL7gAKRC4ABDQuAAQ
    L7gAANxBBQDaAAQA6gAEAAJdQRsACQAEABkABAApAAQAOQAEAEkABABZAAQAaQAEAHkABACJAAQA
    mQAEAKkABAC5AAQAyQAEAA1duAAI0LgABBC4AAzQuAAEELgAI9y4ABXQMDE3MzI2NTQrAREVMzI1
    NCYjAxEhMhYVFA4CBwYHMB4EFRQOAiOnXTM5bF1dbDY24gEUWGcOGB4QJS8YJSwmGRwzRiplNz91
    AQehUisk/akCvExPHSwhFwgSAwILFyk/LS9LNBwAAAAAAQAiAAACDgK8ACABKLgAACsAuAAARVi4
    AAUvG7kABQAKPlm4AABFWLgAHC8buQAcAAQ+WboACAAcAAUREjm4AAUQuAAL3EEFANkACwDpAAsA
    Al1BGwAIAAsAGAALACgACwA4AAsASAALAFgACwBoAAsAeAALAIgACwCYAAsAqAALALgACwDIAAsA
    DV24ABwQuAAV3EEbAAcAFQAXABUAJwAVADcAFQBHABUAVwAVAGcAFQB3ABUAhwAVAJcAFQCnABUA
    twAVAMcAFQANXUEFANYAFQDmABUAAl26ABgAHAAFERI5AboAEAAAAAMrQRsABgAQABYAEAAmABAA
    NgAQAEYAEABWABAAZgAQAHYAEACGABAAlgAQAKYAEAC2ABAAxgAQAA1dQQUA1QAQAOUAEAACXTAx
    EzQ+AjMyFxUuASMiDgIVFB4CMzI2NxUOASMiLgIiN1+ASEk/FjgkMVdBJSZAWDElPBYgSCZIgF83
    AV5IgF83G3kSFiZCWDIxWEInFhF1DhA3X4AAAAAAAgAiAAACHwK8AA4AGwBCuAAAKwC4AABFWLgA
    AC8buQAAAAo+WbgAAEVYuAANLxu5AA0ABD5ZuAAAELgAD9y4AA0QuAAQ3AG6AA8AAAADKzAxEyEy
    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
    L7gAAdy4AAYQuAAC0LgABhC4AAXcuAABELgAB9AwMRMzAREzEScBESMihQF0hYX+jIUCvP3zAg39
    RAECDv3xAAAAAgAiAAAC3gK8ABMAJwFyuAAAKwC4AABFWLgABS8buQAFAAo+WbgAAEVYuAAPLxu5
    AA8ABD5ZuAAZ3EEbAAcAGQAXABkAJwAZADcAGQBHABkAVwAZAGcAGQB3ABkAhwAZAJcAGQCnABkA
    twAZAMcAGQANXUEFANYAGQDmABkAAl24AAUQuAAj3EEFANkAIwDpACMAAl1BGwAIACMAGAAjACgA
    IwA4ACMASAAjAFgAIwBoACMAeAAjAIgAIwCYACMAqAAjALgAIwDIACMADV0BuAAoL7gAHi+4ACgQ
    uAAA0LgAAC9BBQDaAB4A6gAeAAJdQRsACQAeABkAHgApAB4AOQAeAEkAHgBZAB4AaQAeAHkAHgCJ
    AB4AmQAeAKkAHgC5AB4AyQAeAA1duAAeELgACty4AAAQuAAU3EEbAAYAFAAWABQAJgAUADYAFABG
    ABQAVgAUAGYAFAB2ABQAhgAUAJYAFACmABQAtgAUAMYAFAANXUEFANUAFADlABQAAl0wMRM0PgIz
    Mh4CFRQOAiMiLgI3FB4CMzI+AjU0LgIjIg4CIjdfgEhIgF83N1+ASEiAXzeFIjtPLS1QOyIiO1At
    LU87IgFeSIBfNzdfgEhIgF83N1+ASC1POyIiO08tLVA7IiI7UAAAAAACACIAAAH4ArwACAAXAKS4
    AAArALgAAEVYuAASLxu5ABIACj5ZuAAARVi4ABAvG7kAEAAEPlm6AAIADgADK7gAEhC4AADcAbgA
    GC+4AAUvuAAYELgAEdC4ABEvuAAQ3LgAANBBBQDaAAUA6gAFAAJdQRsACQAFABkABQApAAUAOQAF
    AEkABQBZAAUAaQAFAHkABQCJAAUAmQAFAKkABQC5AAUAyQAFAA1duAAFELgACdwwMRMVMzI2NTQm
    IxcUDgIrAREjESEyHgKnWDNCQzL5M0RCDoqFAQ8rSTUeAlfSMjc4MXJATioN/uACvB84UAACACL/
    /wLeArwAFwAvAYe4AAArALgAAEVYuAAdLxu5AB0ACj5ZuAAARVi4ACcvG7kAJwAEPlm4AABFWLgA
    Ky8buQArAAQ+WbgABdxBGwAHAAUAFwAFACcABQA3AAUARwAFAFcABQBnAAUAdwAFAIcABQCXAAUA
    pwAFALcABQDHAAUADV1BBQDWAAUA5gAFAAJduAAdELgAE9xBBQDZABMA6QATAAJdQRsACAATABgA
    EwAoABMAOAATAEgAEwBYABMAaAATAHgAEwCIABMAmAATAKgAEwC4ABMAyAATAA1dAbgAMC+4AA4v
    uAAwELgAGNC4ABgvuAAA3EEbAAYAAAAWAAAAJgAAADYAAABGAAAAVgAAAGYAAAB2AAAAhgAAAJYA
    AACmAAAAtgAAAMYAAAANXUEFANUAAADlAAAAAl1BBQDaAA4A6gAOAAJdQRsACQAOABkADgApAA4A
    OQAOAEkADgBZAA4AaQAOAHkADgCJAA4AmQAOAKkADgC5AA4AyQAOAA1duAAOELgAIty4ACbQuAAm
    LzAxExQeAjMyNjcnNxc+ATU0LgIjIg4CBzQ+AjMyHgIVFAYHFwcnDgEjIi4CpyI7Ty0fNRY4SDoS
    FCI7UC0tTzsihTdfgEhIgF83JiJER0UraTpIgF83AV4tTzsiEhE4RzoXOiAtUDsiIjtQLUiAXzc3
    X4BIPGssREhFICQ3X4AAAgAiAAAB+AK8AAgAHADZuAAAKwC4AABFWLgAFy8buQAXAAo+WbgAAEVY
    uAASLxu5ABIABD5ZuAAARVi4ABUvG7kAFQAEPlm6AAIADgADK7gAFxC4AADcuAAOELgAEdC4ABEv
    ugAUABIAFxESOQG4AB0vuAAFL7gAHRC4ABbQuAAWL7gAFdy4AADQQQUA2gAFAOoABQACXUEbAAkA
    BQAZAAUAKQAFADkABQBJAAUAWQAFAGkABQB5AAUAiQAFAJkABQCpAAUAuQAFAMkABQANXbgABRC4
    AAncugARABYACRESObgAEtAwMRMVMzI2NTQmIxcUDgIHBiIHEyMDESMRITIeAqdYM0JDMvkgMjwd
    CCAG2XnYhQEPK0k1HgJX0jI3ODFyM0YuFwMBAf7eASD+4AK8HzhQAAAAAQAj//8CCAK/ADEA07gA
    ACsAuAAARVi4AB8vG7kAHwAEPlm6AAUAEAADK7gAHxC4ACbcQRsABwAmABcAJgAnACYANwAmAEcA
    JgBXACYAZwAmAHcAJgCHACYAlwAmAKcAJgC3ACYAxwAmAA1dQQUA1gAmAOYAJgACXQG6ABMAAAAD
    K0EbAAYAEwAWABMAJgATADYAEwBGABMAVgATAGYAEwB2ABMAhgATAJYAEwCmABMAtgATAMYAEwAN
    XUEFANUAEwDlABMAAl24AAAQuAAi0LgAIi+6ACMAIgATERI5MDETND4CMzIeAhcHLgMjIgYVFB4E
    FRQOAiMiJic3HgEzMj4CJy4FJCxLZDkhPzYrDwESMDQ2F0hTNE5bTjQsTWY6RGggAR5lQyI5KBcB
    ATVOWk4zAgkvRC0WCA4PCHMQFg4GNCQeLSgqNkgzMEQrFR0OcxchCxYgFSEvKCg1RgAAAAEAIgAA
    Af4CvAAHAEK4AAArALgAAEVYuAACLxu5AAIACj5ZuAAARVi4AAYvG7kABgAEPlm4AAIQuAAA3LgA
    BNC4AAXQAboABQAAAAMrMDETIzUhFSMRI82rAdyshQJXZWX9qQABACIAAAIYArwAEwCluAAAKwC4
    AABFWLgAAC8buQAAAAo+WbgAAEVYuAAHLxu5AAcACj5ZuAAARVi4AA4vG7kADgAEPlm4AATcQRsA
    BwAEABcABAAnAAQANwAEAEcABABXAAQAZwAEAHcABACHAAQAlwAEAKcABAC3AAQAxwAEAA1dQQUA
    1gAEAOYABAACXQG4ABQvuAAGL7gAFBC4AADQuAAAL7gAAdy4AAYQuAAJ3DAxEzMRFDMyNREzERQO
    AiMiLgI1IoV2doUZOmJIS2E4FQK8/imAgAHX/iYxUzwiIjxTMQABACIAAAIOArwABgBEuAAAKwC4
    AABFWLgAAC8buQAAAAo+WbgAAEVYuAACLxu5AAIACj5ZuAAARVi4AAQvG7kABAAEPlm6AAEABAAA
    ERI5MDEbAjMDIwOpcW2HlryaArz9wwI9/UQCvAAAAAABACIAAANyArwADAB6uAAAKwC4AABFWLgA
    AC8buQAAAAo+WbgAAEVYuAACLxu5AAIACj5ZuAAARVi4AAkvG7kACQAKPlm4AABFWLgABC8buQAE
    AAQ+WbgAAEVYuAAHLxu5AAcABD5ZugABAAQAABESOboABgAEAAAREjm6AAsABAAAERI5MDEBGwEz
    AyMLASMDMxsBAg5xbYaWu1ZTvJqHcW0CvP3DAj39RAGC/n4CvP3DAj0AAAAAAQAiAAACNgK8AAsA
    X7gAACsAuAAARVi4AAQvG7kABAAKPlm4AABFWLgABy8buQAHAAo+WbgAAEVYuAABLxu5AAEABD5Z
    uAAARVi4AAovG7kACgAEPlm6AAAAAQAEERI5ugAGAAEABBESOTAxJQcjEwMzFzczAxMjASxymL6+
    mHJymL6+mNPTAV4BXtPT/qL+ogAAAAEAIgAAAg4CuwAIAFe4AAArALgAAEVYuAABLxu5AAEACj5Z
    uAAARVi4AAQvG7kABAAKPlm4AABFWLgABy8buQAHAAQ+WboAAwAHAAEREjkBugAGAAAAAyu6AAMA
    AAAGERI5MDETAzMbATMDESPdu4hxbIethAEFAbb+zQEz/kr++wAAAAEAIgAAAi4CvAAHADm4AAAr
    ALgAAEVYuAACLxu5AAIACj5ZuAAARVi4AAYvG7kABgAEPlm4AAIQuAAA3LgABhC4AATcMDEBITUh
    ASEVIQFl/r0CC/6/AUL99gJXZf2pZQAAAAABACIAAACLAGYACwCxuAAAKwC4AABFWLgACS8buQAJ
    AAQ+WbgAA9xBGwAHAAMAFwADACcAAwA3AAMARwADAFcAAwBnAAMAdwADAIcAAwCXAAMApwADALcA
    AwDHAAMADV1BBQDWAAMA5gADAAJdAboABgAAAAMrQRsABgAGABYABgAmAAYANgAGAEYABgBWAAYA
    ZgAGAHYABgCGAAYAlgAGAKYABgC2AAYAxgAGAA1dQQUA1QAGAOUABgACXTAxNzQ2MzIWFRQGIyIm
    Ih8WFh4eFhYfMxUeHhUVHh4AAgAi//kB6gIAAAwANAGbuAAAKwC4AABFWLgALy8buQAvAAg+WbgA
    AEVYuAANLxu5AA0ABD5ZuAAARVi4ABIvG7kAEgAEPlm6ABwAAwADK7gAEhC4AAncQRsABwAJABcA
    CQAnAAkANwAJAEcACQBXAAkAZwAJAHcACQCHAAkAlwAJAKcACQC3AAkAxwAJAA1dQQUA1gAJAOYA
    CQACXbgAEhC4AA7QuAAOL7oADwASAAkREjm6AB8AAwAcERI5uAAvELgAJNxBBQDZACQA6QAkAAJd
    QRsACAAkABgAJAAoACQAOAAkAEgAJABYACQAaAAkAHgAJACIACQAmAAkAKgAJAC4ACQAyAAkAA1d
    ugApAAMAHBESOQG4ADUvuAAAL7gANRC4ABfQuAAXL7gABtxBGwAGAAYAFgAGACYABgA2AAYARgAG
    AFYABgBmAAYAdgAGAIYABgCWAAYApgAGALYABgDGAAYADV1BBQDVAAYA5QAGAAJduAAAELgADtC4
    AA4vuAAAELgANNy6AA8AAAA0ERI5uAAAELgAH9C4AB8vugApABcABhESOTAxJS4BIyIGFRQWMzI2
    NxcjNQ4BIyIuAjU0PgIzMhYXLgMjIg4CBzU+AzMyHgIVAWUDNyYqMzMrJjcChYQXQSorRzMdHTNH
    KyhAFgMXIi0aJTsrHgkIITNEKy5XRCm3Ji86KSg7LyecNBohHC8/IyQ/LxsdGSIvHg4VHR8KdwUY
    GRQbOl5EAAACACL/9QJIArwAEwAoAW+4AAArALgAAEVYuAAVLxu5ABUACj5ZuAAARVi4ABovG7kA
    GgAIPlm4AABFWLgAFC8buQAUAAQ+WbgABdxBGwAHAAUAFwAFACcABQA3AAUARwAFAFcABQBnAAUA
    dwAFAIcABQCXAAUApwAFALcABQDHAAUADV1BBQDWAAUA5gAFAAJduAAaELgAD9xBBQDZAA8A6QAP
    AAJdQRsACAAPABgADwAoAA8AOAAPAEgADwBYAA8AaAAPAHgADwCIAA8AmAAPAKgADwC4AA8AyAAP
    AA1dugAXABoADxESObgABRC4ACTcugAnABQABRESOQG4ACkvuAAKL7gAKRC4ABTQuAAUL7gAKNy4
    AADQuAAAL0EFANoACgDqAAoAAl1BGwAJAAoAGQAKACkACgA5AAoASQAKAFkACgBpAAoAeQAKAIkA
    CgCZAAoAqQAKALkACgDJAAoADV24ACgQuAAW0LgAChC4AB/cugAXABQAHxESOTAxNxQeAjMyPgI1
    NC4CIyIOAgMRMxE+ATMyHgIVFA4CIyImJxWmFyc2HyIzIxITJDMgHzYoFoSFHVw5NFg/JCRAVzQ6
    Wx33HzcpFxkpNh0fOCoZGCk4/ukCvP7cLTUpRl41NV5HKTUtVwAAAAEAIv/1Aa4B+gAhAL24AAAr
    ALgAAEVYuAANLxu5AA0ACD5ZugAeAAMAAyu4AA0QuAAU3EEFANkAFADpABQAAl1BGwAIABQAGAAU
    ACgAFAA4ABQASAAUAFgAFABoABQAeAAUAIgAFACYABQAqAAUALgAFADIABQADV0BugAZAAgAAytB
    GwAGABkAFgAZACYAGQA2ABkARgAZAFYAGQBmABkAdgAZAIYAGQCWABkApgAZALYAGQDGABkADV1B
    BQDVABkA5QAZAAJdMDElDgEjIi4CNTQ+AjMyFhcHLgEjIg4CFRQeAjMyNjcBrRhLNjNZQSUlQVo1
    M0gcARQ8JCM2JhMSJDYkKTwRMxcnKUdeNTVeRikkGWIaGxkqOB8dNikZHhcAAAACACL/9QJIArwA
    EwAoAWW4AAArALgAAEVYuAAnLxu5ACcACj5ZuAAARVi4ACMvG7kAIwAIPlm4AABFWLgAFC8buQAU
    AAQ+WbgAIxC4AAXcQQUA2QAFAOkABQACXUEbAAgABQAYAAUAKAAFADgABQBIAAUAWAAFAGgABQB4
    AAUAiAAFAJgABQCoAAUAuAAFAMgABQANXbgAFBC4AA/cQRsABwAPABcADwAnAA8ANwAPAEcADwBX
    AA8AZwAPAHcADwCHAA8AlwAPAKcADwC3AA8AxwAPAA1dQQUA1gAPAOYADwACXboAFgAUAA8REjm4
    ABncugAmACMABRESOQG4ACkvuAAVL7gAANC4AAAvuAApELgAHtC4AB4vuAAK3EEbAAYACgAWAAoA
    JgAKADYACgBGAAoAVgAKAGYACgB2AAoAhgAKAJYACgCmAAoAtgAKAMYACgANXUEFANUACgDlAAoA
    Al24ABUQuAAU3LgAFRC4ACbQMDElNC4CIyIOAhUUHgIzMj4CFyM1DgEjIi4CNTQ+AjMyFhcRMwHE
    Fic2HyEzJBMSIzMiIDUoFoSFHVs6M1hAJCRAVzQ5XB2F+CA3KRgZKjgfHTYpGRcpN9hXLTUpR141
    NV5GKTUtASQAAAIAHf/zAiYB9wAMACwAbrgAACsAuAAARVi4ABwvG7kAHAAIPlm6ACcAEgADK7gA
    HBC4AAXcQQUA2QAFAOkABQACXUEbAAgABQAYAAUAKAAFADgABQBIAAUAWAAFAGgABQB4AAUAiAAF
    AJgABQCoAAUAuAAFAMgABQANXTAxAS4DIyIHDgMXBQ4DIyIuAjc+AzMyHgIHBR4DMz4DNwHBBhoj
    KhUVEBwrHQsFAWIRN0FEHTplSCQHBi5GWzQoWEovAf6WDCEmKBMhQTktDAE/ExwTCgQGICw0GpAY
    JhkNKUpoPjRWPiMWM1M8fRMaEQgBFB4kEAABACIAAAFsAroAGwDluAAAKwC4AABFWLgAAC8buQAA
    AAg+WbgAAEVYuAATLxu5ABMACD5ZuAAARVi4AAUvG7kABQAKPlm4AABFWLgABy8buQAHAAo+WbgA
    AEVYuAAXLxu5ABcABD5ZugALABcABxESObgABxC4AA7cQQUA2QAOAOkADgACXUEbAAgADgAYAA4A
    KAAOADgADgBIAA4AWAAOAGgADgB4AA4AiAAOAJgADgCoAA4AuAAOAMgADgANXbgAExC4ABXcuAAZ
    0LgAGtABugAWAAAAAyu4ABYQuAAT0LgAEy+4AAAQuAAY0LgAGC8wMRM+Azc2MzIWFxUuASMiBw4B
    BzMVIxMjAyM1TQUdKzYeDxIZLhYUJxEKCx4ZApqcAoQDKQH0MUYvGQMEDw1vFBIDBzQjZf5xAY9l
    AAAAAAIAIv8GAgACSQATAEEBvrgAACsAuAAARVi4ABkvG7kAGQAIPlm4AABFWLgALC8buQAsAAY+
    WboABQA9AAMruAAZELgAD9xBBQDZAA8A6QAPAAJdQRsACAAPABgADwAoAA8AOAAPAEgADwBYAA8A
    aAAPAHgADwCIAA8AmAAPAKgADwC4AA8AyAAPAA1dugAbABkADxESOboAMAAsABkREjm4ACwQuAAz
    3EEbAAcAMwAXADMAJwAzADcAMwBHADMAVwAzAGcAMwB3ADMAhwAzAJcAMwCnADMAtwAzAMcAMwAN
    XUEFANYAMwDmADMAAl26ADoAPQAFERI5AbgAQi+4AAovuABCELgAFNC4ABQvuAAA3EEbAAYAAAAW
    AAAAJgAAADYAAABGAAAAVgAAAGYAAAB2AAAAhgAAAJYAAACmAAAAtgAAAMYAAAANXUEFANUAAADl
    AAAAAl1BBQDaAAoA6gAKAAJdQRsACQAKABkACgApAAoAOQAKAEkACgBZAAoAaQAKAHkACgCJAAoA
    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
    Al1BGwAIABQAGAAUACgAFAA4ABQASAAUAFgAFABoABQAeAAUAIgAFACYABQAqAAUALgAFADIABQA
    DV26AAIABwAUERI5AbgAHC+4AA4vuAAcELgAANC4AAAvuAAZ3LgAAtC4AAIvuAAOELgADdwwMRMz
    FT4DMzIeAhURIxE0LgIjIg4CFRcjIoUIFyIuHyFDNiOFFR4gCyEqFggBhQH0VA4gHBIXMk83/tMB
    KyEpFQcfLTMT/wAAAgAi//sCIAH5ABMAJwEfuAAAKwC4AABFWLgABS8buQAFAAg+WboAGQAPAAMr
    uAAFELgAI9xBBQDZACMA6QAjAAJdQRsACAAjABgAIwAoACMAOAAjAEgAIwBYACMAaAAjAHgAIwCI
    ACMAmAAjAKgAIwC4ACMAyAAjAA1dAbgAKC+4AB4vuAAoELgAANC4AAAvQQUA2gAeAOoAHgACXUEb
    AAkAHgAZAB4AKQAeADkAHgBJAB4AWQAeAGkAHgB5AB4AiQAeAJkAHgCpAB4AuQAeAMkAHgANXbgA
    HhC4AArcuAAAELgAFNxBGwAGABQAFgAUACYAFAA2ABQARgAUAFYAFABmABQAdgAUAIYAFACWABQA
    pgAUALYAFADGABQADV1BBQDVABQA5QAUAAJdMDE3ND4CMzIeAhUUDgIjIi4CNxQeAjMyPgI1NC4C
    IyIOAiIoRV01NV1FKChFXTU1XUUohRMhLRkaLSETEyEtGhktIRP6NV1FKChFXTU1XUUoKEVdNRos
    IRMTISwaGi0hExMhLQAAAAACACL/MwJIAfoAEwAoAQ64AAArALgAAEVYuAAZLxu5ABkACD5ZuAAA
    RVi4ACcvG7kAJwAGPlm6AAUAIwADK7gAGRC4AA/cQQUA2QAPAOkADwACXUEbAAgADwAYAA8AKAAP
    ADgADwBIAA8AWAAPAGgADwB4AA8AiAAPAJgADwCoAA8AuAAPAMgADwANXbgAFdy6ABYAGQAPERI5
    ugAmACMABRESOQG4ACkvuAAKL7gAKRC4ABTQuAAUL7gAFdy4AADQuAAAL0EFANoACgDqAAoAAl1B
    GwAJAAoAGQAKACkACgA5AAoASQAKAFkACgBpAAoAeQAKAIkACgCZAAoAqQAKALkACgDJAAoADV24
    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
    ZwAZAHcAGQCHABkAlwAZAKcAGQC3ABkAxwAZAA1dQQUA1gAZAOYAGQACXbgABRC4ACPcQQUA2QAj
    AOkAIwACXUEbAAgAIwAYACMAKAAjADgAIwBIACMAWAAjAGgAIwB4ACMAiAAjAJgAIwCoACMAuAAj
    AMgAIwANXQG4ACgvuAAeL7gAKBC4AADQuAAAL0EFANoAHgDqAB4AAl1BGwAJAB4AGQAeACkAHgA5
    AB4ASQAeAFkAHgBpAB4AeQAeAIkAHgCZAB4AqQAeALkAHgDJAB4ADV24AB4QuAAK3LgAABC4ABTc
    QRsABgAUABYAFAAmABQANgAUAEYAFABWABQAZgAUAHYAFACGABQAlgAUAKYAFAC2ABQAxgAUAA1d
    QQUA1QAUAOUAFAACXTAxEzQ+AjMyHgIVFA4CIyIuAjcUHgIzMj4CNTQuAiMiDgIiK0tjOThkSisr
    SmQ4OWNLK4UWJjMeHTMmFhYmMx0eMyYWAV5IgF83N1+ASEiAXzc3X4BILU87IiI7Ty0tUDsiIjtQ
    AAAAAAEAIgAAAOgCvAAIAEq4AAArALgAAEVYuAADLxu5AAMACj5ZuAAARVi4AAUvG7kABQAEPlm6
    AAAACAADK7gAAxC4AAfcAboABAADAAMruAADELgABtAwMRMyNjUzESMRIyImHISEQgJ3ICX9RAIS
    AAABACIAAAIHAr8AIQB/uAAAKwC4AABFWLgACS8buQAJAAQ+WboAHQAWAAMruAAJELgAB9wBugAA
    ABEAAyu4AAAQuAAI0EEFANoAEQDqABEAAl1BGwAJABEAGQARACkAEQA5ABEASQARAFkAEQBpABEA
    eQARAIkAEQCZABEAqQARALkAEQDJABEADV0wMQEUDgQHJRUhND4ENTQuAiMiBgcnPgEzMh4CAgcu
    RlJJNQUBSf4gNE1aTTMaLT4kMGEkAjBeNjFnVDUB/i9VTEM4LxMBcjNjXVhPRh0UIRkOGiBzGBUT
    LUoAAAAAAQAiAAABlAK8ACgAqLgAACsAuAAARVi4AAgvG7kACAAKPlm4AABFWLgAHy8buQAfAAQ+
    WboAAQATAAMruAAIELgABty4AB8QuAAh3LgAExC4ACfcAboADAADAAMrQQUA2gADAOoAAwACXUEb
    AAkAAwAZAAMAKQADADkAAwBJAAMAWQADAGkAAwB5AAMAiQADAJkAAwCpAAMAuQADAMkAAwANXbgA
    DBC4ABrQuAADELgAJdAwMRMzMjU0JisBNTMyFhUUDgIHBgcwHgQVFA4CKwE1MzI2NTQrAWs4bTc2
    gbRYZg4YHg8lLxglLCUZHDJGKrSBNDltOAG2UiskZUxPHSwhFwgSAwILFyk/LS9LNBxlNz91AAAA
    AAIAIgAAApQCvAACAAwAWrgAACsAuAAARVi4AAYvG7kABgAKPlm4AABFWLgAAy8buQADAAQ+WboA
    AQAEAAMruAABELgACNC4AAQQuAAK0AG6AAgAAQADK7gAARC4AAPQuAAIELgAC9AwMRMzGQE1IQEz
    ETMVIxXg3f5lAXKuUlIBLQEX/bzIAfT+cWXIAAAAAAEAIgAEAgcCwwAlAG64AAArALoADAAFAAMr
    ugAbABwAAysBugAAABEAAytBBQDaABEA6gARAAJdQRsACQARABkAEQApABEAOQARAEkAEQBZABEA
    aQARAHkAEQCJABEAmQARAKkAEQC5ABEAyQARAA1duAAAELgAG9AwMSUUDgIjIiYnNx4BMzI+AjU0
    LgY3IRUlHgcCBzZUZzE0YS4CJGEwJD4tGx8zQUNALxsEAeD+twEdLjs+Oy0c60VZNBUVGHMgGg8f
    Lx8kMSYfJDBHY0VyAS05JRYVGCk/AAACACL//gIiAsUAEwA0AUG4AAArALgAAEVYuAAwLxu5ADAA
    BD5ZugAZACAAAyu6ACYADwADK7gAMBC4AAXcQRsABwAFABcABQAnAAUANwAFAEcABQBXAAUAZwAF
    AHcABQCHAAUAlwAFAKcABQC3AAUAxwAFAA1dQQUA1gAFAOYABQACXboAIwAPACYREjkBuAA1L7gA
    Ci+4ADUQuAAU0LgAFC+4AADcQRsABgAAABYAAAAmAAAANgAAAEYAAABWAAAAZgAAAHYAAACGAAAA
    lgAAAKYAAAC2AAAAxgAAAA1dQQUA1QAAAOUAAAACXUEFANoACgDqAAoAAl1BGwAJAAoAGQAKACkA
    CgA5AAoASQAKAFkACgBpAAoAeQAKAIkACgCZAAoAqQAKALkACgDJAAoADV24AAoQuAAr3LoAHQAK
    ACsREjm6ACMAFAAAERI5MDE3FB4CMzI+AjU0LgIjIg4CJzQ+AjMyFhcHLgEjIgYHPgEzMh4CFRQO
    AiMiLgK1EiAqGRgrHxISHysYGCsgEpMgRGpKMEofASBKLUZUChpPMTZYQCMkQ146RmI9HO4XKB4R
    ER4oFxcoHhERHiggUpdzRBwYkCIeTFgeJSM/VjQ0WkImNFRpAAAAAQAiAAACLQK8AAUAMbgAACsA
    uAAARVi4AAIvG7kAAgAKPlm4AABFWLgABC8buQAEAAQ+WbgAAhC4AADcMDEBITUhASMBdf6tAgv+
    4ZUCV2X9RAAAAwAiAAAB3gK8AAkAEwBFAbS4AAArALgAAEVYuAAuLxu5AC4ACj5ZuAAARVi4ABQv
    G7kAFAAEPlm6AAoAIAADK7gAFBC4AADcQRsABwAAABcAAAAnAAAANwAAAEcAAABXAAAAZwAAAHcA
    AACHAAAAlwAAAKcAAAC3AAAAxwAAAA1dQQUA1gAAAOYAAAACXbgAIBC4AAXcuAAuELgAD9xBBQDZ
    AA8A6QAPAAJdQRsACAAPABgADwAoAA8AOAAPAEgADwBYAA8AaAAPAHgADwCIAA8AmAAPAKgADwC4
    AA8AyAAPAA1duAAgELgAOtABuABGL7gAAy9BBQDaAAMA6gADAAJdQRsACQADABkAAwApAAMAOQAD
    AEkAAwBZAAMAaQADAHkAAwCJAAMAmQADAKkAAwC5AAMAyQADAA1duABGELgAGdC4ABkvuAAH3EEb
    AAYABwAWAAcAJgAHADYABwBGAAcAVgAHAGYABwB2AAcAhgAHAJYABwCmAAcAtgAHAMYABwANXUEF
    ANUABwDlAAcAAl24AAMQuAAM0LgABxC4ABLQuAADELgAQdy6ACAAGQBBERI5uAAZELgAJ9C4AEEQ
    uAAz0DAxJTI2NTQjIhUUFhMyNTQmIyIGFRQTIi4CNTQ+BDEmJy4DNTQ+BDMyHgIVFA4CBwYHMB4E
    FRQOAgEAKjBaWS8qWi4sLC1ZGkxGMhkmLCUYLyUQHhgOGSkyMSwNFEpKNg4YHhAlLxglLCYZMUVN
    ZTc/dXU/NwFRUiskJCtS/koQLE8/LT8pFwsCAxIIFyEsHSQyIxQLAwggPjUdLCEXCBIDAgsXKT8t
    P08sEAAAAgAi//4CIgLFABEAMgFBuAAAKwC4AABFWLgAFy8buQAXAAQ+WboALgAFAAMrugANACQA
    Ayu4ABcQuAAe3EEbAAcAHgAXAB4AJwAeADcAHgBHAB4AVwAeAGcAHgB3AB4AhwAeAJcAHgCnAB4A
    twAeAMcAHgANXUEFANYAHgDmAB4AAl26ACEAJAANERI5AbgAMy+4AAAvQQUA2gAAAOoAAAACXUEb
    AAkAAAAZAAAAKQAAADkAAABJAAAAWQAAAGkAAAB5AAAAiQAAAJkAAACpAAAAuQAAAMkAAAANXbgA
    MxC4ACnQuAApL7gACtxBGwAGAAoAFgAKACYACgA2AAoARgAKAFYACgBmAAoAdgAKAIYACgCWAAoA
    pgAKALYACgDGAAoADV1BBQDVAAoA5QAKAAJduAAAELgAEty6ABsAKQAKERI5ugAhAAAAEhESOTAx
    ATQuAiMiDgIVFBYzMj4CFxQOAiMiJic3HgEzMjY3DgEjIi4CNTQ+AjMyHgIBjxIfKhkZKh8SQjIY
    Kx8SkyBDakowSh8BIEotRlQKGk8xNllAIyVDXjpGYj0bAdUXKR4RER4oFy8/ER4oIVKXc0QcGJEj
    HUtZHyUjP1Y0NVpCJTRUaQAAAAAAAAAAAAAAADoA1gGcAeoCKAJgAw4DaAOOA/oESgR2BN4FPgYy
    BqoHtAhQCQAJMgmkCdoKNgqACsIK9AtiDHoNbg4ADu4PaBAIEUQR2hIgEq4TAhMoE/AUgBVKFgwW
    0BdCF/gYThi4GO4ZSBmQGh4aUBqoG5wb1BxIHNQdHB2KHnYeoB/YIMIAAAAAAA8AugABAAAAAAAB
    AA4AAAABAAAAAAACAAcADgABAAAAAAAEABIAFQABAAAAAAAFAA0AJwABAAAAAAAGABEANAADAAEE
    CQAAAGoARQADAAEECQABABwArwADAAEECQACAA4AywADAAEECQADAFYA2QADAAEECQAEACQBLwAD
    AAEECQAFABoBUwADAAEECQAGACIBbQADAAEECQAJAB4BjwADAAEECQAQABABrQADAAEECQARABIB
    vUNhcmx0aW5lIFNlbUJkUmVndWxhckNhcmx0aW5lIFNlbWkgQm9sZFZlcnNpb24gMS4wMDBDYXJs
    dGluZS1TZW1pQm9sZABDAGEAcgBsAHQAaQBuAGUAIAAoAE0AdQBrAHMAYQBsACAAQwByAGUAYQB0
    AGkAdgBlACkALgAgADIAMAAyADMALgAgAEEAbABsACAAUgBpAGcAaAB0AHMAIABSAGUAcwBlAHIA
    dgBlAGQAQwBhAHIAbAB0AGkAbgBlACAAUwBlAG0AQgBkAFIAZQBnAHUAbABhAHIAVgBlAHIAcwBp
    AG8AbgAgADEALgAwADAAMAA7ADsAQwBhAHIAbAB0AGkAbgBlAC0AUwBlAG0AaQBCAG8AbABkADsA
    MgAwADIAMwA7AEYATAA4ADAAMQBDAGEAcgBsAHQAaQBuAGUAIABTAGUAbQBpACAAQgBvAGwAZABW
    AGUAcgBzAGkAbwBuACAAMQAuADAAMAAwAEMAYQByAGwAdABpAG4AZQAtAFMAZQBtAGkAQgBvAGwA
    ZABNAHUAawBzAGEAbABjAHIAZQBhAHQAaQB2AGUACgBDAGEAcgBsAHQAaQBuAGUAUwBlAG0AaQAg
    AEIAbwBsAGQAAAAAAgAAAAAAAP+cADIAAAAAAAAAAAAAAAAAAAAAAAAAAABEAAAAAQECAAMAJAAl
    ACYAJwAoACkAKgArACwALQAuAC8AMAAxADIAMwA0ADUANgA3ADgAOQA6ADsAPAA9ABEARABFAEYA
    RwBIAEkASgBLAEwATQBOAE8AUABRAFIAUwBUAFUAVgBXAFgAWQBaAFsAXABdAA8AEwAUABUAFgAX
    ABgAGQAaABsAHAd1bmkwMDBEAAAAAQAB//8ADwABAAAADAAAAAAAAAACAAEABABDAAEAAAABAAAA
    CgAwAEoAAkRGTFQADmxhdG4AGgAEAAAAAP//AAEAAAAEAAAAAP//AAEAAQACa2VybgAOa2VybgAU
    AAAAAQAAAAAAAQAAAAEABAACAAgAAgAKCPQAAQjUAAQAAAA+AIYAsAEeATQBTgFoAeICCAIIAg4C
    MALGAggCCAE0AygBNAPKBDgEYgUYBSoFKgU8BYIFtAXKBdwF6gIIBfQGEgYoBn4GiAaOBsACCAZ+
    Bn4F3AXcBw4HNAdeB3gGiAeqB6oHtAeqB+YH+AgWCBwINghECF4IaAiGCKQIsgAKAA3/9wAW/+8A
    F/+fABj/8gAc/3wAH//ZACT/5QAo/z8AMv/FADP/2gAbAAT/3AAG/+oACv/qAA3/5gAS/+oAFP/q
    ABf/4gAZ/9wAGv/cABv/5AAc/84AHf/rAB//8wAh//cAIv/3ACP/9wAk//IAJf/3ACj/NgAt//cA
    L//3ADH/8wAy/+UANP/eADX/3gA3/94AOP/zAAUAFv/3ABz/6wAf//MAKP9fADL/7wAGAA3/rwAX
    /6EAG/+pACj/NwAy//cANv/ZAAYAH//3ACT/8wAo/zcAMf/3ADL/8wAz//MAHgAE/6MABv/rAAr/
    6wAN/z0AEv/rABT/6wAW/+8AG//3AB3/9wAf//MAIf/HACL/xwAj/8cAJP/vACX/xwAo/zYAK//z
    ACz/8wAt/8cALv/zAC//xwAw//MAMf/lADL/8wAz//cANP/vADX/7wA2/9oAN//vADj/8wAJABf/
    5QAZ/+IAGv/iABz/1wAo/0EAMv/yADT/1wA1/9cAN//XAAEAKP9CAAgABP/rAA3/6wAc//cAKP+H
    ADH/8wA0//cANf/3ADf/9wAlAAX/9wAG/58AB//3AAn/9wAK/58AC//3AAz/9wAN//cADv/3AA//
    9wAQ//cAEf/3ABL/nwAT//cAFP+fABX/9wAX//cAHP/3AB//xgAg//cAIf+kACL/pAAj/6QAJP/v
    ACX/pAAm//cAKP8yACn/9wAq//cALf+kAC//pAAx//cAMv/BADP/0AA0/6IANf+iADf/ogAYAAT/
    8wAG/5wACv+cABL/nAAU/5wAFv/vABf/bAAY/9wAGf+JABr/iQAc/2UAH//vACH/2gAi/9oAI//a
    ACX/2gAo/0MALf/aAC//2gAy/8UAM//3ADT/kQA1/5EAN/+RACgABP+cAAX/8wAG//MAB//zAAn/
    8wAK//MAC//zAAz/8wAN/yQADv/zAA//8wAQ//MAEf/zABL/8wAT//MAFP/zABX/8wAW/+sAF//V
    ABn/1QAa/9UAG/+vABz/ugAd/8cAH//zACD/8wAh/9EAIv/RACP/0QAk/+8AJf/RACb/8wAo/zwA
    Kf/zACr/8wAt/9EAL//RADH/9wA2//IAOP/3ABsABv/lAAr/5QAN/+sAEv/lABT/5QAW//cAF//m
    ABn/1QAa/9UAHP++AB//4QAh/8YAIv/GACP/xgAl/8YAKP8sACv/9wAs//cALf/GAC7/9wAv/8YA
    MP/3ADH/7wAz//cANP/vADX/7wA3/+8ACgAE/+UADf/rABf/9wAb//MAHP/3ACj/KwAx//cAMv/a
    ADb/1AA4/9MALQAE/58ABf/3AAb/pQAH//cACf/3AAr/pQAL//cADP/3AA3/XgAO//cAD//3ABD/
    9wAR//cAEv+lABP/9wAU/6UAFf/3ABb/7wAc//MAH/9uACD/9wAh/24AIv9uACP/bgAk/74AJf9u
    ACb/9wAn/9EAKP8MACn/9wAq//cAK/9zACz/cwAt/24ALv9zAC//bgAw/3MAMf9yADL/nQAz/24A
    NP9fADX/XwA2/3IAN/9fADj/bwAEAAT/3gAN/+8AKP9DADH/9wAEAA3/jQAo/ygAMv/VADb/1AAR
    AAb/kQAK/5EAEv+RABT/kQAf/9UAIf+8ACL/vAAj/7wAJf+8ACj/VwAt/7wAL/+8ADL/qwAz/9cA
    NP+bADX/mwA3/5sADAAE/5IADf9lABb/wwAf/6EAJP/cACf/8wAo/x8AMf+RADL/yQAz/8MANv+v
    ADj/ywAFABb/7wAf/+sAKP9bADL/xwAz//cABAAf//cAJP/3ACj/LwAy/94AAwAo/yoAMv/GADb/
    ngACACj/NgA2/+QABwAf//MAJP/lACj/LwAx//MAMv/aADb/0AA4/9oABQAf/+sAKP8yADH/5QAy
    //cANv/rABUAH//zACH/5QAi/+UAI//lACT/6QAl/+UAKP/vACv/9wAs//cALf/lAC7/9wAv/+UA
    MP/3ADH/9wAy/+kAM//3ADT/0AA1/9AANv/iADf/0AA4//EAAgAo/zYAMv/aAAEAKP8/AAwAH//3
    ACH/9wAi//cAI//3ACX/9wAo/+8ALf/3AC//9wAy//cANP/3ADX/9wA3//cAEwAf/8YAIf+gACL/
    oAAj/6AAJP/bACX/oAAo/yAAK//3ACz/9wAt/6AALv/3AC//oAAw//cAMf/lADL/ywAz/8oANP/O
    ADX/zgA3/84ACQAh//cAIv/3ACP/9wAl//cALf/3AC//9wA0//cANf/3ADf/9wAKAB//5gAh/78A
    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
    """))

# --- Run MariaDB query and return result ---
def run_query(query):
    cmd = f"sudo mariadb -N -e \"{query}\" -D cashphones"
    try:
        result = subprocess.check_output(cmd, shell=True, text=True).strip()
        return result
    except subprocess.CalledProcessError:
        print("Error running SQL command")
        return None

# --- Get next available invoice number from file name ---
def get_next_invoice_number():
    folder = "./"
    prefix = "bill"
    existing = [f for f in os.listdir(folder) if f.startswith(prefix) and f.endswith(".png")]
    numbers = [int(f[len(prefix):-4]) for f in existing if f[len(prefix):-4].isdigit()]
    next_number = max(numbers) + 1 if numbers else 1
    return next_number

# --- Inputs ---
num_products = int(input("HOW MANY PHONES? = "))
order_ids = []
for i in range(num_products):
    order_ids.append(input(f"ORDER ID {i+1} = "))

phone_number = input("PHONE NUMBER = ")
invoice_number = str(get_next_invoice_number())

# --- Get customer and date info from first order ---
header_query = f"SELECT C_NAME, DATE FROM s_table WHERE ORDER_ID = {order_ids[0]} LIMIT 1;"
header_result = run_query(header_query)
customer, date = header_result.split("\t")

# --- Load image and fonts ---
i = Image.open("temp_bg.png").convert("RGB")
draw = ImageDraw.Draw(i)
font_big = ImageFont.truetype("temp_font.ttf", size=60)
font = ImageFont.truetype("temp_font.ttf", size=50)

# --- Header fields ---
draw.text((66, 603), customer, font=font_big, fill=(0, 0, 0))
draw.text((200, 730), phone_number, font=font, fill=(0, 0, 0))
draw.text((1830, 542), "A0000" + invoice_number, font=font, fill=(0, 0, 0))
draw.text((2210, 542), date, font=font, fill=(0, 0, 0))

# --- Render each product row ---
start_y = 994
row_h = 85
max_rows = 16

total_sell = 0
total_purch = 0
adjusted_row_totals = []

for idx, oid in enumerate(order_ids):
    if idx >= max_rows:
        break

    sale_query = f"SELECT NAME, IMEI, TOTAL FROM s_table WHERE ORDER_ID = {oid};"
    sale_result = run_query(sale_query)
    if not sale_result:
        continue

    name, imei, total = sale_result.split("\t")
    sell_price = int(float(total))

    purchase_query = f"SELECT NAME, TOTAL FROM p_table WHERE ORDER_ID = {oid} LIMIT 1;"
    purchase_result = run_query(purchase_query)
    if purchase_result:
        p_name, p_total = purchase_result.split("\t")
        print(f"PURCHASE: {p_name} -> ₹{p_total}")
    else:
        p_total = "0"

    purchase_price = int(float(p_total))
    profit = sell_price - purchase_price
    gst_per_item = round(profit * 0.09, 2)
    adjusted_total = round(sell_price - 2 * gst_per_item)
    adjusted_row_totals.append(adjusted_total)

    y = start_y + idx * row_h
    draw.text((15, y), f"{idx+1:02}", font=font, fill=(0, 0, 0))
    draw.text((184, y), "01", font=font, fill=(0, 0, 0))
    draw.text((354, y), oid, font=font, fill=(0, 0, 0))
    draw.text((498, y), name, font=font, fill=(0, 0, 0))
    draw.text((1132, y), imei, font=font, fill=(0, 0, 0))
    draw.text((1735, y), "0", font=font, fill=(0, 0, 0))
    draw.text((1900, y), str(adjusted_total), font=font, fill=(0, 0, 0))
    draw.text((2135, y), "0%", font=font, fill=(0, 0, 0))
    draw.text((2262, y), str(adjusted_total), font=font, fill=(0, 0, 0))

    total_sell += sell_price
    total_purch += purchase_price

# --- Summary calculations ---
final_profit = total_sell - total_purch
gst = round(final_profit * 0.09, 2)
subtotal = sum(adjusted_row_totals)

summary_positions = [(480, 2660), (1560, 2605), (2175, 2745), (2235, 2795), (2235, 2845), (2235, 2890), (2175, 2955)]
summary_values = [
    subtotal,            # Subtotal = sum of adjusted per-row totals
    int(total_sell),     # Original total
    subtotal,            # Repeat subtotal
    round(gst),          # CGST
    round(gst),          # SGST
    "0",                 # Discount
    int(total_sell)      # Grand Total = full sell total
]

for pos, val in zip(summary_positions, summary_values):
    draw.text(pos, str(val), font=font, fill=(0, 0, 0))

# --- Save ---
def get_next_bill_name():
    next_number = int(invoice_number)
    return os.path.join("./", f"bill{next_number}.png")

print("\n1) SAVE  2) PRINTOUT  3) SHOW\n")
c = input("===> ")
filename = get_next_bill_name()

if c == "1":
    i.save(filename)
    print(f"Saved as {filename}")
elif c == "2":
    i.save(filename)
    os.system(f'lp -o media=A4 -d wx {filename}')
elif c == "3":
    i.show()
else:
    print("INVALID OPTION")

EOF

	python temp.py
}

start(){

clear
echo " "
echo "
█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗
╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝

 ██████╗ █████╗ ███████╗██╗  ██╗    ███╗   ███╗██╗   ██╗    ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
██╔════╝██╔══██╗██╔════╝██║  ██║    ████╗ ████║╚██╗ ██╔╝    ██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
██║     ███████║███████╗███████║    ██╔████╔██║ ╚████╔╝     ██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
██║     ██╔══██║╚════██║██╔══██║    ██║╚██╔╝██║  ╚██╔╝      ██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
╚██████╗██║  ██║███████║██║  ██║    ██║ ╚═╝ ██║   ██║       ██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
 ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝     ╚═╝   ╚═╝       ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗
╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝
"|lolcat --spread=10 --freq=0.2 --seed=10 --duration=5
echo " "
echo " "
echo "
1) 𝔼 ℕ 𝕋 ℝ 𝕐  

2) 𝕊 𝔼 𝔸 ℝ ℂ ℍ  

3) 𝔽 𝕌 𝕃 𝕃  𝕍 𝕀 𝔼 𝕎  

4) 𝕌 ℙ 𝔻 𝔸 𝕋 𝔼  

5) 𝔻 𝔼 𝕃 𝔼 𝕋 𝔼  

6) ℙ 𝔼 ℕ 𝔻 𝕀 ℕ 𝔾  

7) 𝕋 𝕆 𝕋 𝔸 𝕃  

8) 𝔹 𝕀 𝕃 𝕃 𝕀 ℕ 𝔾  

9) ℙ ℝ 𝕆 𝔽 𝕀 𝕋  

10) 𝔹 𝔸 𝕃 𝔸 ℕ ℂ 𝔼

"|lolcat -t --spread=10 --freq=0.2
echo " "
read -p "⋟⋟⋟⋟⋟ " n

case $n in
	1)
		clear
		entry
		;;
	2)	
		clear
		search
		;;
	3)
		clear
		full
		;;
	4)
		clear
		update
		;;
	5)
		clear
		delete
		;;
	6)
		clear
		pending
		;;
	7)
		clear
		total
		;;
	8)
		clear
		bill
		;;
	9)
		clear
		profit
		;;
	10)
		clear
		bal
		;;
	*)
		echo "𝕀 ℕ 𝕍 𝔸  𝕃 𝕀 𝔻   𝕆 ℙ 𝕋  𝕀 𝕆 ℕ" |lolcat
		;;
esac
}
start
