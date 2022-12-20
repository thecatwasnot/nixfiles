{
  activemodel = {
    dependencies = [ "activesupport" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0wsaxvkggfx0w7yyhjkh3syyx6f2srby39asrg78cr90iiv5br3k";
      type = "gem";
    };
    version = "7.0.4";
  };
  activesupport = {
    dependencies = [ "concurrent-ruby" "i18n" "minitest" "tzinfo" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "183az13i4fsm28d0l5xhbjpmcj3l1lxzcxlx8pi8zrbd933jwqd0";
      type = "gem";
    };
    version = "7.0.4";
  };
  addressable = {
    dependencies = [ "public_suffix" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1ypdmpdn20hxp5vwxz3zc04r5xcwqc25qszdlg41h8ghdqbllwmw";
      type = "gem";
    };
    version = "2.8.1";
  };
  amazing_print = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "00791xdcrrz7fp0nc3pbwfnqcs0spkn7vwyddjw46jmb7a8d7rmm";
      type = "gem";
    };
    version = "1.4.0";
  };
  bridgetown = {
    dependencies = [ "bridgetown-builder" "bridgetown-core" "bridgetown-paginate" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0kn9yfjbk41hgcqprd73zzhrvkym6h3i55y8lw51l4vjnai4hsq2";
      type = "gem";
    };
    version = "1.1.0";
  };
  bridgetown-builder = {
    dependencies = [ "bridgetown-core" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0glkw421b8dsa9xq5r9fbk19s9h9m691v87vsy734q3v7xpgd365";
      type = "gem";
    };
    version = "1.1.0";
  };
  bridgetown-core = {
    dependencies = [ "activemodel" "activesupport" "addressable" "amazing_print" "colorator" "erubi" "faraday" "faraday_middleware" "hash_with_dot_access" "i18n" "kramdown" "kramdown-parser-gfm" "liquid" "listen" "rake" "roda" "rouge" "serbea" "terminal-table" "thor" "tilt" "webrick" "zeitwerk" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "04rcamzx57gk4j0lly291hplcrvdrafmlm4g4vjmvhmdys5bqvxm";
      type = "gem";
    };
    version = "1.1.0";
  };
  bridgetown-paginate = {
    dependencies = [ "bridgetown-core" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "17634isazdzdw286gpqsas6cmkkyg0scpz7a8cv4kmz9i6i37mb4";
      type = "gem";
    };
    version = "1.1.0";
  };
  colorator = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0f7wvpam948cglrciyqd798gdc6z3cfijciavd0dfixgaypmvy72";
      type = "gem";
    };
    version = "1.1.0";
  };
  concurrent-ruby = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0s4fpn3mqiizpmpy2a24k4v365pv75y50292r8ajrv4i1p5b2k14";
      type = "gem";
    };
    version = "1.1.10";
  };
  erubi = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "11bz1v1cxabm8672gabrw542zyg51dizlcvdck6vvwzagxbjv9zx";
      type = "gem";
    };
    version = "1.11.0";
  };
  faraday = {
    dependencies = [ "faraday-em_http" "faraday-em_synchrony" "faraday-excon" "faraday-httpclient" "faraday-multipart" "faraday-net_http" "faraday-net_http_persistent" "faraday-patron" "faraday-rack" "faraday-retry" "ruby2_keywords" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1d5ipsv069dhgv9zhxgj8pz4j52yhgvfm01aq881yz7qgjd7ilxp";
      type = "gem";
    };
    version = "1.10.2";
  };
  faraday-em_http = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "12cnqpbak4vhikrh2cdn94assh3yxza8rq2p9w2j34bqg5q4qgbs";
      type = "gem";
    };
    version = "1.0.0";
  };
  faraday-em_synchrony = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1vgrbhkp83sngv6k4mii9f2s9v5lmp693hylfxp2ssfc60fas3a6";
      type = "gem";
    };
    version = "1.0.0";
  };
  faraday-excon = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0h09wkb0k0bhm6dqsd47ac601qiaah8qdzjh8gvxfd376x1chmdh";
      type = "gem";
    };
    version = "1.1.0";
  };
  faraday-httpclient = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0fyk0jd3ks7fdn8nv3spnwjpzx2lmxmg2gh4inz3by1zjzqg33sc";
      type = "gem";
    };
    version = "1.0.1";
  };
  faraday-multipart = {
    dependencies = [ "multipart-post" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "09871c4hd7s5ws1wl4gs7js1k2wlby6v947m2bbzg43pnld044lh";
      type = "gem";
    };
    version = "1.0.4";
  };
  faraday-net_http = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1fi8sda5hc54v1w3mqfl5yz09nhx35kglyx72w7b8xxvdr0cwi9j";
      type = "gem";
    };
    version = "1.0.1";
  };
  faraday-net_http_persistent = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0dc36ih95qw3rlccffcb0vgxjhmipsvxhn6cw71l7ffs0f7vq30b";
      type = "gem";
    };
    version = "1.2.0";
  };
  faraday-patron = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "19wgsgfq0xkski1g7m96snv39la3zxz6x7nbdgiwhg5v82rxfb6w";
      type = "gem";
    };
    version = "1.0.0";
  };
  faraday-rack = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1h184g4vqql5jv9s9im6igy00jp6mrah2h14py6mpf9bkabfqq7g";
      type = "gem";
    };
    version = "1.0.0";
  };
  faraday-retry = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "153i967yrwnswqgvnnajgwp981k9p50ys1h80yz3q94rygs59ldd";
      type = "gem";
    };
    version = "1.0.3";
  };
  faraday_middleware = {
    dependencies = [ "faraday" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1bw8mfh4yin2xk7138rg3fhb2p5g2dlmdma88k82psah9mbmvlfy";
      type = "gem";
    };
    version = "1.2.0";
  };
  ffi = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1862ydmclzy1a0cjbvm8dz7847d9rch495ib0zb64y84d3xd4bkg";
      type = "gem";
    };
    version = "1.15.5";
  };
  hash_with_dot_access = {
    dependencies = [ "activesupport" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "04wkh259pimyhnk23rlrmvin0zlvbilrr59yfrj2ws7ik0k5mmbr";
      type = "gem";
    };
    version = "1.2.0";
  };
  i18n = {
    dependencies = [ "concurrent-ruby" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1vdcchz7jli1p0gnc669a7bj3q1fv09y9ppf0y3k0vb1jwdwrqwi";
      type = "gem";
    };
    version = "1.12.0";
  };
  kramdown = {
    dependencies = [ "rexml" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1ic14hdcqxn821dvzki99zhmcy130yhv5fqfffkcf87asv5mnbmn";
      type = "gem";
    };
    version = "2.4.0";
  };
  kramdown-parser-gfm = {
    dependencies = [ "kramdown" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0a8pb3v951f4x7h968rqfsa19c8arz21zw1vaj42jza22rap8fgv";
      type = "gem";
    };
    version = "1.1.0";
  };
  liquid = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0h0d0ghdf01lkv4x0mzp6zdkrnj7gsfq3widkhyni26bf6648qp3";
      type = "gem";
    };
    version = "5.4.0";
  };
  listen = {
    dependencies = [ "rb-fsevent" "rb-inotify" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0agybr37wpjv3xy4ipcmsvsibgdgphzrwbvcj4vfiykpmakwm01v";
      type = "gem";
    };
    version = "3.7.1";
  };
  minitest = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0516ypqlx0mlcfn5xh7qppxqc3xndn1fnadxawa8wld5dkcimy30";
      type = "gem";
    };
    version = "5.16.3";
  };
  multipart-post = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1n0kvnrcrjn31jb97kcx3wj1f5kkjza7yygfq8rxzf3i57g7jaa6";
      type = "gem";
    };
    version = "2.2.3";
  };
  public_suffix = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0hz0bx2qs2pwb0bwazzsah03ilpf3aai8b7lk7s35jsfzwbkjq35";
      type = "gem";
    };
    version = "5.0.1";
  };
  rack = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0844h5gbx2h1vmzh10v6b011cgly5p4f0gnyhs7y00c3isif24vk";
      type = "gem";
    };
    version = "3.0.2";
  };
  rake = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "15whn7p9nrkxangbs9hh75q585yfn66lv0v2mhj6q6dl6x8bzr2w";
      type = "gem";
    };
    version = "13.0.6";
  };
  rb-fsevent = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1zmf31rnpm8553lqwibvv3kkx0v7majm1f341xbxc0bk5sbhp423";
      type = "gem";
    };
    version = "0.11.2";
  };
  rb-inotify = {
    dependencies = [ "ffi" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1jm76h8f8hji38z3ggf4bzi8vps6p7sagxn3ab57qc0xyga64005";
      type = "gem";
    };
    version = "0.10.1";
  };
  rexml = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "08ximcyfjy94pm1rhcx04ny1vx2sk0x4y185gzn86yfsbzwkng53";
      type = "gem";
    };
    version = "3.2.5";
  };
  roda = {
    dependencies = [ "rack" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "17425v3vw72viln8g41aid1f2s1d4ac32ifv6d1r6vjkkvbfj851";
      type = "gem";
    };
    version = "3.63.0";
  };
  rouge = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1dnfkrk8xx2m8r3r9m2p5xcq57viznyc09k7r3i4jbm758i57lx3";
      type = "gem";
    };
    version = "3.30.0";
  };
  ruby2_keywords = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1vz322p8n39hz3b4a9gkmz9y7a5jaz41zrm2ywf31dvkqm03glgz";
      type = "gem";
    };
    version = "0.0.5";
  };
  serbea = {
    dependencies = [ "activesupport" "erubi" "tilt" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "016sihjq3j8ywi0lm82g9rf1phly8skdbw761y5xqkdnc410zhyr";
      type = "gem";
    };
    version = "1.0.1";
  };
  terminal-table = {
    dependencies = [ "unicode-display_width" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1512cngw35hsmhvw4c05rscihc59mnj09m249sm9p3pik831ydqk";
      type = "gem";
    };
    version = "1.8.0";
  };
  thor = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0inl77jh4ia03jw3iqm5ipr76ghal3hyjrd6r8zqsswwvi9j2xdi";
      type = "gem";
    };
    version = "1.2.1";
  };
  tilt = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "186nfbcsk0l4l86gvng1fw6jq6p6s7rc0caxr23b3pnbfb20y63v";
      type = "gem";
    };
    version = "2.0.11";
  };
  tzinfo = {
    dependencies = [ "concurrent-ruby" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0rx114mpqnw2k4h98vc0rs0x0bmf0img84yh8mkkjkal07cjydf5";
      type = "gem";
    };
    version = "2.0.5";
  };
  unicode-display_width = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1204c1jx2g89pc25qk5150mk7j5k90692i7ihgfzqnad6qni74h2";
      type = "gem";
    };
    version = "1.8.0";
  };
  webrick = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1d4cvgmxhfczxiq5fr534lmizkhigd15bsx5719r5ds7k7ivisc7";
      type = "gem";
    };
    version = "1.7.0";
  };
  zeitwerk = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "09pqhdi6q4sqv0p1gnjpbcy4az0yv8hrpykjngdgh9qiqd87nfdv";
      type = "gem";
    };
    version = "2.6.6";
  };
}
