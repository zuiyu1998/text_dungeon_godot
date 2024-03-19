class_name CloneUtil

static func clone_dictionary(dic: Dictionary) -> Dictionary:
    var tmp = {}

    for key in dic.keys():
        var value = dic[key]
        if value.has_method("clone"):
            tmp[key] = value.clone()
        else:
            tmp[key] = value

    return tmp