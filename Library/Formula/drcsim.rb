require 'formula'

class Drcsim < Formula
  homepage 'http://gazebosim.org'
  url 'https://bitbucket.org/yida/drcsim/get/drcsim_2.5.0_no_ros.tar.bz2'
  sha1 'f356f954694f89e2ff8f6141bb0108313f2343ef'
  version '2.5'

  depends_on 'cmake'  => :build

  def install
    ENV.m64

    cmake_args = [
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
