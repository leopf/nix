{ pkgs }:

let
  python3 = pkgs.python313;
in
python3.pkgs.buildPythonPackage rec {
  pname = "rxxxt";
  version = "0.4.3";

  format = "pyproject";

  src = pkgs.fetchFromGitHub {
    owner = "leopf";
    repo = "rxxxt";
    rev = version;
    hash = "sha256-5JULIbl8x/ZVV0wdJ/H7UQ1T9ydVOQr9brUy3jLGt3M=";
  };

  nativeBuildInputs = [ python3.pkgs.setuptools ];

  propagatedBuildInputs = [ python3.pkgs.pydantic ];

  pythonImportsCheck = [ "rxxxt" ];
}
