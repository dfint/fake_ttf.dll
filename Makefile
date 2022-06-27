.PHONY: clean build_32 build_64 package_32 package_64 package_all

clean:
	rm src/*.dll || true
	rm -rf build
	rm fake_ttf_*.zip || true

build/fake_ttf_32.dll: src/fake_ttf_32.asm src/*.inc
	mkdir -p build
	fasm src/fake_ttf_32.asm build/fake_ttf_32.dll

build/fake_ttf_64.dll: src/fake_ttf_64.asm src/*.inc
	mkdir -p build
	fasm src/fake_ttf_64.asm build/fake_ttf_64.dll

build_32: build/fake_ttf_32.dll

build_64: build/fake_ttf_64.dll

fake_ttf_32.zip: build/fake_ttf_32.dll install_fake_ttf_32.bat
	rm fake_ttf_32.zip || true
	cp install_fake_ttf_32.bat build/
	cd build && zip -r ../fake_ttf_32.zip fake_ttf_32.dll install_fake_ttf_32.bat

fake_ttf_64.zip: build/fake_ttf_64.dll install_fake_ttf_64.bat
	rm fake_ttf_64.zip || true
	cp install_fake_ttf_64.bat build/
	cd build && zip -r ../fake_ttf_64.zip fake_ttf_64.dll install_fake_ttf_64.bat

package_32: fake_ttf_32.zip

package_64: fake_ttf_64.zip

package_all: package_32 package_64
