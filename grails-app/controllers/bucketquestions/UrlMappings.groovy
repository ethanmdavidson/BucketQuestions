package bucketquestions

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/bucket/$codeword"(controller: "bucket", action: "index")
        "/bucket/$codeword/addQuestion"(controller: "bucket", action: "addQuestion")
        "/bucket/$codeword/getQuestion"(controller: "bucket", action: "getQuestion")

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
