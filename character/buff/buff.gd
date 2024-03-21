class_name Buffer

# 唯一id
var buffer_id: int
# 描述
var buffer_description: String
# 名称
var buffer_name: String

func update_charactor_instance(_instance: CharacterInstance):
    pass

func _init(id: int):
    var model = Global.buffer_db.get_id(id)

    buffer_id = id
    buffer_description = model.description
    buffer_name = model.buffer_name