
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
read d
echo -e -n "NAME => "|lolcat
read n
echo -e -n "START => "|lolcat
read s
echo -e -n "END => "|lolcat
read e
k=$(( e - s ))
t=$(( k * 3 ))

sudo mariadb -u root -p -e "insert into petrol values ('2025-${d}','${n}','${s}',${e},'${k}','${t}');" cashphones
sudo mariadb -u root -p -e "select * from petrol where DATE LIKE '2025-${d}';" cashphones
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
				
		sudo mariadb -u root -p -e "select sum(TOTAL) AS TOTAL_PETROL_AMT,MIN(DATE) AS START_DATE,MAX(DATE) AS END_DATE FROM petrol WHERE DATE BETWEEN '2025-${sd}' AND '2025-${ed}' and NAME='${na}'"; cashphones
		;;
	*)
		echo "INVALID CHOICE"
		;;
esac

}


stock_entry(){

echo " "
echo -e "
███████╗████████╗ ██████╗  ██████╗██╗  ██╗███████╗    ███████╗███╗   ██╗████████╗██████╗ ██╗   ██╗
██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██║ ██╔╝██╔════╝    ██╔════╝████╗  ██║╚══██╔══╝██╔══██╗╚██╗ ██╔╝
███████╗   ██║   ██║   ██║██║     █████╔╝ ███████╗    █████╗  ██╔██╗ ██║   ██║   ██████╔╝ ╚████╔╝
╚════██║   ██║   ██║   ██║██║     ██╔═██╗ ╚════██║    ██╔══╝  ██║╚██╗██║   ██║   ██╔══██╗  ╚██╔╝
███████║   ██║   ╚██████╔╝╚██████╗██║  ██╗███████║    ███████╗██║ ╚████║   ██║   ██║  ██║   ██║
╚══════╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝    ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat

echo " "
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo -e -n "NAME => "|lolcat
read n
echo -e -n "STORAGE => "|lolcat
read s
#echo -e -n "QUANTITY => "|lolcat
#read q
echo -e -n "P-PRICE => "|lolcat
read p
echo -e -n "IMEI => "|lolcat
read i
echo -e -n "MONTH => "|lolcat
read m

sudo mariadb -u root -p -e "insert into stock values ('${o}','${n}','${s}','0',${p},'${i}','${m}');" cashphones
echo " "
echo "STOCK TABLE"
echo "--------------"
echo " "
sudo mariadb -u root -p -e "select * from stock where ORDER_ID = '${o}';" cashphones
echo " "
echo " "

stock_entry
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
#echo " "
#echo "STOCK TABLE"
#echo "-----------"
#sudo mariadb -D cashphones -e "select * from stock where ORDER_ID = '${o}';"
#echo " "
echo -e -n "NAME => "|lolcat
read n
echo -e -n "STORAGE => "|lolcat
read s
#echo -e -n "QUANTITY => "|lolcat
#read q
echo -e -n "C_NAME => "|lolcat
read c
echo -e -n "IMEI => "|lolcat
read i
echo -e -n "DATE => "|lolcat
read d
echo -e -n "MONTH => "|lolcat
read m
echo -e -n "AXIS => "|lolcat
read a
echo -e -n "ICICI => "|lolcat
read ic
echo -e -n "CASHIFY DELHI => "|lolcat
read cd
echo -e -n "CASHIFY JAIPUR => "|lolcat
read cl
echo -e -n "CASH => "|lolcat
read ca

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
#echo -e -n "NAME => "|lolcat
#read n
#echo -e -n "STORAGE => "|lolcat
#read s
#echo -e -n "QUANTITY => "|lolcat
#read q
echo -e -n "C_NAME => "|lolcat
read c
#echo -e -n "IMEI => "|lolcat
#read i
echo -e -n "DATE => "|lolcat
read d
echo -e -n "AXIS => "|lolcat
read a
echo -e -n "ICICI => "|lolcat
read ic
#echo -e -n "HDFC => "|lolcat
#read h
echo -e -n "CASH => "|lolcat
read ca
echo -e -n "PENDING => "|lolcat
read p
t=$(( a + ic + 0 + ca + p ))


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
read m
echo -e -n "NAME => "|lolcat
read n
echo -e -n "CASH => "|lolcat
read c
echo -e -n "AXIS => "|lolcat
read a
echo -e -n "HDFC => "|lolcat
read h
echo -e -n "ICICI => "|lolcat
read i
echo -e -n "CASHIFY_DEL => "|lolcat
read d
echo -e -n "CASHIFY_JAI => "|lolcat
read l
t=$(( c + a + h + i + d + l ))
#echo -e -n "TORAL_PRICE => "|lolcat
#read t

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
echo -e -n "AXIS => "|lolcat
read aa
echo -e -n "ICICI => "|lolcat
read ii
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
read m
echo -e -n "NAME => "|lolcat
read n
echo -e -n "CASH => "|lolcat
read c
echo -e -n "AXIS => "|lolcat
read a
echo -e -n "HDFC => "|lolcat
read h
echo -e -n "ICICI => "|lolcat
read i
echo -e -n "CASHIFY_DEL => "|lolcat
read d
echo -e -n "CASHIFY_LUK => "|lolcat
read l
t=$(( c + a + h + i + d + l ))
#echo -e -n "TORAL_PRICE => "|lolcat
#read t

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
read d
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo ""
#echo -e -n "NAME => "|lolcat
#read n
echo ""
echo -e -n "QNTY => "|lolcat
read q
echo ""
echo -e -n "AXIS => "|lolcat
read a
#echo -e -n "HDFC => "|lolcat
#read h
echo -e -n "ICICI => "|lolcat
read i
echo ""
echo -e -n "CASH => "|lolcat
read c
echo ""
#echo -e -n "P_PRICE => "|lolcat
#read p
#echo ""

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
read d
echo -e -n "ORDER_ID => "|lolcat
read o
echo -e -n "NAME => "|lolcat
read n
echo -e -n "QNTY => "|lolcat
read q
echo -e -n "AXIS => "|lolcat
read a
#echo -e -n "HDFC => "|lolcat
#read h
echo -e -n "ICICI => "|lolcat
read i
echo -e -n "CASH => "|lolcat
read c

t=$(( a + 0 + i + c ))
sudo mariadb -D cashphones -e "update acc_stock set QNTY= QNTY + ${q} where ORDER_ID=${o};"
echo ""
sudo mariadb -D cashphones -e "insert into p_acc values ('2025-${d}',${o},'${n}',${q},${a},${i},${c},${t});"
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
echo "DATE EXAMPLE = 01-22"
echo " "
echo -e -n "DATE => "|lolcat
read o
echo -e -n "NAME => "|lolcat
read n
echo -e -n "AXIS => "|lolcat
read a
echo -e -n "ICICI => "|lolcat
read h
echo -e -n "CASH => "|lolcat
read c

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
echo "DATE EXAMPLE = 01-22"
echo " "
echo -e -n "DATE => "|lolcat
read o
echo -e -n "NAME => "|lolcat
read n
echo -e -n "AXIS => "|lolcat
read a
echo -e -n "ICICI => "|lolcat
read ic
#echo -e -n "HDFC => "|lolcat
#read h
echo -e -n "CASH => "|lolcat
read ca
#echo -e -n "COST => "|lolcat
#read c

t=$(echo $a + $ic + 0 + $ca  |bc)
#echo -e -n "TOTAL PROFIT => "|lolcat
#read t

sudo mariadb -D cashphones -e "insert into repair (DATE,NAME,AXIS,ICICI,CASH) values ('2025-${o}','${n}',${a},${ic},${ca});"
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from repair where DATE like  '%2025-${o}%';" 
echo " "
echo " "

repair_entry
}

