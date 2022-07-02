# Reproduce the error

1. Start Docker-compose with this command: `docker compose up`
2. Log in to the my-nodejs Docker container: `docker exec -it my-nodejs bash`
3. Now inside the my-nodejs container start Nuxt: `npm run dev`

Now go in your browser to `http://localhost:7777/`

4. See that the default Nuxt3 page is loaded

Open your developer tools in the browser and reload

5. See this error (in Chrome Console):
```
Failed to load module script: Expected a JavaScript module script but the server responded with a MIME type of "text/html". Strict MIME type checking is enforced for module scripts per HTML spec.
```

6. Also see  (in Chrome network tab) that the contents of `http://localhost:7777/_nuxt/entry.mjs` does not contain javascript but contains this:
```html
<!DOCTYPE html>
<html  data-head-attrs="">

<head >
  <title>Welcome to Nuxt 3!</title>...
</head>

<body  data-head-attrs="">...</body>

</html>
```
