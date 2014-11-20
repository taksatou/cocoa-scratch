.PHONY: clean
all:: a.out

SRC=a.m
CPPFLAGS=-I./Pods/Headers/Public
CFLAGS=-fobjc-arc -framework Foundation

Podfile.lock: Podfile
	pod install --no-integrate

Pods/build/Release/libPods.a: Podfile.lock
	cd Pods && xcodebuild

a.out: Pods/build/Release/libPods.a ${SRC}
	clang -c ${CPPFLAGS} ${SRC}
	clang ${CFLAGS} Pods/build/Release/*.a *.o && ./a.out

clean:
	rm -rf a.out Pods *.lock
