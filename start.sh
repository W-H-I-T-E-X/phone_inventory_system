
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

sudo mariadb -D cashphones -p -e "insert into p_table (ORDER_ID, NAME, STORAGE, QNTY, C_NAME, IMEI, DATE, AXIS, ICICI, HDFC, CASHIFY_DEL, CASHIFY_LUK,CASHIFY_JAI, CASH, TOTAL) values ('${o}','${n}','${s}',1,'${c}','${i}','2025-${d}',${a},${ic},0,${cd},0,${cl},${ca},${t});"
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
sudo mariadb -u root -p -e "select * from p_table where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo "SALES TABLE"
echo " "
sudo mariadb -u root -p -e "select * from s_table where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo "P_ACC TABLE"
echo " "
sudo mariadb -u root -p -e "select * from p_acc where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo "S_ACC TABLE"
echo " "
sudo mariadb -u root -p -e "select * from s_acc where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo "EXP TABLE"
echo " "
sudo mariadb -u root -p -e "select * from exp where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo "PENDING_REC TABLE"
echo " "
sudo mariadb -u root -p -e "select * from pen_rec where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo " "
echo "PENDING TABLE"
echo " "
sudo mariadb -u root -p -e "select * from pen_h where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo " "
echo "SALARY TABLE"
echo " "
sudo mariadb -u root -p -e "select * from sal where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo " "
echo "PARTS TABLE"
echo " "
sudo mariadb -u root -p -e "select * from parts where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo " "
echo "REPAIR"
echo " "
sudo mariadb -u root -p -e "select * from repair where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo " "
echo "BANK CHARGES TABLE"
echo " "
sudo mariadb -u root -p -e "select * from charges where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo " "
echo "CASH BALANCE TABLE"
echo " "
sudo mariadb -u root -p -e "select * from bal where DATE LIKE '2025-${n}%';" cashphones
echo " "
echo " "
echo "AXIS BAL TABLE"
echo " "
sudo mariadb -u root -p -e "select * from axis where DATE LIKE '2025-${n}%';" cashphones
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
select n in p_table s_table p_acc s_acc repair exp; do
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
		sudo mariadb -u root -p -e "select ROW_NUMBER() OVER (ORDER BY NAME) AS S_NO,DATE,ORDER_ID,NAME,TOTAL,QNTY from s_table WHERE DATE LIKE '2025-${m}-%' union select '=======','===========','======','============================','========','=====' from s_table union all SELECT '---->','SALES','TABLE','<---------> TOTAL <--------->',SUM(TOTAL),SUM(QNTY) FROM s_table WHERE DATE LIKE '2025-${m}-%'"; cashphones
		;;
	2)
		echo -e -n "MONTH => "|lolcat
		read m
		sudo mariadb -u root -p -e "select ROW_NUMBER() OVER (ORDER BY NAME) AS S_NO,DATE,ORDER_ID,NAME,TOTAL,QNTY from p_table WHERE DATE LIKE '2025-${m}-%' union select '=======','===========','=======','===================================','========','====' from p_table union all SELECT '---->','PURCHASE','TABLE','<------------> TOTAL <------------>',SUM(TOTAL),SUM(QNTY) FROM p_table WHERE DATE LIKE '2025-${m}-%'"; cashphones
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
	echo
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
		python /home/whitex/cashphones/b.py
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
