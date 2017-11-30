
- Configure with e.g ./configure_ios_build.sh
- Build with make
- Process the static libraries with ranlib (?) to avoid undefined symbol warnings:
 
/Library//Developer/CommandLineTools/usr/bin/ranlib *.a

