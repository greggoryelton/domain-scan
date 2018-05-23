mkdir -p lambda_functions
mkdir -p env
wget -q -O - https://api.github.com/repos/dhs-ncats/lambda_functions/tarball | tar xz --strip-components=1 -C lambda_functions
cd lambda_functions
docker-compose build
docker-compose up
cp *.zip ../envs
cd ..
rm -rf lambda_functions
