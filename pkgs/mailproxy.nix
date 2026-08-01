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
    rev = "35bb2c2f8ec7489526bd2257a53b72135d691bcc";
    hash = "sha256-z+NJRI7oS73ttVaidhE6HfiXx4PCQYFFq2zDJRpuKuA=";
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
