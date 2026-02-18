FROM ghost:5-alpine

ENV NODE_ENV=production

EXPOSE 2368

CMD ["sh", "-c", "if [ -z \"$url\" ] && [ -n \"$RAILWAY_PUBLIC_DOMAIN\" ]; then export url=\"https://$RAILWAY_PUBLIC_DOMAIN\"; fi && node current/index.js"]
