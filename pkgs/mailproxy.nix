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
    rev = "fa707237a43f79d79d5fbbbab85e6fafb58b0f22";
    hash = "sha256-HtXFRllwxGjEqfw/y/9hyusZ/wBz5jxx2r+1bF1bIfs=";
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
