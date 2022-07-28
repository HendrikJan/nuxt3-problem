# Reproduce the error

1. Start Docker-compose with this command: `docker compose up`
2. Log in to the mynodejs Docker container: `docker compose exec mynodejs bash`
3. Now inside the mynodejs container build Nuxt: `npm run build`

See that you get this error:
```error
Rollup error: EACCES: permission denied, stat '/root/.node_modules/file:/var/app/node_modules/unenv/runtime/mock'
```

4. Inside the mynodejs container run: `npm run start`

See that the server does not start and this error is shown:
```error
Nuxt CLI v3.0.0-rc.6                                                         07:43:59

 ERROR  Cannot find nitro.json. Did you run nuxi build first? Search path:   07:43:59
 [
  '/var/app/.output/nitro.json',
  '/var/app/nitro.json'
]
```

5. Run `build` and `start` outside Docker and see that there is no problem.