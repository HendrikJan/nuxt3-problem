export default defineEventHandler((event) => {
    console.log(' ')
    console.log('> Headers for: ' + event.req.url)
    let keys = Object.keys(event.req.headers)
    keys.sort()
    keys.forEach((key) => {
        console.log('>     ' + key + ': ' + JSON.stringify(event.req.headers[key]));
    })
})