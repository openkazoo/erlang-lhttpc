.PHONY: all release compile test clean rel doc build-plt dialyzer

PROJECT = lhttpc

REBAR := rebar3
DIALYZER = dialyzer

APPS = kernel stdlib sasl inets ssl public_key crypto compiler

all: compile

compile:
	$(REBAR) compile

doc:
	$(REBAR) doc

test:	compile
	$(REBAR) eunit

release: all dialyze test
	$(REBAR) release

clean:
	$(REBAR) clean

distclean:
	@rm -r _build/

dialyzer:
	$(REBAR) dialyzer