laptop_stock_entry(){
echo " "
echo -e "
██╗      █████╗ ██████╗ ████████╗ ██████╗ ██████╗     ███████╗████████╗ ██████╗  ██████╗██╗  ██╗
██║     ██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗    ██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██║ ██╔╝
██║     ███████║██████╔╝   ██║   ██║   ██║██████╔╝    ███████╗   ██║   ██║   ██║██║     █████╔╝
██║     ██╔══██║██╔═══╝    ██║   ██║   ██║██╔═══╝     ╚════██║   ██║   ██║   ██║██║     ██╔═██╗
███████╗██║  ██║██║        ██║   ╚██████╔╝██║         ███████║   ██║   ╚██████╔╝╚██████╗██║  ██╗
╚══════╝╚═╝  ╚═╝╚═╝        ╚═╝    ╚═════╝ ╚═╝         ╚══════╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝  ╚═╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat

echo " "
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo -e -n "NAME => "|lolcat
read n
echo -e -n "STORAGE => "|lolcat
read s
echo -e -n "QUANTITY => "|lolcat
read q
echo -e -n "P_PRICE => "|lolcat
read p
echo -e -n "MONTH => "|lolcat
read m

sudo mariadb -u root -p -e "insert into laptopstock values ('${o}','${n}','${s}','${q}','${m}','${p}');" cashphones
echo " "
echo " "
sudo mariadb -u root -p -e "select * from laptopstock where ORDER_ID = '${o}';" cashphones
echo " "
echo " "

laptop_stock_entry
}

laptop_sale_entry(){
echo "
███████╗        ██╗      █████╗ ██████╗ ████████╗ ██████╗ ██████╗
██╔════╝        ██║     ██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
███████╗        ██║     ███████║██████╔╝   ██║   ██║   ██║██████╔╝
╚════██║        ██║     ██╔══██║██╔═══╝    ██║   ██║   ██║██╔═══╝
███████║███████╗███████╗██║  ██║██║        ██║   ╚██████╔╝██║
╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝        ╚═╝    ╚═════╝ ╚═╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo " "
echo "LAPTOPP TABLE"
echo "-------------"
sudo mariadb -u root -p -e "select * from p_table where ORDER_ID = '${o}';" cashphones
echo " "
echo -e -n "NAME => "|lolcat
read n
echo -e -n "STORAGE => "|lolcat
read s
echo -e -n "QUANTITY => "|lolcat
read q
echo -e -n "PAY_MODE => "|lolcat
read m
echo -e -n "C_NAME => "|lolcat
read c
echo -e -n "DATE => "|lolcat
read d
echo -e -n "PRICE_COMPONENTS => "|lolcat
read p
echo -e -n "TORAL_PRICE => "|lolcat
read t

sudo mariadb -u root -p -e "insert into laptops (ORDER_ID, NAME, STORAGE, QNTY, PAY_MODE, C_NAME, DATE, P_COMPO, TOTAL) values ('${o}','${n}','${s}','${q}','${m}','${c}','2025-${d}','${p}',${t});" cashphones
echo " "
echo " "
sudo mariadb -u root -p -e "select * from laptops where ORDER_ID = '${o}';" cashphones
echo " "
echo " "
laptop_sale_entry
}

laptop_pur_entry(){

echo "
██████╗    ██╗      █████╗ ██████╗ ████████╗ ██████╗ ██████╗
██╔══██╗   ██║     ██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
██████╔╝   ██║     ███████║██████╔╝   ██║   ██║   ██║██████╔╝
██╔═══╝    ██║     ██╔══██║██╔═══╝    ██║   ██║   ██║██╔═══╝
██║███████╗███████╗██║  ██║██║        ██║   ╚██████╔╝██║
╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝        ╚═╝    ╚═════╝ ╚═╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
echo -e -n "ORDER_ID => "|lolcat
read o
echo " "
echo "LAPTOP STOCK TABLE"
echo "------------------"
sudo mariadb -u root -p -e "select * from laptopstock where ORDER_ID = '${o}';" cashphones
echo " "
echo -e -n "NAME => "|lolcat
read n
echo -e -n "STORAGE => "|lolcat
read s
echo -e -n "QUANTITY => "|lolcat
read q
echo -e -n "PAY_MODE => "|lolcat
read m
echo -e -n "C_NAME => "|lolcat
read c
echo -e -n "DATE => "|lolcat
read d
echo -e -n "PRICE_COMPONENTS => "|lolcat
read p
echo -e -n "TOTAL_PRICE => "|lolcat
read t

sudo mariadb -u root -p -e "insert into laptopp (ORDER_ID, NAME, STORAGE, QNTY, PAY_MODE, C_NAME, DATE, P_COMPO, TOTAL) values ('${o}','${n}','${s}','${q}','${m}','${c}','2025-${d}','${p}',${t});" cashphones
echo " "
echo " "
sudo mariadb -u root -p -e "select * from laptopp where ORDER_ID = '${o}';" cashphones
echo " "
echo " "
laptop_pur_entry
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
read o
echo -e -n "NAME => "|lolcat
read n
#echo -e -n "CASH => "|lolcat
#read c
echo -e -n "AXIS => "|lolcat
read a
echo -e -n "ICICI => "|lolcat
read h
#echo -e -n "HDFC => "|lolcat
#read i
t=$(echo "$a + $h " | bc)




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
read d
echo -e -n "NAME => "|lolcat
read n
echo -e -n "AXIS => "|lolcat
read a
echo -e -n "ICICI => "|lolcat
read h
#echo -e -n "HDFC => "|lolcat
#read i
echo -e -n "CASH => "|lolcat
read c

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
read d
echo " "
echo -e -n "NAME => "|lolcat
read n
echo " "
echo -e -n "AXIS => "|lolcat
read a
echo " "
echo -e -n "ICICI => "|lolcat
read h
echo " "
#echo -e -n "HDFC => "|lolcat
#read i
echo -e -n "CASH => "|lolcat
read c

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

3) 𝕊 𝕋 𝕆 ℂ 𝕂

4) ℙ 𝕌 ℝ ℂ ℍ 𝔸 𝕊 𝔼

5) 𝕊 𝔸 𝕃 𝔼 𝕊

6) ℂ 𝕌 𝕊 𝕋 𝕆 𝕄 𝔼 ℝ 𝕊

7) ℙ - 𝔸 ℂ ℂ 𝔼 𝕊 𝕊 𝕆 ℝ 𝕀 𝔼 𝕊

8) 𝕊 - 𝔸 ℂ ℂ 𝔼 𝕊 𝕊 𝕆 ℝ 𝕀 𝔼 𝕊

9) 𝔼 𝕏 ℙ 𝔸 ℕ 𝕊 𝔼 𝕊

10) ℝ 𝔼 ℙ 𝔸 𝕀 ℝ

11) 𝕊 𝔸 𝕃 𝔸 ℝ 𝕐

12) ℙ 𝔸 ℝ 𝕋 𝕊

13) 𝕃 𝕌 ℂ 𝕂 ℕ 𝕆 𝕎
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
		stock_name
		;;
	4)
		p_name
		;;
	5)
		s_name
		;;
	6)
		cp_name
		;;
	7)
		p_acc_name
		;;
	8)
		s_acc_name
		;;
	9)
		exp_name
		;;
	10)
		repair_name
		;;
	11) 
		salary_name
		;;
	12) 
		parts_name
		;;
	13) 
		p_lucknow
		;;	
	.)
		start
		;;
	*)
		echo "INVALID CHOICE"
		;;
	esac
}

