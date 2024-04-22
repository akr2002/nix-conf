{inputs, ...}: {
  master-packages = final: _prev: {
    masterPkgs = import inputs.master {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
