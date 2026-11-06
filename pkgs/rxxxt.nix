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
    rev = "c3f138af944572b9d2324a92933d2bd14b0ec24b";
    hash = "sha256-dZ2guVcIfu5gEVO5M2AHqX+/+43KPhLpwsoDkKjcCHo=";
  };

  nativeBuildInputs = [ python3.pkgs.setuptools ];

  propagatedBuildInputs = [ python3.pkgs.pydantic ];

  pythonImportsCheck = [ "rxxxt" ];
}