#stock_sch(){

#echo "
#███████╗████████╗ ██████╗  ██████╗██╗  ██╗    ███████╗ ██████╗██╗  ██╗
#██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██║ ██╔╝    ██╔════╝██╔════╝██║  ██║
#███████╗   ██║   ██║   ██║██║     █████╔╝     ███████╗██║     ███████║
#╚════██║   ██║   ██║   ██║██║     ██╔═██╗     ╚════██║██║     ██╔══██║
#███████║   ██║   ╚██████╔╝╚██████╗██║  ██╗    ███████║╚██████╗██║  ██║
#╚══════╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#"|lolcat
#echo ""
#echo ""
#echo "1) NAME"|lolcat
#echo ""
#echo "2) ID"|lolcat
#echo ""
#echo "3) MONTH"|lolcat
#echo ""
#read -p "⋟⋟⋟⋟ " n

#case $n in
#	1)
#		stock_name
#		;;
#	2)
#		stock_id
#		;;
#	3)
#		stock_date
#		;;
#	*)

#		echo "INVALID CHOICE"
#		;;
#esac
#}

stock_name(){

echo "
███████╗████████╗ ██████╗  ██████╗██╗  ██╗    ███╗   ██╗ █████╗ ███╗   ███╗███████╗
██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██║ ██╔╝    ████╗  ██║██╔══██╗████╗ ████║██╔════╝
███████╗   ██║   ██║   ██║██║     █████╔╝     ██╔██╗ ██║███████║██╔████╔██║█████╗  
╚════██║   ██║   ██║   ██║██║     ██╔═██╗     ██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝  
███████║   ██║   ╚██████╔╝╚██████╗██║  ██╗    ██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗
╚══════╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
                                                                                   
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
echo -e -n "NAME => "|lolcat
read n

sudo mariadb -u root -p -e "select * from stock where NAME LIKE '%${n}%';" cashphones
echo " "
echo " "
stock_name
}



#p_sch(){

#echo "
#██████╗ ██╗   ██╗██████╗  ██████╗██╗  ██╗ █████╗ ███████╗███████╗    ███████╗ ██████╗██╗  ██╗
#██╔══██╗██║   ██║██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝██╔════╝    ██╔════╝██╔════╝██║  ██║
#██████╔╝██║   ██║██████╔╝██║     ███████║███████║███████╗█████╗      ███████╗██║     ███████║
#██╔═══╝ ██║   ██║██╔══██╗██║     ██╔══██║██╔══██║╚════██║██╔══╝      ╚════██║██║     ██╔══██║
#██║     ╚██████╔╝██║  ██║╚██████╗██║  ██║██║  ██║███████║███████╗    ███████║╚██████╗██║  ██║
#╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#"|lolcat
#echo ""
#echo ""
#echo "1) NAME"|lolcat
#echo ""
#echo "2) ID"|lolcat
#echo ""
#echo "3) DATE"|lolcat
#echo ""
#echo "4) LUCKNOW"|lolcat
#echo ""
#read -p "⋟⋟⋟⋟ " n

#case $n in
#	1)
#		p_name
#		;;
#	2)
#		p_id
#		;;
#	3)
#		p_date
#		;;
#	4)
#		p_lucknow
#		;;
#	*)
#		echo "INVALID CHOICE"
#		;;
#esac
#}

