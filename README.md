# 라즈베리 파이 커널 개발

## 개발환경

* Raspberry Pi 3 B+ (aarch64)
* archlinux 6.9.6-arch1-1 x86_64 GNU/Linux

## 스크립트 설명

* 스크립트를 사용한 [빌드 과정](https://mkparkqq.github.io/docs/kernel/clone-and-build.html)

* `clone_kernel.sh` - 4.19.y 커널 코드 다운로드
* `mkscope.sh` - cscope 데이터베이스 생성
* `build_rpi_kernel.sh` - 커널 빌드 (x86_64 -> aarch64 크로스 컴파일)
* `install_modules.sh` - 커널 모듈 생성 (`4.19.127-v8+`)
* `zip_kernel.sh` - 커널을 `rpi-kernel.tar.gz`으로 압축
* `send-new-kernel.sh` - 압축한 커널을 `$RPI_IPV4_ADDR`로 전송
* `create_kernel_headers.sh` - userspace application 개발에 필요한 커널 헤더 생성

## references
* [디버깅을 통해 배우는 리눅스 커널의 구조와 원리](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://m.yes24.com/Goods/Detail/90085976&ved=2ahUKEwiajeqRqYCHAxVRr1YBHce4CnUQFnoECBYQAQ&usg=AOvVaw1Krs1odtwo0oVwTN7IJZhe)
