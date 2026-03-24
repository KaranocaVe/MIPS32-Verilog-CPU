# MIPS32 Verilog CPU

这个目录包含两个基于 Verilog 编写的 MIPS32 CPU Vivado 工程，分别实现了单周期 CPU 和五级流水线 CPU。

## 项目内容

| 目录 | 类型 | 顶层模块 | 仿真文件 | 说明 |
| --- | --- | --- | --- | --- |
| `MIPS32/` | 单周期 CPU | `CPU` | `TestBench_MIPS32SINGLE` | 封装了 PC、寄存器堆、ALU、指令存储器和数据存储器 |
| `MIPS32ASSLINE/` | 五级流水线 CPU | `PiplineCPU` | `TestBench_MIPS32ASSLINE` | 包含 IF / ID / EX / MEM / WB 五级流水和级间寄存器 |

说明：

- `MIPS32ASSLINE` 为原工程目录名，本文档按“流水线工程”理解。
- 两个工程都使用 Vivado 工程文件 `*.xpr` 打开。
- 指令 ROM 直接写在各自工程的 `INSTMEM.v` 中，适合课程实验和行为仿真。

## 支持指令

从两个工程中的 `CONUNIT.v` 可见，当前实现覆盖以下基础指令：

- R 型：`add`、`sub`、`and`、`or`
- I / J 型：`addi`、`andi`、`ori`、`lw`、`sw`、`beq`、`bne`、`j`

## 目录结构

```text
mips32/
|-- MIPS32/
|   |-- MIPS32.xpr
|   `-- MIPS32.srcs/
|       |-- sources_1/imports/new/    # 单周期核心模块
|       `-- sim_1/imports/new/        # 单周期 testbench
|-- MIPS32ASSLINE/
|   |-- MIPS32ASSLINE.xpr
|   `-- MIPS32ASSLINE.srcs/
|       |-- sources_1/new/            # 流水线阶段模块与级间寄存器
|       |-- sources_1/imports/new/    # 复用基础功能模块
|       `-- sim_1/new/                # 流水线 testbench
`-- .gitignore
```

## 关键模块

### 单周期工程 `MIPS32/`

- `CPU.v`：单周期 CPU 顶层封装
- `PC.v`：程序计数器
- `REGFILE.v`：寄存器堆
- `ALU.v`：算术逻辑单元
- `CONUNIT.v`：控制器
- `INSTMEM.v`：指令 ROM
- `DATAMEM.v`：数据存储器

单周期工程下还包含多个部件级 testbench，例如 `TestBench_ALU.v`、`TestBench_REGFILE.v`、`TestBench_PC.v` 等。

### 流水线工程 `MIPS32ASSLINE/`

- `PiplineCPU.v`：五级流水线 CPU 顶层
- `IF_.v`、`ID_.v`、`EX_.v`、`MEM_.v`、`WB_.v`：五个流水级
- `IF_ID.v`、`ID_EX.v`、`EX_MEM.v`、`MEM_WB.v`：级间寄存器
- `CONUNIT.v`：控制、前递和停顿相关逻辑

从源码结构来看，流水线工程已经包含：

- 数据前递信号 `FwdA` / `FwdB`
- `lw` 相关停顿控制
- 分支 / 跳转相关控制依赖处理

## 如何打开工程

### 单周期工程

1. 启动 Vivado。
2. 打开 `MIPS32/MIPS32.xpr`。
3. 在 Flow Navigator 中选择 `Run Simulation` -> `Run Behavioral Simulation`。
4. 如需手动设置仿真顶层，选择 `TestBench_MIPS32SINGLE`。

### 流水线工程

1. 启动 Vivado。
2. 打开 `MIPS32ASSLINE/MIPS32ASSLINE.xpr`。
3. 选择 `Run Simulation` -> `Run Behavioral Simulation`。
4. 如需手动设置仿真顶层，选择 `TestBench_MIPS32ASSLINE`。

## 如何修改测试程序

两个工程的测试指令都直接写在各自的 `INSTMEM.v` 中：

- 单周期工程：`MIPS32/MIPS32.srcs/sources_1/imports/new/INSTMEM.v`
- 流水线工程：`MIPS32ASSLINE/MIPS32ASSLINE.srcs/sources_1/imports/new/INSTMEM.v`

修改这些 ROM 初始化内容后，重新运行行为仿真即可观察执行结