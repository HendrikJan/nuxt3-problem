export default defineEventHandler((event) => {
    console.log('📡 ' + event.req.url)
    console.dir(event.req.headers)
})