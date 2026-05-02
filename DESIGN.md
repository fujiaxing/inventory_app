---
name: Industrial Efficiency Logic
colors:
  surface: '#f9f9ff'
  surface-dim: '#d8d9e3'
  surface-bright: '#f9f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f3fd'
  surface-container: '#ecedf7'
  surface-container-high: '#e6e8f2'
  surface-container-highest: '#e0e2ec'
  on-surface: '#191c23'
  on-surface-variant: '#414754'
  inverse-surface: '#2d3038'
  inverse-on-surface: '#eff0fa'
  outline: '#727785'
  outline-variant: '#c1c6d6'
  surface-tint: '#005bc0'
  primary: '#005bbf'
  on-primary: '#ffffff'
  primary-container: '#1a73e8'
  on-primary-container: '#ffffff'
  inverse-primary: '#adc7ff'
  secondary: '#5b5f64'
  on-secondary: '#ffffff'
  secondary-container: '#dde0e6'
  on-secondary-container: '#5f6368'
  tertiary: '#9e4300'
  on-tertiary: '#ffffff'
  tertiary-container: '#c55500'
  on-tertiary-container: '#0e0200'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d8e2ff'
  primary-fixed-dim: '#adc7ff'
  on-primary-fixed: '#001a41'
  on-primary-fixed-variant: '#004493'
  secondary-fixed: '#dfe3e8'
  secondary-fixed-dim: '#c3c7cc'
  on-secondary-fixed: '#181c20'
  on-secondary-fixed-variant: '#43474c'
  tertiary-fixed: '#ffdbcb'
  tertiary-fixed-dim: '#ffb691'
  on-tertiary-fixed: '#341100'
  on-tertiary-fixed-variant: '#783100'
  background: '#f9f9ff'
  on-background: '#191c23'
  surface-variant: '#e0e2ec'
typography:
  display-lg:
    fontFamily: Inter, system-ui
    fontSize: 30px
    fontWeight: '700'
    lineHeight: 38px
  headline-md:
    fontFamily: Inter, system-ui
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  title-sm:
    fontFamily: Inter, system-ui
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  body-base:
    fontFamily: Inter, system-ui
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-sm:
    fontFamily: Inter, system-ui
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 20px
  code-data:
    fontFamily: monospace
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 20px
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  base: 4px
  xs: 8px
  sm: 12px
  md: 16px
  lg: 24px
  xl: 32px
  margin-mobile: 16px
  gutter-mobile: 12px
---

## 品牌与风格
本设计系统的核心在于**效率、精准与可靠**。目标受众是仓库作业人员及物流管理人员，环境通常包含高对比度光照、快节奏操作以及对设备高频使用的场景。

设计风格采用 **现代企业 (Corporate Modern)** 与 **极简主义 (Minimalism)** 的融合。通过剥离多余的装饰，强化功能性视觉引导，确保用户在嘈杂、动态的工作环境中能够瞬间识别核心信息。整体界面呈现出一种工业化的秩序感，传达出严谨、专业且无差错的品牌形象。

## 颜色
本系统采用高辨识度的色彩体系，以满足工业环境下的视觉需求。

*   **主色 (Primary):** 深蓝色 (#1A73E8) 用于核心操作按钮、导航和关键状态，象征稳定与专业。
*   **辅助色 (Secondary):** 灰色 (#5F6368) 用于次要信息、图标占位及非活跃状态。
*   **功能色:** 绿色用于“入库成功”、“校验通过”；橙色用于“库存低”、“待处理”；红色用于“异常报错”、“缺货”。
*   **对比度:** 严格遵循 Web 内容无障碍指南 (WCAG) 的高对比度标准，背景以纯白和浅灰为主，确保文字在反光或低亮度环境下依然清晰易读。

## 字体
字体选用 **Inter**，其卓越的字距平衡和中性风格非常适合数据密集型的工业应用。

针对中文环境，系统默认回退至系统原生黑体（如 PingFang SC 或 Microsoft YaHei）。设计重点在于**字阶的清晰度**：
1.  **SKU与条码:** 使用等宽或加粗字体，确保数字和字母易于区分。
2.  **层级结构:** 通过字重（Weight）而非颜色的深浅来区分信息层级，以应对屏幕反光。
3.  **大尺寸交互:** 移动端操作按钮文字保持在 16px 以上，提升点击信心。

## 布局与间距
本系统采用 **流式网格 (Fluid Grid)** 模型，适配不同尺寸的移动设备。

*   **间距节奏:** 以 4px 为基础单位，所有组件间距均保持 4 的倍数，确保视觉上的严整性。
*   **安全区域:** 左右保留 16px 的全局边距。
*   **触控目标:** 所有可点击区域高度不低于 48px，间距不低于 8px，以兼容佩戴手套或单手操作的场景。
*   **信息密度:** 列表项采用紧凑但有明确分割线的布局，最大限度地在单屏内展示更多 SKU 信息。

## 深度与层级
为了保持“工业与干净”的视觉特征，本系统减少使用复杂的投影，转而使用**色调图层 (Tonal Layers)** 与 **低对比度轮廓 (Low-contrast Outlines)**。

1.  **基础层:** 使用浅灰色 (#F8F9FA) 作为画板背景。
2.  **卡片层:** 使用纯白背景配合 1px 的浅灰色边框 (#E0E0E0) 区分内容块。
3.  **悬浮层:** 仅在模态弹窗或紧急通知条上使用极轻微的弥散阴影（Blur: 8px, Opacity: 10%），以暗示其位于 UI 顶层。
4.  **状态交互:** 通过背景色的微弱加深（如 Hover/Pressed 状态）来提供点击反馈，而非改变物理高度。

## 形状
本系统采用 **柔和 (Soft)** 的形状语言，默认圆角设定为 `0.25rem (4px)`。

这种小半径圆角能比直角更具现代感，同时比大圆角（Pill-shaped）更具“工具感”和“工业感”。它能有效利用屏幕空间，在卡片堆叠时保持整齐的视觉线。
*   **小型组件 (按钮、输入框):** 4px 圆角。
*   **容器组件 (卡片、弹窗):** 8px 圆角。
*   **状态标签 (Chips):** 2px 或完全直角，以强调其指示性功能。

## 组件
本系统的组件设计遵循“操作优先”原则：

*   **按钮 (Buttons):** 采用实色填充。主操作按钮使用 Primary Blue，确保在页面中最为醒目。取消或次要操作使用线性按钮。
*   **输入框 (Input Fields):** 强化焦点状态（Focus State），使用 2px 的主色边框。带有清晰的清除按钮和扫码快捷入口图标。
*   **列表 (Lists):** 提供高对比度的条目分割，包含 SKU 图片缩略图、名称、库存数量（重点突出）和库位编号。
*   **标签 (Chips):** 用于显示货品状态（如“待拣选”、“已冻结”），文字颜色与背景色保持高对比。
*   **数据卡片 (Cards):** 用于展示库位概览，重要数字（如库存总数）使用 `display-lg` 字号。
*   **扫码反馈 (Scanner UI):** 扫描成功时屏幕边缘闪烁绿色，失败时闪烁红色并伴随振动反馈，确保非视觉关注下的操作确认。