require 'formula'

class Octomap < Formula
  homepage 'http://gazebosim.org'
  url 'https://github.com/OctoMap/octomap/archive/v1.6.0.tar.gz'
  sha1 '7323e0f7f9532bcdbc00fcc453855cae9b6462ea'
  version '1.6.0'

  depends_on 'cmake'  => :build
  depends_on 'doxygen'
  depends_on 'libqglviewer'

  def patches
    [
      "https://gist.github.com/yida/5427758"
      "https://gist.github.com/yida/5427759"
      "https://gist.github.com/yida/5427760"
      "https://gist.github.com/yida/5427761"
      "https://gist.github.com/yida/5427762"
      "https://gist.github.com/yida/5427763"
    ]

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
