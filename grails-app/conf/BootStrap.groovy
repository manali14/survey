class BootStrap {
    def bootstrapService

    def init = { servletContext ->
        bootstrapService.initData()
    }
    def destroy = {
    }
}
