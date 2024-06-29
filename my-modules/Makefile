obj-m += hello-1.o

OUTPUT := ../out
PWD := $(CURDIR)

all:
	make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
		O=$(OUTPUT) \
		-I../kernel-headers/include -C ../linux M=$(PWD) modules

clean:
	rm *.o \
		*.ko \
		*.mod.c \
		*.order \
		*.symvers
