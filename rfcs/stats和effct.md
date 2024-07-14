# 功能

- stats 和 effect
- 2024-7-14
- zuiyu1998

## 概述

stats 一个人物角色所有数据的抽象。
effect 表示对人物数据改变，它是无状态的且只能改变一部分。

## 参考级别解释

stats 的定义如下:

```gds
class_name Stats
extends Node

```

effect 所能够改变的数据抽象如下:

```
class_name StatsState
extends RefCounted

```

effect 的抽象如下:

```gds
class_name StatsEffct
extends RefCounted

func update(state: StatsState) -> void:
	pass

```

stats 需要两个工具函数，一个是生成 StatsState，一个是合并 StatsState 的数据。定义如下:

```gds
func get_state() -> StatsState:
	return StatsState.new()


func merge_state(state: StatsState) -> void:
	pass
```
