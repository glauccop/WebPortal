# Servindo arquivo estático via NGINX
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
# Opcional: página de saúde
RUN echo "ok" > /usr/share/nginx/html/healthz
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost/healthz || exit 1
