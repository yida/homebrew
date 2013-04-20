require 'formula'

class Octomap < Formula
  homepage 'http://octomap.github.io/'
  url 'https://github.com/OctoMap/octomap/archive/v1.6.0.tar.gz'
  sha1 '7323e0f7f9532bcdbc00fcc453855cae9b6462ea'

  depends_on 'cmake'  => :build
  depends_on 'doxygen'
  depends_on 'libqglviewer'

  def patches
    [
      "https://gist.github.com/yida/5427758/raw/16324af3539045c4cfb6081af7772dfe9c05d973/0001-Doxygen-updates-additions.patch",
      "https://gist.github.com/yida/5427759/raw/8a3ff0578407904506930f968c66797df47bd5d8/0002-Fixed-compilation-with-OSX-10.8-std-isnan-Issue-23.patch",
      "https://gist.github.com/yida/5427760/raw/0bbdb34c87e446f11deb86c24c1d330179f0f28c/0003-Fix-.dylib-in-CMake-configs-for-Mac-OS-Issue-23.patch",
      "https://gist.github.com/yida/5427761/raw/e1bcd3f31e0b5c96fe9fd3e67b9f232836115438/0004-Modify-CMake-system-to-support-Mac-OSX-using-Homebre.patch",
      "https://gist.github.com/yida/5427762/raw/cf42c12747111d66cd17c8ec82d5a578bd07544c/0005-Fix-cmake-file-to-match-homebrew-install.patch",
      "https://gist.github.com/yida/5427763/raw/f575d8173124c8a27a3aea39ed7cc5b886a37c41/0006-clean-debugging-message.patch"
    ]
  end

  def install
    ENV.m64

    cmake_args = [
      "-DCMAKE_BUILD_TYPE='Release'",
      "-DCMAKE_INSTALL_PREFIX='#{prefix}'",
      "-Wno-dev"
    ]
    #cmake_args.concat(std_cmake_args)
    cmake_args << ".."

    mkdir "build" do
      system "cmake", *cmake_args
      system "make install"
    end
  end
end
