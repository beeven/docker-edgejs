FROM nodesource/jessie:4.2.3
ADD . /myapp
WORKDIR /myapp
# RUN sed -i 's/archive.ubuntu/cn.archive.ubuntu/' /etc/apt/sources.list && \
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
    echo "deb http://download.mono-project.com/repo/debian wheezy-libjpeg62-compat main" | tee -a /etc/apt/sources.list.d/mono-xamarin.list && \
    apt-get -y install curl g++ pkg-config libgdiplus libunwind8 libssl-dev make mono-complete gettext libssl-dev libcurl4-openssl-dev zlib1g libicu-dev uuid-dev unzip && \
    npm install -g node-gyp mocha && \
    node-gyp install && \
    npm install edge

CMD bash
