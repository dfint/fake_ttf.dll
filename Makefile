clean:
	rm src/*.dll

build_x86:
	fasm src/fake_ttf.asm

build_x64:
	fasm src/fake_ttf.asm
