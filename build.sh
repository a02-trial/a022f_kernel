export ARCH=arm
export CROSS_COMPILE=$(pwd)/toolchain/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9-lineage-19.1/bin/arm-linux-androideabi-
export CC=$(pwd)/toolchain/clang/host/linux-x86/clang-r383902/bin/clang
export CLANG_TRIPLE=arm-linux-gnueabi-

make -C $(pwd) O=$(pwd)/out ARCH=arm a02_defconfig

cp out/arch/arm/boot/Image $(pwd)/arch/arm/boot/Image
