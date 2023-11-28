GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test -v
GOGET=$(GOCMD) get
BINARY_NAME=bin/rss_agg
MAIN_FILE=cmd/rss_agg/main.go

all: test build
build:
	$(GOBUILD) -o $(BINARY_NAME) $(MAIN_FILE) 
test:
	$(GOTEST) ./...
clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
run:
	$(GOBUILD) -o $(BINARY_NAME) -v ./...
	./$(BINARY_NAME)
deps:
	$(GOGET) github.com/go-chi/chi/v5 
	$(GOGET) github.com/go-chi/cors 
	$(GOGET) github.com/joho/godotenv 
