setup-python-environment:
    #!/usr/bin/env bash
    pipx install pip-tools
    python -m venv .venv_try-testing-goat
    source .venv_try-testing-goat/bin/activate
    python -m pip install --upgrade pip
    pip-compile requirements-dev.in
    pip install -r requirements-dev.txt
    ipython kernel install --name ".venv_try-testing-goat" --user
    echo  
    echo source .venv_try-testing-goat/bin/activate
    echo

gecko:
    export GECKO_DRIVER_VERSION='v0.32.0'
    wget https://github.com/mozilla/geckodriver/releases/download/$GECKO_DRIVER_VERSION/geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz
    tar -xvzf geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz
    rm geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz
    chmod +x geckodriver
    sudo cp geckodriver /usr/local/bin/
