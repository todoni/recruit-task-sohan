#!make

include .env

all : front server

dev : 
	cp .env ./front
	cd front && yarn install && yarn dev

front :
	cp .env ./front 
	cd front && yarn install && yarn build &&  pm2 serve --spa ./dist ${CLIENT_PORT} --name front

server :
	cd server && npm install && pm2 start server.js

clean :
	pm2 kill

fclean :
	pm2 kill -n front

sclean :
	pm2 kill -n server

re : clean
	make all

fre : fclean
	make front

sre : sclean
	make server

.PHONY : all clean fclean sclean fre sre re front server