p_name(){

echo "
██████╗       ██████╗ ██████╗  ██████╗ ██████╗ ██╗   ██╗ ██████╗████████╗    ███╗   ██╗ █████╗ ███╗   ███╗███████╗
██╔══██╗      ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██║   ██║██╔════╝╚══██╔══╝    ████╗  ██║██╔══██╗████╗ ████║██╔════╝
██████╔╝█████╗██████╔╝██████╔╝██║   ██║██║  ██║██║   ██║██║        ██║       ██╔██╗ ██║███████║██╔████╔██║█████╗  
██╔═══╝ ╚════╝██╔═══╝ ██╔══██╗██║   ██║██║  ██║██║   ██║██║        ██║       ██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝  
██║           ██║     ██║  ██║╚██████╔╝██████╔╝╚██████╔╝╚██████╗   ██║       ██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗
╚═╝           ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝  ╚═════╝   ╚═╝       ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
                                                                                                                  
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
echo -e -n "NAME => "|lolcat
read n

sudo mariadb -u root -p -e "select * from p_table where NAME LIKE '%${n}%';" cashphones
echo " "
sudo mariadb -u root -p -e "select * from s_table where NAME LIKE '%${n}%';" cashphones
echo " "
echo " "
p_name
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

p_lucknow(){

echo "
██╗     ██╗   ██╗ ██████╗██╗  ██╗███╗   ██╗ ██████╗ ██╗    ██╗
██║     ██║   ██║██╔════╝██║ ██╔╝████╗  ██║██╔═══██╗██║    ██║
██║     ██║   ██║██║     █████╔╝ ██╔██╗ ██║██║   ██║██║ █╗ ██║
██║     ██║   ██║██║     ██╔═██╗ ██║╚██╗██║██║   ██║██║███╗██║
███████╗╚██████╔╝╚██████╗██║  ██╗██║ ╚████║╚██████╔╝╚███╔███╔╝
╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚══╝╚══╝

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo "EXAMPLE 02"
echo " "
echo -e -n "MONTH NUM => "|lolcat
read n
sudo mariadb -D cashphones -e "select * from p_table where DATE LIKE '2025-${n}-%' AND NAME LIKE '%LUCKNOW%';"
echo " "
echo " "
}

#s_sch(){

#echo "
#███████╗ █████╗ ██╗     ███████╗    ███████╗ ██████╗██╗  ██╗
#██╔════╝██╔══██╗██║     ██╔════╝    ██╔════╝██╔════╝██║  ██║
#███████╗███████║██║     █████╗      ███████╗██║     ███████║
#╚════██║██╔══██║██║     ██╔══╝      ╚════██║██║     ██╔══██║
#███████║██║  ██║███████╗███████╗    ███████║╚██████╗██║  ██║
#╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#"|lolcat
#echo ""
#echo ""
#echo "1) NAME"|lolcat
#echo ""
#echo "2) ID"|lolcat
#echo ""
#echo "3) DATE"|lolcat
#echo ""
#read -p "⋟⋟⋟⋟ " n

#case $n in
#	1)
#		s_name
#		;;
#	2)
#		s_id
#		;;
#	3)
#		s_date
#		;;
#	*)
#		echo "INVALID CHOICE"
#		;;
#esac
#}

s_name(){

echo "
███████╗      ██████╗ ██████╗  ██████╗ ██████╗ ██╗   ██╗ ██████╗████████╗    ███╗   ██╗ █████╗ ███╗   ███╗███████╗
██╔════╝      ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██║   ██║██╔════╝╚══██╔══╝    ████╗  ██║██╔══██╗████╗ ████║██╔════╝
███████╗█████╗██████╔╝██████╔╝██║   ██║██║  ██║██║   ██║██║        ██║       ██╔██╗ ██║███████║██╔████╔██║█████╗  
╚════██║╚════╝██╔═══╝ ██╔══██╗██║   ██║██║  ██║██║   ██║██║        ██║       ██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝  
███████║      ██║     ██║  ██║╚██████╔╝██████╔╝╚██████╔╝╚██████╗   ██║       ██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗
╚══════╝      ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝  ╚═════╝   ╚═╝       ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
                                                                                                                  
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
echo -e -n "NAME => "|lolcat
read n

sudo mariadb -D cashphones -e "select * from s_table where NAME LIKE '%${n}%';" 
echo " "
echo " "
s_name
}



s_acc_name(){
echo "
███████╗       █████╗  ██████╗ ██████╗███████╗███████╗███████╗    ███████╗ ██████╗██╗  ██╗
██╔════╝      ██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝    ██╔════╝██╔════╝██║  ██║
███████╗█████╗███████║██║     ██║     █████╗  ███████╗███████╗    ███████╗██║     ███████║
╚════██║╚════╝██╔══██║██║     ██║     ██╔══╝  ╚════██║╚════██║    ╚════██║██║     ██╔══██║
███████║      ██║  ██║╚██████╗╚██████╗███████╗███████║███████║    ███████║╚██████╗██║  ██║
╚══════╝      ╚═╝  ╚═╝ ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝
"|lolcat
echo " "

echo " "
echo -e -n "NAME => "|lolcat
read n

sudo mariadb -D cashphones -e "select * from s_acc where NAME LIKE '%${n}%';" 
echo " "
echo " "
s_acc_name
}

p_acc_name(){
echo "
██████╗        █████╗  ██████╗ ██████╗███████╗███████╗███████╗    ███████╗ ██████╗██╗  ██╗
██╔══██╗      ██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝    ██╔════╝██╔════╝██║  ██║
██████╔╝█████╗███████║██║     ██║     █████╗  ███████╗███████╗    ███████╗██║     ███████║
██╔═══╝ ╚════╝██╔══██║██║     ██║     ██╔══╝  ╚════██║╚════██║    ╚════██║██║     ██╔══██║
██║           ██║  ██║╚██████╗╚██████╗███████╗███████║███████║    ███████║╚██████╗██║  ██║
╚═╝           ╚═╝  ╚═╝ ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝
"|lolcat
echo " "

echo " "
echo -e -n "NAME => "|lolcat
read n

sudo mariadb -D cashphones -e "select * from p_acc where NAME LIKE '%${n}%';" 
echo " "
echo " "
p_acc_name
}

exp_name(){
echo "
███████╗██╗  ██╗██████╗  █████╗ ███╗   ██╗███████╗███████╗███████╗    ███████╗ ██████╗██╗  ██╗
██╔════╝╚██╗██╔╝██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝██╔════╝    ██╔════╝██╔════╝██║  ██║
█████╗   ╚███╔╝ ██████╔╝███████║██╔██╗ ██║███████╗█████╗  ███████╗    ███████╗██║     ███████║
██╔══╝   ██╔██╗ ██╔═══╝ ██╔══██║██║╚██╗██║╚════██║██╔══╝  ╚════██║    ╚════██║██║     ██╔══██║
███████╗██╔╝ ██╗██║     ██║  ██║██║ ╚████║███████║███████╗███████║    ███████║╚██████╗██║  ██║
╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝╚══════╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝
"|lolcat
echo " "
echo " "
echo -e -n "NAME => "|lolcat
read n

sudo mariadb -D cashphones -e "select * from exp where NAME LIKE '%${n}%';" 
echo " "
echo " "
exp_name
}

cp_name(){

echo "
██████╗        ██████╗██╗   ██╗███████╗████████╗ ██████╗ ███╗   ███╗███████╗██████╗
██╔══██╗      ██╔════╝██║   ██║██╔════╝╚══██╔══╝██╔═══██╗████╗ ████║██╔════╝██╔══██╗
██████╔╝█████╗██║     ██║   ██║███████╗   ██║   ██║   ██║██╔████╔██║█████╗  ██████╔╝
██╔═══╝ ╚════╝██║     ██║   ██║╚════██║   ██║   ██║   ██║██║╚██╔╝██║██╔══╝  ██╔══██╗
██║           ╚██████╗╚██████╔╝███████║   ██║   ╚██████╔╝██║ ╚═╝ ██║███████╗██║  ██║
╚═╝            ╚═════╝ ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

███████╗███████╗ █████╗ ██████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗
██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║  ██║██║████╗  ██║██╔════╝
███████╗█████╗  ███████║██████╔╝██║     ███████║██║██╔██╗ ██║██║  ███╗
╚════██║██╔══╝  ██╔══██║██╔══██╗██║     ██╔══██║██║██║╚██╗██║██║   ██║
███████║███████╗██║  ██║██║  ██║╚██████╗██║  ██║██║██║ ╚████║╚██████╔╝
╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"|lolcat
echo " "
echo " "
echo -e -n "ID => "|lolcat
read n

sudo mariadb -D cashphones -e "select * from cp where ORDER_ID=${n};" 
echo " "
echo " "
cp_name
}

repair_name(){

echo "
██████╗ ███████╗██████╗  █████╗ ██╗██████╗     ███╗   ██╗ █████╗ ███╗   ███╗███████╗
██╔══██╗██╔════╝██╔══██╗██╔══██╗██║██╔══██╗    ████╗  ██║██╔══██╗████╗ ████║██╔════╝
██████╔╝█████╗  ██████╔╝███████║██║██████╔╝    ██╔██╗ ██║███████║██╔████╔██║█████╗  
██╔══██╗██╔══╝  ██╔═══╝ ██╔══██║██║██╔══██╗    ██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝  
██║  ██║███████╗██║     ██║  ██║██║██║  ██║    ██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗
╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝    ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
                                                                                    
"
echo " "
echo " "
echo -e -n "NAME => "|lolcat
read n

sudo mariadb -D cashphones -e "select * from repair where NAME LIKE '%${n}%';" 
echo " "
echo " "
repair_name
}

sal_name(){

echo "
███████╗ █████╗ ██╗      █████╗ ██████╗ ██╗   ██╗    ███╗   ██╗ █████╗ ███╗   ███╗███████╗
██╔════╝██╔══██╗██║     ██╔══██╗██╔══██╗╚██╗ ██╔╝    ████╗  ██║██╔══██╗████╗ ████║██╔════╝
███████╗███████║██║     ███████║██████╔╝ ╚████╔╝     ██╔██╗ ██║███████║██╔████╔██║█████╗  
╚════██║██╔══██║██║     ██╔══██║██╔══██╗  ╚██╔╝      ██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝  
███████║██║  ██║███████╗██║  ██║██║  ██║   ██║       ██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝       ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
                                                                                          
"
echo " "
echo " "
echo -e -n "NAME => "|lolcat
read n

sudo mariadb -D cashphones -e "select * from sal where NAME LIKE '%${n}%';" 
echo " "
echo " "
sal_name
}

parts_name(){

echo "
██████╗  █████╗ ██████╗ ████████╗███████╗    ███╗   ██╗ █████╗ ███╗   ███╗███████╗
██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝    ████╗  ██║██╔══██╗████╗ ████║██╔════╝
██████╔╝███████║██████╔╝   ██║   ███████╗    ██╔██╗ ██║███████║██╔████╔██║█████╗  
██╔═══╝ ██╔══██║██╔══██╗   ██║   ╚════██║    ██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝  
██║     ██║  ██║██║  ██║   ██║   ███████║    ██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝    ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
                                                                                  
"
echo " "
echo " "
echo -e -n "NAME => "|lolcat
read n

sudo mariadb -D cashphones -e "select * from parts where NAME LIKE '%${n}%';" 
echo " "
echo " "
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
echo -e -n "TABLE NAME => "|lolcat
read n

sudo mariadb -u root -p -e "select * from ${n};" 
echo " "
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
echo -e -n "ENTER TABLE NAME  => "|lolcat
read n
echo -e -n "ORDER_ID  => "|lolcat
read o
echo " "
sudo mariadb -u root -p -e "select * from ${n} where ORDER_ID = '${o}';" cashphones
echo " "
echo -e -n "COLUMN NAME => "|lolcat
read c
echo -e -n "CORRECT VALUE  => "|lolcat
read v

sudo mariadb -D cashphones -e "update ${n} set ${c}='${v}' where ORDER_ID = '${o}';"
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from ${n} where ORDER_ID = '${o}';" 
echo " "
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
	
		update
		;;
	2)
		start
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
echo -e -n "ENTER TABLE NAME  => "|lolcat
read n
echo -e -n "ORDER_ID  => "|lolcat
read o

sudo mariadb -D cashphones -e "delete from ${n} where ORDER_ID = '${o}';" 
echo " "
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
echo "1) SHOW"|lolcat
echo ""
echo "2) ENTRY"|lolcat
echo ""
echo "3) S_PENDING"|lolcat
echo ""
echo "4) S_PENDING_REC"|lolcat
echo ""
echo "5) P_DELAY"|lolcat
echo ""
echo "6) P_SEND"|lolcat
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
		pen_rec
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
#echo -e -n "NAME => "|lolcat
#read n
#echo -e -n "PENDING => "|lolcat
#read p

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
echo -e -n "ICICI => "|lolcat
read i
echo -e -n "CASH => "|lolcat
read c

t=$(echo "$a + $i + $c" |bc )
sudo mariadb -D cashphones -e "insert into pen_rec values ('2025-${d}','${o}','${n}',${a},${i},${c},${t});" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from pen_rec where ORDER_ID = '${o}';" 
echo " "
echo " "
pen_rec
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
#echo -e -n "NAME => "|lolcat
#read n
echo -e -n "PENDING => "|lolcat
read p
echo -e -n "AXIS => "|lolcat
read a
echo -e -n "ICICI => "|lolcat
read i
echo -e -n "CASH => "|lolcat
read c

sudo mariadb -D cashphones -e "insert into pen_h (DATE,ORDER_ID,NAME,PENDING,AXIS,ICICI,CASH) select '2025-${d}','${o}',NAME,${p},${a},${i},${c} FROM s_table where ORDER_ID='${o}';" 
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
#echo -e -n "ORDER_ID => "|lolcat
#read o
#echo " "
#sudo mariadb -D cashphones -e "select * from s_table where ORDER_ID = '${o}';"
#echo " "
#echo -e -n "NAME => "|lolcat
#read n
#echo -e -n "AXIS => "|lolcat
#read a
#echo -e -n "ICICI => "|lolcat
#read i
#echo -e -n "CASH => "|lolcat
#read c

t=$(echo "$a + $i + $c" |bc )
sudo mariadb -D cashphones -e "insert into pen_rec (DATE,ORDER_ID,NAME,AXIS,ICICI,CASH,TOTAL) select '2025-${da}','${o}',NAME,${a},${i},${c},${t} FROM s_table where ORDER_ID='${o}';" 
echo " "
echo " "
sudo mariadb -D cashphones -e "select * from pen_rec where ORDER_ID = '${o}';" 
echo " "
#sudo mariadb -D cashphones -e "DELETE from pending where ORDER_ID = '${o}';"
echo " "
#sudo mariadb -D cashphones -e "UPDATE s_table set PENDING=0 where ORDER_ID = '${o}';"
#sudo mariadb -D cashphones -e "UPDATE s_table set CASH=CASH+${c},AXIS+${a},ICICI+${i} where ORDER_ID = '${o}';"
#sudo mariadb -D cashphones -e "select * from s_table where ORDER_ID = '${o}';"
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
echo -e -n "AXIS => "|lolcat
read a
echo -e -n "ICICI => "|lolcat
read i

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
sudo mariadb -u root -p -e "select * from p_table where ORDER_ID = '${o}';" cashphones
echo " "
echo -e -n "NAME => "|lolcat
read n
echo -e -n "CASH => "|lolcat
read c
echo -e -n "AXIS => "|lolcat
read a
echo -e -n "ICICI => "|lolcat
read i

sudo mariadb -u root -p -e "insert into p_send values ('2025-${d}','${o}','${n}',${c},${a},${i});" cashphones
echo " "
echo " "
sudo mariadb -u root -p -e "select * from p_send where ORDER_ID = '${o}';" cashphones
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
echo "EXAMPLE  04-30"
echo " "
echo -e -n "DATE FOR PRINTOUT => "|lolcat
read n
echo " "
sudo mariadb -D cashphones -e "select ROW_NUMBER() OVER (ORDER BY NAME) AS S_NO,ORDER_ID,NAME,P_PRICE,QNTY from stock  union SELECT '============','============','======================================','==========','=====' FROM stock union all select '2025-${n}','STOCK TABLE','<--------------> TOTAL <-------------->',SUM(P_PRICE),SUM(QNTY) FROM stock"; 
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
#sudo mariadb -D cashphones -e "select sum(TOTAL) as TOTAL_SALE,SUM(TOTAL) AS TOTAL_PUR,SUM(TOTAL - TOTAL) AS PROFIT FROM s_acc join p_acc  where DATE like '2025-${m}%'";
echo " "
sudo mariadb -D cashphones  -e "SELECT 'TABLE' AS Category, 'PROFIT' AS Value UNION SELECT ' ', ' ' UNION SELECT 'PHONES', SUM(s.TOTAL - p.TOTAL) FROM s_table s JOIN p_table p ON s.ORDER_ID = p.ORDER_ID WHERE s.DATE LIKE '2025-${m}%' UNION SELECT '  ', '  ' UNION SELECT 'S_ACC', SUM(TOTAL_PROFIT) FROM s_acc WHERE DATE LIKE '2025-${m}%' UNION SELECT '   ', '   ' UNION SELECT 'REPAIR',         (SELECT SUM(TOTAL) FROM repair WHERE DATE LIKE '2025-${m}%') -        (SELECT SUM(TOTAL) FROM parts WHERE DATE LIKE '2025-${m}%') UNION SELECT '    ', '    ' UNION SELECT 'EXPANSE', SUM(TOTAL) FROM exp WHERE DATE LIKE '2025-${m}%' UNION SELECT '           ', '           ' UNION SELECT 'SALARY', SUM(TOTAL) FROM sal WHERE DATE LIKE '2025-${m}%' UNION SELECT '         ', '         ' UNION SELECT 'BANK CHARGES', SUM(TOTAL) FROM charges WHERE DATE LIKE '2025-${m}%' UNION SELECT '--------------------', '-----------' UNION SELECT 'GRAND PROFIT/LOSS',        (SELECT SUM(s.TOTAL - p.TOTAL)         FROM s_table s         JOIN p_table p ON s.ORDER_ID = p.ORDER_ID         WHERE s.DATE LIKE '2025-${m}%')        +        (SELECT SUM(TOTAL_PROFIT) FROM s_acc WHERE DATE LIKE '2025-${m}%')        +        (SELECT SUM(TOTAL) FROM repair WHERE DATE LIKE '2025-${m}%') -        (SELECT SUM(TOTAL) FROM parts WHERE DATE LIKE '2025-${m}%')        -        (SELECT SUM(TOTAL) FROM exp WHERE DATE LIKE '2025-${m}%')        -        (SELECT SUM(TOTAL) FROM sal WHERE DATE LIKE '2025-${m}%')        -        (SELECT SUM(TOTAL) FROM charges WHERE DATE LIKE '2025-${m}%');"
#sudo mariadb -D cashphones -e "select 'TABLE','PROFIT' UNION select ' ',' ' union select 'PHONES',SUM(s.TOTAL - p.TOTAL)  FROM s_table s join p_table p on s.ORDER_ID = p.ORDER_ID where s.DATE like '2025-${m}%' UNION select '  ','  ' union select 'S_ACC', sum(TOTAL_PROFIT) from s_acc where date like '2025-${m}%' UNION select '   ','   ' union select (select sum(TOTAL) from repair where date like '2025-${m}%') - (select sum(TOTAL) from parts where date like '2025-${m}%') AS REPAIR UNION select '    ','     ' union select 'EXPANSE',sum(TOTAL) from exp where date like '2025-${m}%' UNION select '           ','           ' union select 'SALARY', sum(TOTAL) from sal where date like '2025-${m}%'  UNION select '         ','         '  union select 'PENDING',sum(PENDING) from pen_h  where date like '2025-${m}%'  UNION select '--------------------','-----------' union SELECT 'GRAND PROFIT/LOSS',(SELECT SUM(s.TOTAL - p.TOTAL)  FROM s_table s join p_table p on s.ORDER_ID = p.ORDER_ID where s.DATE like '2025-${m}%')+(select sum(TOTAL_PROFIT) FROM s_acc where DATE like '2025-${m}%')+(select (select sum(TOTAL) FROM repair where DATE like '2025-${m}%') - (select sum(TOTAL) FROM parts where DATE like '2025-${m}%')) -(select sum(TOTAL) FROM exp where DATE like '2025-${m}%')-(select sum(TOTAL) FROM sal where DATE like '2025-${m}%')-(select sum(PENDING) FROM pen_h where DATE like '2025-${m}%')";
echo " "
#echo -e -n "ENTER THE MONTH NAME = "
#read d
echo " "
#echo -e -n "PHONE PROFIT = "
#read p
echo " "
#echo -e -n "ACCESSORIES PROFIT = "
#read s
#echo " "
#echo -e -n "REPAIR PROFIT = "
#read r
#echo " "
#echo -e -n "EXPANSES = "
#read e
#echo -e -n "PENDING = "
#read pp
#echo " "
#t=$(echo "$p + $s + $r - $e - $pp" |bc )
#sudo mariadb -u root -p -e "insert into profit values('${d}',${p},${s},${r},${e},${pp},${t})"; cashphones
#echo " "
#sudo mariadb -u root -p -e "select * from profit"; cashphones
#echo " "
#echo -e -n ".) BACK "
#read b
#case $b in
#	.)
#		start
#		;;
#esac
}

