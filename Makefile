CFLAGS=-Wall -O
SERVERPATH=src_server/
LINUXCLIENT=src_linux_client/
WINCLIENT=src_windows_client/

all: server linux_client windows_client

server: $(SERVERPATH)*.[ch]
	@echo -e "\E[32m Server compilation\E[0m"
	@make -C $(SERVERPATH)
	@rm -f $(SERVERPATH)*.o

linux_client: $(LINUXCLIENT)*.[ch]
	@echo -e "\E[32m Linux client compilation\E[0m"
	@make -C $(LINUXCLIENT)
	@rm -f $(LINUXCLIENT)*.o

windows_client: $(LINUXCLIENT)*.[ch]
	@echo -e "\E[32m Linux client compilation\E[0m"
	@make -C $(WINCLIENT)

clean:
	@rm -f */*.o

delete: clean
	@rm -f server
	@echo -e '\E[31m'"server was deleted"
	@rm -f linux_client
	@echo -e '\E[31m'"client was deleted"