{ pkgs }:

let
  python3 = pkgs.python313;
in
python3.pkgs.buildPythonPackage rec {
  pname = "mailproxy";
  version = "0.1.0";

  format = "pyproject";

  src = pkgs.fetchFromGitHub {
    owner = "leopf";
    repo = "mailproxy";
    rev = "82e3ac1a21c8507f6f146e247c1769aa68d1f949";
    hash = "sha256-QrbMW0ZPYiTLrqSwxnGsioaVVUMiZgDPnWjhvP+GEHk=";
  };

  nativeBuildInputs = [ python3.pkgs.setuptools ];

  # zero runtime dependencies (Python 3.13 stdlib only)
  propagatedBuildInputs = [ ];

  pythonImportsCheck = [ "mailproxy" ];

  meta = with pkgs.lib; {
    description = "An IMAP and SMTP proxy to get back control of your E-Mails.";
    homepage = "https://github.com/leopf/mailproxy";
    license = licenses.mit;
    mainProgram = "mailproxy";
  };
}
