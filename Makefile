DC=docker-compose
MC=codimd

all:start

init: ## Init the project after a git clone
	@echo "INIT PROJECT"
	@cp .env.dist .env

start: ## Build and launch the project in background
	@echo "Launch dettached projet and build\n"
	$(DC) up -d --build

clean: ## Stop and delete the project stack
	$(DC) down

logs: ## Attach to standard output of containers (to see logs)
	$(DC) -f docker-compose.yml logs -f $(MC)

re: clean start

exec: ## Execute command inside api container, need to use command=
	$(DC) exec $(MC) sh

.DEFAULT_GOAL := start
