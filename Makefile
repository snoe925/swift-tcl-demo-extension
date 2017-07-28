TARGET = libSwiftTclDemoExt.so

all: $(TARGET)

# swift build will make an error because of Tcl8_6 modulemap ?
# use shell test as a stand-in until this is sorted
$(TARGET): Sources/demoext.swift
	-swift build -Xswiftc -emit-library -Xswiftc -o -Xswiftc $(TARGET) \
		-Xswiftc -Xlinker -Xswiftc -lSwiftTcl \
		-Xswiftc -Xlinker -Xswiftc -ltcl8.6 \
		-Xswiftc -Xlinker -Xswiftc -ltclrefcount8.6 \
		-Xswiftc -Xlinker -Xswiftc -ltclstub8.6 \
		-Xswiftc -Xlinker -Xswiftc -lz
	test -f $(TARGET)

test: $(TARGET)
	tclsh8.6 packages/extension_test.tcl

clean:
	rm -rf .build $(TARGET) Package.pins
