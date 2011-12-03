class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
 
		"/property"(controller: "property", action: "list")
		"/"(view:"/index")
		"500"(view:'/error')
	}
}
