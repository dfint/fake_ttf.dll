clean:
	rm src/*.dll || true
	rm -rf build
	rm fake_ttf_*.zip

build_x86:
	mkdir -p build
	fasm src/fake_ttf.asm build/fake_ttf.dll

build_x64:
	mkdir -p build
	fasm src/fake_ttf_x64.asm build/fake_ttf_x64.dll

package_x86: build_x86
	cp install_fake_ttf.bat build/
	cd build && zip -r ../fake_ttf_x86.zip fake_ttf.dll install_fake_ttf.bat

package_x64: build_x64
	cp install_fake_ttf_x64.bat build/
	cd build && zip -r ../fake_ttf_x64.zip fake_ttf_x64.dll install_fake_ttf_x64.bat

package_all: clean package_x86 package_x64
