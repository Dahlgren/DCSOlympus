call git clean -fx

cd src
msbuild olympus.sln /t:Rebuild /p:Configuration=Release
cd ..

cd configurator
msbuild configurator.sln /t:Rebuild /p:Configuration=Release
cd ..

cd client
rmdir /s /q "hgt"
call npm install
call npm run emit-declarations
call npm run build-release

cd "plugins\controltips"
call npm install
call npm run build-release
call npm prune --production
cd "..\.."

cd "plugins\databasemanager"
call npm install
call npm run build-release
call npm prune --production
cd "..\.."

call npm prune --production
cd ..
