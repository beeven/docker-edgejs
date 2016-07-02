FROM ubuntu:16.04
ADD . /myapp
WORKDIR /myapp
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
    apt-get update && \
    apt-get install curl libunwind8 gettext mono-complete && \
    curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?LinkID=809130 && \
    mkdir -p /opt/dotnet && tar zxf dotnet.tar.gz -C /opt/dotnet && \
    ln -s /opt/dotnet/dotnet /usr/local/bin
    
CMD bash
