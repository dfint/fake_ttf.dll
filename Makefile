clean:
	rm src/*.dll
	rm -rf build

build_x86:
	mkdir -p build
	fasm src/fake_ttf.asm build/fake_ttf.dll

build_x64:
	mkdir -p build
	fasm src/fake_ttf_x64.asm build/fake_ttf.dll
