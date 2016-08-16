FROM nodesource/trusty:6.3.0
ADD . /myapp
WORKDIR /myapp
# RUN sed -i 's/archive.ubuntu/cn.archive.ubuntu/' /etc/apt/sources.list && \
RUN apt-get update && \
    apt-get install -y wget && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
#    wget -qO- https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y build-essential g++ pkg-config libgdiplus libunwind8 libssl-dev make mono-complete gettext libssl-dev libcurl4-openssl-dev zlib1g libicu-dev uuid-dev unzip nodejs nano && \
    npm install -g node-gyp mocha && \
    node-gyp install && \
    npm install edge

CMD bash
