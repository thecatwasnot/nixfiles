{
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
  dry-auto_inject = {
    dependencies = [ "dry-core" "zeitwerk" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0qv2n1i50ncndygibl5gp3gl2wbsyh0g34fdm5lddyfwj6d3gv5q";
      type = "gem";
    };
    version = "1.0.0";
  };
  dry-cli = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1w39jms4bsggxvl23cxanhccv1ngb6nqxsqhi784v5bjz1lx3si8";
      type = "gem";
    };
    version = "1.0.0";
  };
  dry-configurable = {
    dependencies = [ "dry-core" "zeitwerk" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1wasxg19zp4aabxwvz1129x91qbj76lsa97w9v2qn3jwycpnz1sc";
      type = "gem";
    };
    version = "1.0.1";
  };
  dry-core = {
    dependencies = [ "concurrent-ruby" "zeitwerk" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "01gks2hrp7nl3pzb487azvd25dlbrc40d5cpk4n0szwnf2c0k4ks";
      type = "gem";
    };
    version = "1.0.0";
  };
  dry-events = {
    dependencies = [ "concurrent-ruby" "dry-core" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1n04jl3f4hdbanrs71q7ln2a47qqapbnikry6w5hj79b4ijy5xh2";
      type = "gem";
    };
    version = "1.0.1";
  };
  dry-files = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1bglbnn6wpw8pwicigl83nm1y4xyagb2kx8d03wq8ly1dlpc3j7y";
      type = "gem";
    };
    version = "1.0.1";
  };
  dry-inflector = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "09hnvna3lg2x36li63988kv664d0zvy7y0z33803yvrdr9hj7lka";
      type = "gem";
    };
    version = "1.0.0";
  };
  dry-logger = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0b27hc6964hhys4a49xrsircp4lpvhb3z1wlbr6172qmkjakbh67";
      type = "gem";
    };
    version = "1.0.3";
  };
  dry-monitor = {
    dependencies = [ "dry-configurable" "dry-core" "dry-events" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "02d3wzwxa5401h0k24aabaf6kz6jsyb99khbmbhzsjxihlgyvj2a";
      type = "gem";
    };
    version = "1.0.1";
  };
  dry-system = {
    dependencies = [ "dry-auto_inject" "dry-configurable" "dry-core" "dry-inflector" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0jxywh0g0v6q8a0cx0a7dl9yyyyypprirfa8hwi6jz5rcpjnc0a9";
      type = "gem";
    };
    version = "1.0.1";
  };
  dry-transformer = {
    dependencies = [ "zeitwerk" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0xixyxvfp6m6snfgbc3x2p5457y198if6prin7mlgqz8xj262aka";
      type = "gem";
    };
    version = "1.0.1";
  };
  hanami = {
    dependencies = [ "dry-configurable" "dry-core" "dry-inflector" "dry-logger" "dry-monitor" "dry-system" "hanami-cli" "hanami-utils" "zeitwerk" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0xymdvnpxb5f2vwla3vy6kl15kl5g3dimk2gbzpsgls0iac03700";
      type = "gem";
    };
    version = "2.0.2";
  };
  hanami-cli = {
    dependencies = [ "dry-cli" "dry-files" "dry-inflector" "rake" "zeitwerk" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1v1123msqlixx3s3dm27412hl5sz6phbhv9cjj4yfgyr81pzmgsq";
      type = "gem";
    };
    version = "2.0.2";
  };
  hanami-utils = {
    dependencies = [ "concurrent-ruby" "dry-core" "dry-transformer" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1vbl79k9khjh37n2zvj5w06c54c6kfq5hsgwh5hqhd5r8xnswpy9";
      type = "gem";
    };
    version = "2.0.2";
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