refresh(){

sudo mariadb -u root -p -e "set foreign_key_checks=0;delete from stock where QNTY=0;" cashphones

start
}


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
uo=$(printf "%02d" "$o")
echo " "
t=$(( uo - 1 ))
sudo mariadb -D cashphones -e "select * from bal where DATE='2025-${mo}-${t}'"; 
echo " "
echo -e -n "BAL => "|lolcat
read b
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
sudo mariadb -D cashphones -e "select ' ' AS NAME ,' ' as CASH  UNION select 'PURCHASE_PHONE',IFNULL((select SUM(CASH) FROM p_table WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'P_ACCESSORIES',IFNULL((select SUM(CASH) FROM p_acc WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'EXPANSES',IFNULL((select SUM(CASH) FROM exp WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'FUND_SUB',IFNULL((select SUM(CASH) FROM fund_sub WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'PENDING',IFNULL((select SUM(CASH) FROM pen_h WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'P_PAYMENT_SEND',IFNULL((select SUM(CASH) FROM p_send WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'SALARY',IFNULL((select SUM(CASH) FROM sal WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'REPAIR PARTS',IFNULL((select SUM(CASH) FROM parts WHERE DATE LIKE '2025-${mo}-${o}'),0)  UNION select 'SALE_PHONE',IFNULL((select SUM(CASH) FROM s_table WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'REPAIR',IFNULL((select SUM(CASH) FROM repair WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'S_ACCESSORIES',IFNULL((select SUM(CASH) FROM s_acc WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'FUND_ADD',IFNULL((select SUM(CASH) FROM fund_add WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'PENDING_REC',IFNULL((select SUM(CASH) FROM pen_rec WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'P_PAYMENT_DELAY',IFNULL((select SUM(CASH) FROM p_delay WHERE DATE LIKE '2025-${mo}-${o}'),0)  union select  '----------------','--------' union select '2025-${mo}-${o} BALANCE',(select '${b}')+IFNULL((select SUM(CASH) FROM s_table WHERE DATE LIKE '2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM repair WHERE DATE LIKE '2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM s_acc WHERE DATE LIKE '2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM fund_add WHERE DATE LIKE '2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM pen_rec WHERE DATE LIKE '2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM p_delay WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM p_table WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM p_acc WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM exp WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM fund_sub WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM pen_h WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM p_send WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM sal WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM parts WHERE DATE LIKE '2025-${mo}-${o}'),0);"
echo " "
echo " "
echo "
1) REPEAT

