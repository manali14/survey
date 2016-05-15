package survey

class ApplicationFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                log.info("Params: ${params}")
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
