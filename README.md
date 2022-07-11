The issue can be found here: https://github.com/vitejs/vite/issues/8941 (closed)

# Reproduce the error

1. Start Docker-compose with this command: `docker compose up`
2. Log in to the my-nodejs Docker container: `docker exec -it my-nodejs bash`
3. Now inside the my-nodejs container start Nuxt: `npm run dev`

Now go in your browser to `http://localhost:7777/`

4. See that the default Nuxt3 page does not load (set `ssr: true` and see the default Nuxt3 page)

Open your developer tools in the browser and reload

5. See this error (in Chrome Console):
```
Failed to load module script: Expected a JavaScript module script but the server responded with a MIME type of "text/html". Strict MIME type checking is enforced for module scripts per HTML spec.
```

6. Also see  (in Chrome network tab) that the contents of `http://localhost:7777/_nuxt/entry.mjs` does not contain javascript but contains this:
```html
<!DOCTYPE html>
<html >

<head >
  
</head>

<body >
  <div id="__nuxt"></div><script>window.__NUXT__={serverRendered:false,config:{public:{},app:{baseURL:"\u002F",buildAssetsDir:"\u002F_nuxt\u002F",cdnURL:""}}}</script><script type="module" src="/_nuxt/@vite/client"></script><script type="module" src="/_nuxt/entry.mjs"></script>
</body>

</html>
```
