# RouteMate_F
RouteMate前端

## 主要功能

### 1. 用户认证

- **实现文件**：`auth_provider.dart`, `auth_service.dart`, `login_screen.dart`, `register_screen.dart`
- **对应后端 URL**：
  - `POST /auth/login`：用户登录，获取 JWT。
  - `POST /auth/register`：用户注册，创建新账号。
- **功能**：处理用户登录和注册，向后端发送认证请求，并通过 JWT 管理用户的认证状态。

### 2. 轨迹管理

- **实现文件**：`trajectory_provider.dart`, `trajectory_service.dart`, `history_screen.dart`, `amap_service.dart`
- **对应后端 URL**：
  - `POST /track/upload`：上传用户轨迹数据。
  - `POST /track/analyze`：分析用户轨迹，返回热点区域。
  - `GET /track/history`：获取用户历史轨迹。
- **功能**：从高德 API 获取轨迹数据，将其上传至后端，并显示分析结果。用户可以查看历史轨迹。

### 3. 推荐系统

- **实现文件**：`recommendation_provider.dart`, `recommendation_service.dart`, `poi_recommendation_screen.dart`, `carpool_screen.dart`
- **对应后端 URL**：
  - `POST /recommendations/poi`：根据用户当前位置推荐 POI。
  - `POST /recommendations/carpool`：根据用户轨迹推荐拼车伙伴。
- **功能**：根据用户当前位置获取 POI 推荐，并展示拼车推荐结果。POI 和拼车推荐数据通过自定义卡片（`poi_card.dart` 和 `carpool_card.dart`）展示。

### 4. 高德地图集成

- **实现文件**：`amap_service.dart`, `poi_recommendation_screen.dart`, `history_screen.dart`
- **功能**：通过高德地图 API 实现用户定位、历史轨迹显示及 POI 推荐的可视化展示。目前尚存在以下问题：
  - **未解决的问题**：在 `amap_service.dart` 中，高德 API 的部分功能（例如 API key 的正确配置、准确的定位选项设置）尚未完全解决，需根据高德官方文档进行调整和优化。

## 未解决问题

- **高德地图 API**：当前部分高德 API 集成未完全解决，例如定位配置、API key 设置等。这部分代码需进一步调试和完善，确保定位和轨迹数据的准确性。

## 依赖的后端 URL

前端依赖后端提供的 RESTful API 进行数据交互，包括：
- **用户认证**：`/auth/login`, `/auth/register`
- **轨迹管理**：`/track/upload`, `/track/analyze`, `/track/history`
- **推荐系统**：`/recommendations/poi`, `/recommendations/carpool`

确保前后端 API 一致性，才能实现完整的功能交互。
