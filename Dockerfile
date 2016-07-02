FROM ubuntu:16.04
ADD . /myapp
WORKDIR /myapp
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893 && \
    echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
    echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list && \
    apt-get update && \
    apt-get install -y mono-complete dotnet-dev-1.0.0-preview2-003121


CMD bash
