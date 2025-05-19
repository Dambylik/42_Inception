NAME = inception

NGINX       := nginx
WORDPRESS   := wordpress
MARIADB     := mariadb

SRCS        := srcs
COMPOSE_FILE := $(SRCS)/docker-compose.yml
REQ_DIR     := $(SRCS)/requirements

VOLUMES_PATH := ~/data
MARIADB_VOL  := $(VOLUMES_PATH)/mariadb
WORDPRESS_VOL := $(VOLUMES_PATH)/wordpress

BOLD        := $(shell echo -e "\033[1m")
RESET       := $(shell echo -e "\033[0m")
GREEN       := $(shell echo -e "\033[32m")
YELLOW      := $(shell echo -e "\033[33m")
RED         := $(shell echo -e "\033[31m")

DOCKCOMP    := docker-compose -f $(COMPOSE_FILE)
MKDIR       := mkdir -p
RM          := rm -rf

UP_FLAG := .flag

all: .create_volumes up

$(UP_FLAG):
	@$(MKDIR) $(MARIADB_VOL) $(WORDPRESS_VOL)
	@cd $(SRCS) && docker-compose up -d --build
	@touch $(UP_FLAG)
	@echo "$(BOLD)$(GREEN)Containers are up and running!$(RESET)"

up: $(UP_FLAG)

build:
	@echo "$(BOLD)$(YELLOW)Building containers...$(RESET)"
	@cd $(SRCS) && docker-compose build

down:
	@echo "$(BOLD)$(YELLOW)Stopping containers...$(RESET)"
	@cd $(SRCS) && docker-compose down
	@rm -f $(UP_FLAG)

restart: down up

logs:
	@echo "$(BOLD)$(YELLOW)Showing logs...$(RESET)"
	@cd $(SRCS) && docker-compose logs -f

ps:
	@cd $(SRCS) && docker-compose ps

stop:
	@echo "$(BOLD)$(YELLOW)Stopping containers...$(RESET)"
	@cd $(SRCS) && docker-compose stop
	@rm -f $(UP_FLAG)

.create_volumes:
	@$(MKDIR) $(MARIADB_VOL) $(WORDPRESS_VOL)
	@echo "$(BOLD)$(GREEN)Volumes created at $(VOLUMES_PATH)$(RESET)"

clean: stop
	@echo "$(BOLD)$(YELLOW)Removing volumes...$(RESET)"
	@$(RM) $(MARIADB_VOL) $(WORDPRESS_VOL)
	@echo "$(BOLD)$(GREEN)Volumes removed$(RESET)"

fclean: down
	@echo "$(BOLD)$(YELLOW)Removing all Docker resources...$(RESET)"
	@docker system prune -af
	@sudo $(RM) -rf $(MARIADB_VOL) $(WORDPRESS_VOL)
	@sudo $(RM) -rf $(WORDPRESS_VOL)
	@echo "$(BOLD)$(GREEN)All Docker resources removed$(RESET)"

eval:
	@$(RM) $(UP_FLAG)
	@if [ -n "$$(docker ps -qa)" ]; then \
		echo "$(BOLD)$(YELLOW)Stopping containers...$(RESET)"; \
		docker stop $$(docker ps -qa) > /dev/null 2>&1 || true; \
	fi
	@if [ -n "$$(docker ps -qa)" ]; then \
		echo "$(BOLD)$(YELLOW)Removing containers...$(RESET)"; \
		docker rm $$(docker ps -qa) > /dev/null 2>&1 || true; \
	fi
	@if [ -n "$$(docker images -qa)" ]; then \
		echo "$(BOLD)$(YELLOW)Removing images...$(RESET)"; \
		docker rmi -f $$(docker images -qa) > /dev/null 2>&1 || true; \
	fi
	@if [ -n "$$(docker volume ls -q)" ]; then \
		echo "$(BOLD)$(YELLOW)Removing volumes...$(RESET)"; \
		docker volume rm $$(docker volume ls -q) > /dev/null 2>&1 || true; \
	fi
	@if [ -n "$$(docker network ls -q --filter type=custom)" ]; then \
		echo "$(BOLD)$(YELLOW)Removing networks...$(RESET)"; \
		docker network rm $$(docker network ls -q --filter type=custom) > /dev/null 2>&1 || true; \
	fi
	@echo "$(BOLD)$(GREEN)Environment ready for evaluation...$(RESET)"

re: fclean all

.PHONY: all up build down restart logs ps stop clean fclean eval re
