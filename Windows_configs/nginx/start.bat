@echo off
echo Starting PHP FastCGI...
RunHiddenConsole.exe c:/Server/php/php-cgi.exe -b 127.0.0.1:9000  -c C:/Server/php/php.ini
echo Starting nginx...
C:/Server/nginx/nginx.exe