2) MOVE" |lolcat
echo " "
read -p "===>" n
case $n in
	1) 
		cash_bal
		;;
	2)
		echo " "
		echo -e -n "P-PHONE = "|lolcat
		read p
		echo " "
		echo -e -n "P-ACCESSORIES = "|lolcat
		read a
		echo " "
		echo -e -n "EXPANSE = "|lolcat
		read e
		echo " "
		echo -e -n "FUND_SUB = "|lolcat
		read fs
		echo " "
		echo -e -n "PENDING = "|lolcat
		read pp
		echo " "
		echo -e -n "P-SEND = "|lolcat
		read ps
		echo " "
		echo -e -n "SALARY = "|lolcat
		read sa
		echo " "
		echo -e -n "PARTS = "|lolcat
		read pa
		echo " "
		echo -e -n "S-PHONE = "|lolcat
		read s
		echo " "
		echo -e -n "REPAIR = "|lolcat
		read r
		echo " "
		echo -e -n "S-ACCESSORIES = "|lolcat
		read sac
		echo " "
		echo -e -n "FUND-ADD = "|lolcat
		read fa
		echo " "
		echo -e -n "PENDING_REC = "|lolcat
		read pr
		echo " "
		echo -e -n "P-DELAY = "|lolcat
		read pd
		echo " "
		echo " "
		t=$(( b + s + r + sac + fa + pr + pd - p - a - e - fs - pp - ps - sa - pa ))
		sudo mariadb -D cashphones -e "insert into bal values('2025-${mo}-${o}',${b},${p},${a},${e},${fs},${pp},${ps},${sa},${pa},${s},${r},${sac},${fa},${pr},${pd},${t})";
		echo " "
		echo " "
		sudo mariadb -D cashphones -e "select * from bal where DATE LIKE '2025-${mo}-%'";

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

uo=$(printf "%02d" "$o")
echo " "
t=$(( uo - 1 ))

