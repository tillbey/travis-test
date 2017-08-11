# if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
#   pyinstaller --name=Travistest \
#   --clean --noconfirm --windowed --onefile \
#   travistest/main.py
# fi

pyinstaller --name="Travistest-$TRAVIS_TAG-$TRAVIS_OS_NAME"  --clean --noconfirm --windowed --onefile travistest/main.py
