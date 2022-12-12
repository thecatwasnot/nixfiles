{ lib, bundlerApp, ruby_3_0 }:
bundlerApp {
  pname = "hanami";
  ruby = ruby_3_0;

  gemdir = ./.;

  exes = [ "hanami" ];

  meta = with lib; {
    description = "";
    homepage = "https://hanamirb.org/";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ thecatwasnot ];

  };
}