sudo mariadb -D cashphones -e "select * from axis where DATE='2025-${mo}-${t}'";
echo " "
echo -e -n "AXIS BAL => "|lolcat
read b
echo " "
echo "P-PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from p_table where DATE like '2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo "P_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from p_acc where DATE like '2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo "EXPANSES"
echo "--------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from exp where DATE like '2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "FUND SUBTRACT"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from fund_sub where DATE like '2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "PENDING"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select * from pen_h where DATE like '2025-${mo}-${o}%' AND AXIS <> 0";
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
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from s_table where DATE like '2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo " "
echo "REPAIR"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from repair where DATE like '2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo " "
echo "S_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from s_acc where DATE like '2025-${mo}-${o}%' AND AXIS <> 0";
echo " "
echo " "
echo "FUNDS ADD"
echo "---------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from fund_add where DATE like '2025-${mo}-${o}%' AND AXIS <> 0";
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
sudo mariadb -D cashphones -e "select ' ' AS NAME, ' ' as AXIS UNION  select 'PURCHASE_PHONE', IFNULL((select SUM(AXIS) FROM p_table WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'P_ACCESSORIES', IFNULL((select SUM(AXIS) FROM p_acc WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'EXPANSES', IFNULL((select SUM(AXIS) FROM exp WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'FUND_SUB', IFNULL((select SUM(AXIS) FROM fund_sub WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'PENDING', IFNULL((select SUM(AXIS) FROM pen_h WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'P_PAYMENT_SEND', IFNULL((select SUM(AXIS) FROM p_send WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'BANK CHARGES', IFNULL((select SUM(AXIS) FROM charges WHERE DATE like '2025-${mo}-${o}%'),0) UNION select 'SALARY',IFNULL((select SUM(AXIS) FROM sal WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'REPAIR PARTS',IFNULL((select SUM(AXIS) FROM parts WHERE DATE LIKE '2025-${mo}-${o}'),0)  UNION  select 'S_PHONE', IFNULL((select SUM(AXIS) FROM s_table WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'REPAIR', IFNULL((select SUM(AXIS) FROM repair WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'S_ACC', IFNULL((select SUM(AXIS) FROM s_acc WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'FUND_ADD', IFNULL((select SUM(AXIS) FROM fund_add WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'PEN_REC', IFNULL((select SUM(AXIS) FROM pen_rec WHERE DATE like '2025-${mo}-${o}%'),0) UNION  select 'P_PAYMENT_DELAY', IFNULL((select SUM(AXIS) FROM p_delay WHERE DATE like '2025-${mo}-${o}%'), 0)  union select '------------','--------' union select 'GRAND_TOTAL',(select '${b}')+IFNULL((select SUM(AXIS) FROM s_table WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM repair WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM s_acc WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM fund_add WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM pen_rec WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM p_delay WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_table WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_acc WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM exp WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM fund_sub WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM pen_h WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_send WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM charges WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM sal WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM parts WHERE DATE like '2025-${mo}-${o}%'),0)";
echo " "
echo " "
echo "
1) REPEAT

2) MOVE" |lolcat
echo " "
read -p "===>" n
case $n in
	1) 
		axis_bal
		;;
	2)
		echo " "
		echo " "
		echo "AXIS"
		echo "----"
		echo " "
		echo -e -n "P-PHONE = "
		read p
		echo " "
		echo -e -n "P-ACCESSORIES = "
		read a
		echo " "
		echo -e -n "EXPANSE = "
		read e
		echo " "
		echo -e -n "FUND_SUB = "
		read fs
		echo " "
		echo -e -n "PENDING = "
		read pp
		echo " "
		echo -e -n "P-SEND = "
		read ps
		echo " "
		echo -e -n "BANK CHARGES = "
		read bc
		echo " "
		echo -e -n "SALARY = "|lolcat
		read sa
		echo " "
		echo -e -n "PARTS = "|lolcat
		read pa
		echo " "
		echo -e -n "S-PHONE = "
		read s
		echo " "
		echo -e -n "REPAIR = "
		read r
		echo " "
		echo -e -n "S-ACCESSORIES = "
		read sac
		echo " "
		echo -e -n "FUND-ADD = "
		read fa
		echo " "
		echo -e -n "PENDING_REC = "
		read pr
		echo " "
		echo -e -n "P-DELAY = "
		read pd
		echo " "
		t=$(echo $b + $s + $r + $sac + $fa + $pr + $pd - $p - $a - $e - $fs - $pp - $ps - $bc - $sa - $pa |bc)
		sudo mariadb -D cashphones -e "insert into axis values('2025-${mo}-${o}',${b},${p},${a},${e},${fs},${pp},${ps},${bc},${sa},${pa},${s},${r},${sac},${fa},${pr},${pd},${t})";
		echo " "
		echo " "
		sudo mariadb -D cashphones -e "select * from axis where DATE LIKE '2025-${mo}-%'"; 

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
uo=$(printf "%02d" "$o")
echo " "
t=$(( uo - 1 ))

sudo mariadb -D cashphones -e "select * from icici where DATE='2025-${mo}-${t}'";
echo " "
echo -e -n "ICICI BAL => "|lolcat
read b
echo " "
echo "P-PHONE"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,ICICI from p_table where DATE like '2025-${mo}-${o}%' AND ICICI <> 0";
echo " "
echo "P_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from p_acc where DATE like '2025-${mo}-${o}%' AND ICICI <> 0";
echo " "
echo "EXPANSES"
echo "--------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from exp where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "FUND SUBTRACT"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from fund_sub where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "PENDING"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select * from pen_h where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
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
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,ICICI from s_table where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "REPAIR"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from repair where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "S_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from s_acc where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "FUNDS ADD"
echo "---------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,ICICI from fund_add where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
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
sudo mariadb -D cashphones -e "select ' ' AS NAME, ' ' as ICICI UNION  select 'PURCHASE_PHONE', IFNULL((select SUM(ICICI) FROM p_table WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'P_ACCESSORIES', IFNULL((select SUM(ICICI) FROM p_acc WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'EXPANSES', IFNULL((select SUM(ICICI) FROM exp WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'FUND_SUB', IFNULL((select SUM(ICICI) FROM fund_sub WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'PENDING', IFNULL((select SUM(ICICI) FROM pen_h WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'P_PAYMENT_SEND', IFNULL((select SUM(ICICI) FROM p_send WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'BANK CHARGES', IFNULL((select SUM(ICICI) FROM charges WHERE DATE like '2025-${mo}-${o}%'),0) UNION select 'SALARY',IFNULL((select SUM(ICICI) FROM sal WHERE DATE LIKE '2025-${mo}-${o}'),0) UNION select 'REPAIR PARTS',IFNULL((select SUM(ICICI) FROM parts WHERE DATE LIKE '2025-${mo}-${o}'),0)  UNION  select 'S_PHONE', IFNULL((select SUM(ICICI) FROM s_table WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'REPAIR', IFNULL((select SUM(ICICI) FROM repair WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'S_ACC', IFNULL((select SUM(ICICI) FROM s_acc WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'FUND_ADD', IFNULL((select SUM(ICICI) FROM fund_add WHERE DATE like '2025-${mo}-${o}%'), 0) UNION  select 'PEN_REC', IFNULL((select SUM(ICICI) FROM pen_rec WHERE DATE like '2025-${mo}-${o}%'),0) UNION  select 'P_PAYMENT_DELAY', IFNULL((select SUM(ICICI) FROM p_delay WHERE DATE like '2025-${mo}-${o}%'), 0)  union select '------------','--------' union select 'GRAND_TOTAL',(select '${b}')+IFNULL((select SUM(ICICI) FROM s_table WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM repair WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM s_acc WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM fund_add WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM pen_rec WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM p_delay WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM p_table WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM p_acc WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM exp WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM fund_sub WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM pen_h WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM p_send WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM charges WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM sal WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM parts WHERE DATE like '2025-${mo}-${o}%'),0)"; 
echo " "
echo " "
echo "
1) REPEAT

