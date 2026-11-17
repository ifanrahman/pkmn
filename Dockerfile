
FROM maven:3.10-eclipse-temurin-25

WORKDIR /app

# Install JavaFX's Linux dependencies and a virtual display
RUN apt-get update && apt-get install -y --no-install-recommends \
    xvfb \
    libx11-6 \
    libgtk-3-0 \
    libxtst6 \
    libxrender1 \
    libxi6 \
    libxext6 \
    libxrandr2 \
    libasound2t64 \    
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN mvn -B clean package
RUN mkdir -p /app/saves

ENV TERM=xterm-256color
ENV HOME=/tmp

ENTRYPOINT []

CMD ["xvfb-run", "-a", "-s", "-screen 0 1280x1024x24", "java", "--enable-native-access=ALL-UNNAMED", "-Dprism.order=sw", "-jar", "target/pokemon_tbje-1.0.jar"]
