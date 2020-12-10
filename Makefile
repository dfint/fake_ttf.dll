clean:
	rm src/*.dll || true
	rm -rf build
	rm fake_ttf_*.zip || true

build/fake_ttf.dll: src/fake_ttf.asm src/*.inc
	mkdir -p build
	fasm src/fake_ttf.asm build/fake_ttf.dll

build/fake_ttf_x64.dll: src/fake_ttf_x64.asm src/*.inc
	mkdir -p build
	fasm src/fake_ttf_x64.asm build/fake_ttf_x64.dll

fake_ttf_x86.zip: build/fake_ttf.dll install_fake_ttf.bat
	rm fake_ttf_x86.zip || true
	cp install_fake_ttf.bat build/
	cd build && zip -r ../fake_ttf_x86.zip fake_ttf.dll install_fake_ttf.bat

fake_ttf_x64.zip: build/fake_ttf_x64.dll install_fake_ttf_x64.bat
	rm fake_ttf_x64.zip || true
	cp install_fake_ttf_x64.bat build/
	cd build && zip -r ../fake_ttf_x64.zip fake_ttf_x64.dll install_fake_ttf_x64.bat

package_x86: fake_ttf_x86.zip

package_x64: fake_ttf_x64.zip

package_all: package_x86 package_x64
