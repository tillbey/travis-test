# if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
#   pyinstaller --name=Travistest \
#   --clean --noconfirm --windowed --onefile \
#   travistest/main.py
# fi

pyinstaller --name=Travistest  --clean --noconfirm --windowed --onefile travistest/main.py

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  cd dist
  zip -r "Travistest-$TRAVIS_TAG-$TRAVIS_OS_NAME.zip" "Travistest.app"
fi

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
  cd dist
  zip "Travistest-$TRAVIS_TAG-$TRAVIS_OS_NAME.zip" "Travistest"
fi
