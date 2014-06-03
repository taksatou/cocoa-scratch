.PHONY: clean
all:: a.out

SRC=a.m
CPPFLAGS=-I./Pods/Headers
CFLAGS=-fobjc-arc -framework Foundation

Podfile.lock: Podfile
	pod install --no-integrate

Pods/build/Release/libPods.a: Podfile.lock
	cd Pods && xcodebuild

a.out: Pods/build/Release/libPods.a ${SRC}
	clang ${CPPFLAGS} ${CFLAGS} $^ && ./a.out

clean:
	rm -rf a.out Pods *.lock
