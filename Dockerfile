FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN npm ci --ignore-scripts --omit-dev
COPY . .
RUN npm run build
RUN npm link
COPY scripts/notion-openapi.json /usr/local/scripts/
ENV OPENAPI_MCP_HEADERS="{}"
ENTRYPOINT ["notion-mcp-server"]
