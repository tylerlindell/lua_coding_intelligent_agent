for file in $(find / -name '*.php');
do
 cat "$file" >> data/largePHP.txt
done
 iconv -f ISO-8859-1 -t UTF-8  data/largePHP.txt > data/largePHP_UTF-8.txt
 cat data/largePHP_UTF-8.txt