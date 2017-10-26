mysql -u root bitcoin --verbose -e "select count(*) from address;"

mysql -u root bitcoin --verbose -e "select * from used_address u inner join address a on (a.public = u.public);"

mysql -u root bitcoin --verbose -e "select * from used_address u inner join address a on (a.public_c = u.public);"

mysql -u root bitcoin --verbose -e "delete from address;"

