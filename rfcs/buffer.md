# 功能

- buffer
- 2024-7-15
- zuiyu1998

## 概述

rpg 系统常见的设计，它可以更改人物的多个状态。通常它是可被玩家所认知的，有名称，某些 buffer 还有着生效时长。

## 指南级别的解释

buff 的要素如下:

- id 唯一
- name 名称
- description 描述
- text_description 文本描述
- effects buff 所能造成的影响
- 生效时长

## 参考级别解释

定义一个 BuffModel 对象保存 buff 的不变的数据，定义如下:

```gds
class_name BuffModel
extends RefCounted

var id: int = -1
var name: String
var description: String
var text_description: String
# 毫秒
var duration: int = 0
```

定义一个 BuffEffct 表示 buff 要进行的操作。一个 buff 只有两个声明周期参数，一个是添加的时机一个是销毁的时机。它的定义如下:

```
extends RefCounted
class_name BuffEffct

var effects: Array[StatsEffect] = []


func on_enter(stats: Stats) -> void:
	print("[buff effect enterd]")
	stats.add_effects(effects)

func on_remove(stats: Stats) -> void:
	print("[buff effect removed]")
	stats.remove_effects(effects)

```

effects 表示实际对 stats 进行的操作。
Buff 的设计如下:

```gds
class_name Buff
extends Node

@onready var timer: Timer = $Timer

var stats: Stats

var model: BuffModel = BuffModel.new()

var effect: BuffEffct

func _ready() -> void:
	if model.duration > 0:
		timer.start(model.duration / 1000.0)
		timer.timeout.connect(on_remove)

	effect.on_enter(stats)

func on_remove():
	effect.on_remove(stats)

```

注意这里的 buff 是一个场景，因为 buff 要支持有时效的设计。

## 未解决的问题

- BufferModel 的 csv 驱动
