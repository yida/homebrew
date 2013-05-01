require 'formula'

class Drcsim < Formula
  homepage 'http://gazebosim.org'
  url 'https://bitbucket.org/yida/drcsim/get/drc_no_ros.tar.bz2'
  sha1 '376aa3e6e73f328f65c523d4518e2dd0e96dda43'
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
