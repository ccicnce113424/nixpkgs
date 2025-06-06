{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  pythonOlder,
  pytz,
}:

buildPythonPackage rec {
  pname = "pyclimacell";
  version = "0.18.2";
  format = "setuptools";
  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "raman325";
    repo = "pyclimacell";
    rev = "v${version}";
    hash = "sha256-jWHjnebg4Aar48gid7bB7XYXOQtSqbmVmASsZd0YoPc=";
  };

  propagatedBuildInputs = [
    aiohttp
    pytz
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "pyclimacell" ];

  meta = with lib; {
    description = "Python client for ClimaCell API";
    homepage = "https://github.com/raman325/pyclimacell";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
