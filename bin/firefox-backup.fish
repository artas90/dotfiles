#!/usr/bin/env fish

if test ! -f prefs.js
  echo "not inside firefox profile dir"
  exit
end

mkdir -p _backup

for f in (ls | grep '\.db'); cp $f _backup; end

for f in (ls | grep '\.sqlite'); cp $f _backup; end
cd _backup
for f in (ls | grep '\.sqlite$'); echo "VACUUM;" | sqlite3 $f; end
cd ..

cp ./prefs.js _backup
cp ./*.json _backup
cp -rf bookmarkbackups _backup
cp -rf sessions _backup

cp -rf browser-extension-data _backup
cp -rf extensions _backup
cp -rf extension-data _backup
cp -rf sessions _backup

mv _backup FirefoxProfile
tar -czvf _FirefoxProfile.tgz FirefoxProfile
mv FirefoxProfile _backup

echo
echo "* _FirefoxProfile.tgz created *"
