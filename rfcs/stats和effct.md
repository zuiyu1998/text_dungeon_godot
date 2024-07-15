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

将 effect 所能够改变的数据抽象成一个数据结构 StatsState，它由两部分组成，一个是需要存储的数据 StorageStatsData，一个是常驻内存的数据 MemoryStatsData。如下:

```
class_name StatsState
extends RefCounted

var storage : StorageStatsData
var memory : MemoryStatsData

```

effect 的抽象如下:

```gds
class_name StatsEffct
extends RefCounted

func update(state: StatsState) -> void:
	pass

```

Stats 需要保存一份原始的 StorageStatsData，因此 Stats 的定义如下:

```gds
var _effects : Array[StatsEffect] = []

var _storage_data := StorageStatsData.new()

var storage := StorageStatsData.new()
var memory := MemoryStatsData.new()
```
