FROM ghost:5-alpine

ENV NODE_ENV=production

COPY content/themes/cachocpersonne /tmp/ghost-themes/cachocpersonne

EXPOSE 2368

CMD ["sh", "-c", "mkdir -p /var/lib/ghost/content/themes && rm -rf /var/lib/ghost/content/themes/cachocpersonne && cp -r /tmp/ghost-themes/cachocpersonne /var/lib/ghost/content/themes/cachocpersonne && if [ -z \"$url\" ]; then if [ -n \"$RAILWAY_PUBLIC_DOMAIN\" ]; then export url=\"https://$RAILWAY_PUBLIC_DOMAIN\"; else export url=\"http://localhost:2368\"; fi; fi && node current/index.js"]
