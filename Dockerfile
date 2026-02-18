FROM ghost:5-alpine

ENV NODE_ENV=production
ENV server__host=0.0.0.0
ENV server__port=2368

COPY content/themes/cachocpersonne /tmp/ghost-themes/cachocpersonne

EXPOSE 2368

CMD ["sh", "-c", "mkdir -p /var/lib/ghost/content/themes /var/lib/ghost/content/logs && rm -rf /var/lib/ghost/content/themes/cachocpersonne && cp -r /tmp/ghost-themes/cachocpersonne /var/lib/ghost/content/themes/cachocpersonne && [ -d /var/lib/ghost/content/themes/source ] || cp -r /var/lib/ghost/current/content/themes/source /var/lib/ghost/content/themes/source; if [ -z \"$url\" ]; then if [ -n \"$RAILWAY_PUBLIC_DOMAIN\" ]; then export url=\"https://$RAILWAY_PUBLIC_DOMAIN\"; else export url=\"http://localhost:2368\"; fi; fi && node current/index.js"]