2) MOVE" |lolcat
echo " "
read -p "===>" n
case $n in
	1) 
		icici_bal
		;;
	2)
		echo " "
		echo " "
		echo "ICICI"
		echo "----"
		echo " "
		echo -e -n "P-PHONE = "
		read p
		echo " "
		echo -e -n "P-ACCESSORIES = "
		read a
		echo " "
		echo -e -n "EXPANSE = "
		read e
		echo " "
		echo -e -n "FUND_SUB = "
		read fs
		echo " "
		echo -e -n "PENDING = "
		read pp
		echo " "
		echo -e -n "P-SEND = "
		read ps
		echo " "
		echo -e -n "BANK CHARGES = "
		read bc
		echo " "
		echo -e -n "SALARY = "|lolcat
		read sa
		echo " "
		echo -e -n "PARTS = "|lolcat
		read pa
		echo " "
		echo -e -n "S-PHONE = "
		read s
		echo " "
		echo -e -n "REPAIR = "
		read r
		echo " "
		echo -e -n "S-ACCESSORIES = "
		read sac
		echo " "
		echo -e -n "FUND-ADD = "
		read fa
		echo " "
		echo -e -n "PENDING_REC = "
		read pr
		echo " "
		echo -e -n "P-DELAY = "
		read pd
		echo " "
		t=$(echo $b + $s + $r + $sac + $fa + $pr + $pd - $p - $a - $e - $fs - $pp - $ps - $bc - $sa - $pa |bc)
		sudo mariadb -D cashphones -e "insert into icici values('2025-${mo}-${o}',${b},${p},${a},${e},${fs},${pp},${ps},${bc},${sa},${pa},${s},${r},${sac},${fa},${pr},${pd},${t})";
		echo " "
		echo " "
		sudo mariadb -D cashphones -e "select * from icici where DATE LIKE '2025-${mo}-%'";
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
uo=$(printf "%02d" "$o")
echo " "
t=$(( uo - 1 ))
echo "CASH"
echo "----"
sudo mariadb -D cashphones  -e "select * from bal where DATE='2025-${mo}-${t}'"; 
echo " "
echo "AXIS"
echo "----"
sudo mariadb -D cashphones  -e "select * from axis where DATE='2025-${mo}-${t}'"; 
echo " "
echo "ICICI"
echo "----"
sudo mariadb -D cashphones  -e "select * from icici where DATE='2025-${mo}-${t}'";
echo " "
echo -e -n " CASH BAL => "|lolcat
read b
echo " "
echo -e -n " AXIS BAL => "|lolcat
read bb
echo " "
echo -e -n " ICICI BAL => "|lolcat
read bi
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
sudo mariadb -D cashphones  -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from p_table where DATE like '2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo "P_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,AXIS from p_acc where DATE like '2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo "EXPANSES"
echo "--------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,AXIS from exp where DATE like '2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "FUND SUBTRACT"
echo "-------------"
echo " "
sudo mariadb -D cashphones  -e "select DATE,NAME,AXIS from fund_sub where DATE like '2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "PENDING"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select * from pen_h where DATE like '2025-${mo}-${o}%'"; 
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
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from s_table where DATE like '2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "REPAIR"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from repair where DATE like '2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "S_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from s_acc where DATE like '2025-${mo}-${o}%' AND AXIS <> 0"; 
echo " "
echo " "
echo "FUNDS ADD"
echo "---------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from fund_add where DATE like '2025-${mo}-${o}%' AND AXIS <> 0"; 
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
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from p_table where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo "P_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from p_acc where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo "EXPANSES"
echo "--------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from exp where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "FUND SUBTRACT"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from fund_sub where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "PENDING"
echo "-------"
echo " "
sudo mariadb -D cashphones -e "select * from pen_h where DATE like '2025-${mo}-${o}%'"; 
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
sudo mariadb -D cashphones -e "select ORDER_ID,NAME,STORAGE,C_NAME,IMEI,DATE,AXIS from s_table where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "REPAIR"
echo "------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from repair where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "S_ACCESSORIES"
echo "-------------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from s_acc where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
echo " "
echo " "
echo "FUNDS ADD"
echo "---------"
echo " "
sudo mariadb -D cashphones -e "select DATE,NAME,AXIS from fund_add where DATE like '2025-${mo}-${o}%' AND ICICI <> 0"; 
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



sudo mariadb -D cashphones -e "select ' ' AS NAME ,' ' as CASH,' ' as AXIS,' ' as ICICI  UNION select 'PURCHASE_PHONE',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM p_table WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'P_ACCESSORIES',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM p_acc WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'EXPANSES',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM exp WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'FUND_SUB',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM fund_sub WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'PENDING',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM pen_h WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'P_PAYMENT_SEND',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM p_send WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'BANK CHARGES',IFNULL(SUM(0),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM charges WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'SALARY',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM sal WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'REPAIR PARTS',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM parts WHERE DATE LIKE '2025-${mo}-${o}'  UNION select 'SALE_PHONE',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM s_table WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'REPAIR',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM repair WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'S_ACCESSORIES',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM s_acc WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'FUND_ADD',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM fund_add WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'PENDING_REC',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM pen_rec WHERE DATE LIKE '2025-${mo}-${o}' UNION select 'P_PAYMENT_DELAY',IFNULL(SUM(CASH),0),IFNULL(SUM(AXIS),0),IFNULL(SUM(ICICI),0) FROM p_delay WHERE DATE LIKE '2025-${mo}-${o}'  union select  '----------------','---------','---------','---------' union select '2025-${mo}-${o} BALANCE',(select '${b}')+IFNULL((select SUM(CASH) FROM s_table WHERE DATE LIKE '2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM repair WHERE DATE LIKE '2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM s_acc WHERE DATE LIKE '2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM fund_add WHERE DATE LIKE '2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM pen_rec WHERE DATE LIKE '2025-${mo}-${o}'),0)+IFNULL((select SUM(CASH) FROM p_delay WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM p_table WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM p_acc WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM exp WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM fund_sub WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM pen_h WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(0) FROM charges WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM sal WHERE DATE LIKE '2025-${mo}-${o}'),0)-IFNULL((select SUM(CASH) FROM parts WHERE DATE LIKE '2025-${mo}-${o}'),0),(select '${bb}')+IFNULL((select SUM(AXIS) FROM s_table WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM repair WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM s_acc WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM fund_add WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM pen_rec WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(AXIS) FROM p_delay WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_table WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_acc WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM exp WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM fund_sub WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM pen_h WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM p_send WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM charges WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM sal WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(AXIS) FROM parts WHERE DATE like '2025-${mo}-${o}%'),0),(select '${bi}')+IFNULL((select SUM(ICICI) FROM s_table WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM repair WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM s_acc WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM fund_add WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM pen_rec WHERE DATE like '2025-${mo}-${o}%'),0)+IFNULL((select SUM(ICICI) FROM p_delay WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM p_table WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM p_acc WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM exp WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM fund_sub WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM pen_h WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM p_send WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM charges WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM sal WHERE DATE like '2025-${mo}-${o}%'),0)-IFNULL((select SUM(ICICI) FROM parts WHERE DATE like '2025-${mo}-${o}%'),0);" 
echo " "
echo " "
bal
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
echo "1) CASH BALANCE"|lolcat
echo ""
echo "2) AXIS BALANCE"|lolcat
echo ""
echo "3) ICICI BALANCE"|lolcat
echo ""
echo "4) MERGE BALANCE"|lolcat
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

11) ℝ 𝔼 𝔽 ℝ 𝔼 𝕊 ℍ
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
		python b.py
		;;
	9)
		clear
		profit
		;;
	10)
		clear
		bal
		;;
	11)
		clear
		refresh
		;;
	*)
		echo "𝕀 ℕ 𝕍 𝔸  𝕃 𝕀 𝔻   𝕆 ℙ 𝕋  𝕀 𝕆 ℕ" |lolcat
		;;
esac
}
start
