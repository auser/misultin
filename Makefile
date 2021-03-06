EBIN_DIR := ebin
SRC_DIR := src
EXAMPLES_DIR := examples
INCLUDE_DIR := include
ERLC := erlc
ERLC_FLAGS := -W -I $(INCLUDE_DIR) -o $(EBIN_DIR)

all:
	@mkdir -p $(EBIN_DIR)
	$(ERLC) $(ERLC_FLAGS) $(SRC_DIR)/*.erl
	@cp $(SRC_DIR)/*.app $(EBIN_DIR)/
	
clean:
	@rm -rf $(EBIN_DIR)/*.beam
	@rm -f erl_crash.dump
	
debug:
	@mkdir -p $(EBIN_DIR)
	$(ERLC) -D log_debug $(ERLC_FLAGS) $(SRC_DIR)/*.erl
	@cp $(SRC_DIR)/*.app $(EBIN_DIR)/

example:
	@mkdir -p $(EBIN_DIR)
	$(ERLC) $(ERLC_FLAGS) $(SRC_DIR)/*.erl
	@cp $(SRC_DIR)/*.app $(EBIN_DIR)/
	$(ERLC) $(ERLC_FLAGS) $(EXAMPLES_DIR)/*.erl