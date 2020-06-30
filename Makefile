all:
	rm -rf include test_ebin/* test_src/*~ test_src/*.beam *_service *_config catalog erl_crasch.dump;
#	include
	git clone https://github.com/joq62/include.git;
#	node_config
	git clone https://github.com/joq62/node_config.git;
#	catalog
	git clone https://github.com/joq62/catalog.git;
#	dns_service
	git clone https://github.com/joq62/dns_service.git;	
	cp dns_service/src/*.app dns_service/ebin;
	erlc -I include -o dns_service/ebin dns_service/src/*.erl;
#	test
	erlc -o test_ebin test_src/*.erl;
	erl -pa test_ebin -pa */ebin -s basic_test start -sname basic_test
