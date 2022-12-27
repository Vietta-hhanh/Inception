all:
	docker-compose -f srcs/docker-compose.yml down
	docker volume rm -f srcs_DB srcs_WP 
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up --build --force-recreate
clean:
	sudo docker-compose -f srcs/docker-compose.yml down --rmi all
	sudo docker volume prune -f
	sudo docker volume rm srcs_WP srcs_DB
re: clean all