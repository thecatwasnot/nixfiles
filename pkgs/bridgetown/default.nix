{ lib, bundlerApp, ruby_3_1 }:
bundlerApp {
  pname = "bridgetown";
  ruby = ruby_3_1;

  gemdir = ./.;

  exes = [ "bridgetown" ];

  meta = with lib; {
    description = "A next-generation, progressive site generator & fullstack framework, powered by Ruby.";
    homepage = "https://www.bridgetownrb.com/";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ thecatwasnot ];
  };
}
